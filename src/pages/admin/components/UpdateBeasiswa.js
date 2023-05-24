import { useState, useEffect } from 'react';
import { useRouter } from 'next/router';
import Navbar from '../../components/navbar';
import Sidebar from '../../components/sidebar';
import Link from 'next/link';

function UpdateBeasiswa() {
  const [beasiswa, setBeasiswa] = useState(null);
  const router = useRouter();
  const { id } = router.query;

  useEffect(() => {
    const fetchData = async () => {
      try {
        const response = await fetch(`http://localhost:8000/api/v1/beasiswas/${id}`, {
          headers: { Authorization: 'Bearer 14|AVS8XBLWFWCyDclmpaTPF3qZBs5p2XVJOn4lyMmT' },
        });
        const data = await response.json();
        setBeasiswa(data);
      } catch (error) {
        console.log(error);
      }
    };

    fetchData();
  }, [id]);

  const handleUpdate = async () => {
    try {
      const response = await fetch(`http://localhost:8000/api/v1/beasiswas/${id}`, {
        method: 'PATCH',
        headers: {
          'Content-Type': 'application/json',
          Authorization: 'Bearer 14|AVS8XBLWFWCyDclmpaTPF3qZBs5p2XVJOn4lyMmT',
        },
        body: JSON.stringify(beasiswa),
      });

      if (response.ok) {
        // Data berhasil diupdate, lakukan aksi selanjutnya (misalnya mengarahkan kembali ke halaman beasiswa)
        router.push('/admin/beasiswa');
      } else {
        // Penanganan jika terjadi kesalahan
        console.log('Gagal mengupdate data');
      }
    } catch (error) {
      console.log(error);
    }
  };

  const handleChange = (e) => {
    const { name, value } = e.target;
    setBeasiswa((prevBeasiswa) => ({
      ...prevBeasiswa,
      [name]: value,
    }));
  };

  if (!beasiswa) {
    return <div>Loading...</div>;
  }

  return (
    <div>
      <h1>Update Beasiswa</h1>
      <form>
        <div>
          <label>Nama Beasiswa:</label>
          <input type="text" name="namaBeasiswa" value={beasiswa.namaBeasiswa} onChange={handleChange} />
        </div>
        <div>
          <label>Semester Minimal:</label>
          <input type="number" name="semMin" value={beasiswa.semMin} onChange={handleChange} />
        </div>
        <div>
          <label>Semester Maksimal:</label>
          <input type="number" name="semMax" value={beasiswa.semMax} onChange={handleChange} />
        </div>
        <button type="button" onClick={handleUpdate}>
          Update
        </button>
      </form>
    </div>
  );
}

export default UpdateBeasiswa;

