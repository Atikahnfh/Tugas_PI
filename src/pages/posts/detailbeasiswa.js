import { useRouter } from 'next/router';
import Navbar from '../components/navbar';
import { useState, useEffect } from 'react';
import React from 'react';

function DetailBeasiswa() {
  const router = useRouter();
  const { id } = router.query;
  const [beasiswa, setBeasiswa] = useState(null);

  useEffect(() => {
    const fetchData = async () => {
      try {
        const response = await fetch(`http://localhost:8000/api/v1/beasiswas/${id}`, {
          headers: {
            Authorization: 'Bearer 14|AVS8XBLWFWCyDclmpaTPF3qZBs5p2XVJOn4lyMmT'
          }
        });
        const data = await response.json();
        console.log(data);
        setBeasiswa(data);
      } catch (error) {
        console.log(error);
      }
    };

    if (id) {
      fetchData();
    }
  }, [id]);

  if (!beasiswa) {
    return <div>Loading...</div>;
  }

  return (
    <>
      <Navbar />
      <h1 className="mt-20 ml-10 font-bold text-2xl">Detail Beasiswa</h1>
      <div className="flex flex-wrap mx-36 mt-12">
        <div className="card-body my-2 mx-2 bg-dark w-80 p-2 block">
          <div className="pl-4 pr-4 pt-12 pb-10 w-64 h-32 text-center text-white font-bold">
            <h2>{beasiswa.namaBeasiswa}</h2>
            <p>{beasiswa.deskripsi}</p>
            <p>{beasiswa.semMin}</p>
            <p>{beasiswa.semMax}</p>
            <span className="px-2 inline-flex text-xs leading-5 font-semibold rounded-full bg-green-100 text-green-800">
              {beasiswa.status}
            </span>
          </div>
        </div>
      </div>
    </>
  );
}

export default DetailBeasiswa;
