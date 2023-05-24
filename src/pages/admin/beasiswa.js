import { useState, useEffect } from 'react';
import Navbar from '../components/navbar';
import Sidebar from '../components/sidebar';
import { useRouter } from 'next/router';

import Link from 'next/link';

function Beasiswa() {
  const [beasiswas, setBeasiswas] = useState([]);
  const [pageMeta, setPageMeta] = useState({});
  const router = useRouter();

  const fetchData = async () => {
    try {
      const response = await fetch(`http://localhost:8000/api/v1/beasiswas?page=${pageMeta.current_page ?? 1}`, {
        headers: { Authorization: 'Bearer 14|AVS8XBLWFWCyDclmpaTPF3qZBs5p2XVJOn4lyMmT' },
      });
      const data = await response.json();
      setBeasiswas(data.data);
      if(pageMeta.current_page == null){
        setPageMeta(data.meta);
      }
    } catch (error) {
      console.log(error);
    }
  };

  useEffect(() => {
    fetchData();
  }, [pageMeta]);

  const goToPage = (page) => {
    setPageMeta((state) => ({...state, current_page: page}));
  };

  const goToPreviousPage = () => {
    if (pageMeta.current_page > 1) {
      setPageMeta((state) => ({...state, current_page: page - 1}));
    }
  };

  const goToNextPage = () => {
    if (pageMeta.current_page < pageMeta.last_page) {
      setPageMeta((state) => ({...state, current_page: page + 1})); 
    }
  };

  const deleteBeasiswa = async (idBeasiswa) => {
    try {
      const response = await fetch(`http://localhost:8000/api/v1/beasiswas/${idBeasiswa}`, {
        method: 'DELETE',
        headers: { Authorization: 'Bearer 14|AVS8XBLWFWCyDclmpaTPF3qZBs5p2XVJOn4lyMmT' },
      });

      if (response.ok) {
        // Data berhasil dihapus, lakukan aksi selanjutnya (misalnya mengupdate state)
        // Contoh: Hapus beasiswa dari state
        setBeasiswas((prevBeasiswas) => prevBeasiswas.filter((beasiswa) => beasiswa.idBeasiswa !== idBeasiswa));
      } else {
        // Penanganan jika terjadi kesalahan
        console.log('Gagal menghapus data');
      }
    } catch (error) {
      console.log(error);
    }
  };

  const addBeasiswa = async () => {
    try {
      // Simulate adding data
      const newBeasiswa = {
        idBeasiswa: beasiswas.length + 1,
        namaBeasiswa: 'New Beasiswa',
        semMin: 1,
        semMax: 8,
      };

      // Call the API to add the data
      const response = await fetch('http://localhost:8000/api/v1/beasiswas', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          Authorization: 'Bearer 14|AVS8XBLWFWCyDclmpaTPF3qZBs5p2XVJOn4lyMmT',
        },
        body: JSON.stringify(newBeasiswa),
      });

      if (response.ok) {
        // Data berhasil ditambah, lakukan aksi selanjutnya (misalnya mengupdate state)
        // Contoh: Tambah beasiswa ke state
        setBeasiswas((prevBeasiswas) => [...prevBeasiswas, newBeasiswa]);

        // Redirect to Beasiswa page to show the updated data
        router.push('/beasiswa');
      } else {
        // Penanganan jika terjadi kesalahan
        console.log('Gagal menambah data');
      }
    } catch (error) {
      console.log(error);
    }
  };

  const updateBeasiswa = (idBeasiswa) => {
    router.push(`/beasiswa/update/${idBeasiswa}`);
  };

  return (
    <>
      <Navbar />
      <Sidebar />
      <div className="p-4 border-2 border-gray-200 border-dashed rounded-lg dark:border-gray-700 -mt-80">
        
      <div className="p-4 sm:ml-64 mt-20">
        <button onClick={() => router.push('/admin/components/AddBeasiswa')} className="px-4 py-2 bg-green-500 text-white rounded-lg mb-5">
            Add
          </button>

          <div className="flex items-center justify-center  mb-4 rounded bg-gray-50 dark:bg-gray-800">
            {/* table */}
            <table className="min-w-full min-h-full bg-white border border-blue-600 mx-auto mt-10">
              <thead>
                <tr>
                  <th className="py-2 px-4 border-b">Nama Beasiswa</th>
                  <th className="py-2 px-4 border-b">Semester Minimal</th>
                  <th className="py-2 px-4 border-b">Semester Maksimal</th>
                  <th className="py-2 px-4 border-b">Aksi</th>
                </tr>
              </thead>
              <tbody>
                {beasiswas.map((beasiswa) => (
                  <tr key={beasiswa.idBeasiswa}>
                    <td className="py-2 px-4 border-b">{beasiswa.namaBeasiswa}</td>
                    <td className="py-2 px-4 border-b">{beasiswa.semMin}</td>
                    <td className="py-2 px-4 border-b">{beasiswa.semMax}</td>
                    <td className="py-2 px-4 border-b">
                      <button
                        onClick={() => router.push(`/admin/components/UpdateBeasiswa?id=${beasiswa.idBeasiswa}`)}
                        className="px-2 py-1 bg-blue-500 text-white rounded-lg mr-2"
                      >
                        Update
                      </button>
                      <button
                        onClick={() => deleteBeasiswa(beasiswa.idBeasiswa)}
                        className="px-2 py-1 bg-red-500 text-white rounded-lg"
                      >
                        Delete
                      </button>
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>

          {/* Pagination */}
          <div className="flex justify-center mt-16">
            <button
              onClick={goToPreviousPage}
              disabled={pageMeta.current_page === 1}
              className="px-4 py-2 bg-blue-500 text-white rounded-lg mr-4"
            >
              Previous
            </button>
            {Array.from({ length: pageMeta.last_page }, (_, index) => (
              <button
                key={index}
                onClick={() => goToPage(index + 1)}
                className={`px-4 py-2 rounded-lg ${
                  pageMeta.current_page === index + 1 ? 'bg-blue-500 text-white' : 'bg-white text-black'
                }`}
              >
                {index + 1}
              </button>
            ))}
            <button
              onClick={goToNextPage}
              disabled={pageMeta.current_page === pageMeta.last_page}
              className="px-4 py-2 bg-blue-500 text-white rounded-lg ml-4"
            >
              Next
            </button>
          </div>
        </div>
      </div>
    </>
  );
}

export default Beasiswa;
