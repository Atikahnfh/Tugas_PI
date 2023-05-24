import { useState } from 'react';
import { useRouter } from 'next/router';
import Navbar from '@/pages/components/navbar';
import Sidebar from '@/pages/components/sidebar';

function AddBeasiswa() {
  const [namaBeasiswa, setNamaBeasiswa] = useState('');
  const [mitraId, setMitraId] = useState('');
  const [deskripsi, setDeskripsi] = useState('');
  const [angkatanAwal, setAngkatanAwal] = useState('');
  const [angkatanAkhir, setAngkatanAkhir] = useState('');
  const [semMin, setSemMin] = useState('');
  const [semMax, setSemMax] = useState('');
  const [status, setStatus] = useState('');
  const router = useRouter();

  const handleSubmit = async (e) => {
    e.preventDefault();
    try {
      const response = await fetch('http://localhost:8000/api/v1/beasiswas', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          Authorization: 'Bearer 14|AVS8XBLWFWCyDclmpaTPF3qZBs5p2XVJOn4lyMmT',
        },
        body: JSON.stringify({
            namaBeasiswa,
            mitraId,
            deskripsi,
            angkatanAwal,
            angkatanAkhir,
            semMin,
            semMax,
            status,
          }),
      });

      if (response.ok) {
        // Data berhasil ditambahkan, lakukan aksi selanjutnya (misalnya mengarahkan pengguna ke halaman lain)
        router.push('/admin/beasiswa');
      } else {
        // Penanganan jika terjadi kesalahan
        console.log('Gagal menambahkan data');
      }
    } catch (error) {
      console.log(error);
    }
  };

  return (
    <>
      <Navbar />
      <Sidebar />
      <div className="p-4 sm:ml-64 mt-20 ">
        <h1 className="text-2xl font-bold mb-4">Add Beasiswa</h1>
        <form onSubmit={handleSubmit}>
          <div className="mb-4">
            <label htmlFor="namaBeasiswa" className="block font-semibold mb-1">
              Nama Beasiswa
            </label>
            <input
              type="text"
              id="namaBeasiswa"
              value={namaBeasiswa}
              onChange={(e) => setNamaBeasiswa(e.target.value)}
              className="border border-gray-300 px-3 py-2 rounded"
              required
            />
          </div>
          <div className="mb-4">
            <label htmlFor="semMin" className="block font-semibold mb-1">
              Mitra id
            </label>
            <input
              type="number"
              id="semMin"
              value={mitraId}
              onChange={(e) => setMitraId(e.target.value)}
              className="border border-gray-300 px-3 py-2 rounded"
              required
            />
          </div>
          <div className="mb-4">
            <label htmlFor="semMax" className="block font-semibold mb-1">
              Deskripsi
            </label>
            <input
              type="text"
              id="semMax"
              value={deskripsi}
              onChange={(e) => setDeskripsi(e.target.value)}
              className="border border-gray-300 px-3 py-2 rounded"
              required
            />
          </div>
          <div className="mb-4">
            <label htmlFor="semMax" className="block font-semibold mb-1">
              Angkatan Awal
            </label>
            <input
              type="text"
              id="semMax"
              value={angkatanAwal}
              onChange={(e) => setAngkatanAwal(e.target.value)}
              className="border border-gray-300 px-3 py-2 rounded"
              required
            />
          </div>
          <div className="mb-4">
            <label htmlFor="semMax" className="block font-semibold mb-1">
              Angkatan Akhir
            </label>
            <input
              type="text"
              id="semMax"
              value={angkatanAkhir}
              onChange={(e) => setAngkatanAkhir(e.target.value)}
              className="border border-gray-300 px-3 py-2 rounded"
              required
            />
          </div>
          <div className="mb-4">
            <label htmlFor="semMax" className="block font-semibold mb-1">
              Semester Minimal
            </label>
            <input
              type="number"
              id="semMin"
              value={semMin}
              onChange={(e) => setSemMin(e.target.value)}
              className="border border-gray-300 px-3 py-2 rounded"
              required
            />
          </div>
          <div className="mb-4">
            <label htmlFor="semMax" className="block font-semibold mb-1">
              Semester Maksimal
            </label>
            <input
              type="number"
              id="semMax"
              value={semMax}
              onChange={(e) => setSemMax(e.target.value)}
              className="border border-gray-300 px-3 py-2 rounded"
              required
            />
          </div>
          <div className="mb-4">
            <label htmlFor="semMax" className="block font-semibold mb-1">
              Status
            </label>
            <input
              type="text"
              id="status"
              value={status}
              onChange={(e) => setStatus(e.target.value)}
              className="border border-gray-300 px-3 py-2 rounded"
              required
            />
          </div>
          {/* <div className="mb-4">
            <label htmlFor="semMax" className="block font-semibold mb-1">
              Nama Mitra
            </label>
            <input
              type="text"
              id="namaMitra"
              value={namaMitra}
              onChange={(e) => setNamaMitra(e.target.value)}
              className="border border-gray-300 px-3 py-2 rounded"
              required
            />
          </div> */}
          <button type="submit" className="px-4 py-2 bg-green-500 text-white rounded-lg">
            Add
          </button>
          {/* <button onClick={() => router.push('/admin/beasiswa')} className="px-4 py-2 bg-blue-500 text-white rounded-lg ml-2">
            AddBeasiswa
          </button> */}
        </form>
      </div>
    </>
  );
}

export default AddBeasiswa;
