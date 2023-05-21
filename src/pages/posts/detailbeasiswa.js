import { useRouter } from 'next/router';
import Navbar from '../components/navbar';
import { useState, useEffect } from 'react';
import React from 'react';
import Link from 'next/link';


function DetailBeasiswa() {
  const router = useRouter();
  const { id } = router.query;
  const [beasiswa, setBeasiswa] = useState(null);

  useEffect(() => {
    const fetchData = async () => {
      try {
        const response = await fetch(`http://localhost:8000/api/v1/beasiswas/${id}`, {
          method: 'GET',
          headers: {
            Authorization: 'Bearer 14|AVS8XBLWFWCyDclmpaTPF3qZBs5p2XVJOn4lyMmT'
          }
        });
        const data = await response.json();
        console.log(data);
        setBeasiswa(data.data);
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
      <h1 className="mt-20 mb-6 ml-16 font-bold text-2xl">Detail Beasiswa</h1>
      <Link href={`/posts/daftarbeasiswa`} className="text-base font-semibold text-white bg-primary p-4 hover:shadow-lg hover:opacity-80 transition duration-300 ease-in-out shadow-md rounded-lg mt-16 ml-16">Back</Link>
      <div className="flex flex-wrap justify-center mt-12 ">
        <div className="bg-white max-w-2xl shadow-xl overflow-hidden sm:rounded-lg">
          <div className="px-4 py-5 sm:px-6">
            <h3 className="text-lg leading-6 font-medium text-gray-900">
              Detail Beasiswa
            </h3>
          </div>
          <div className="border-t border-gray-200">
            <dl>
              <div className="bg-gray-50 px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
                <dt className="text-sm font-medium text-gray-500">
                  Nama Beasiswa
                </dt>
                <dd className="mt-1 text-sm text-gray-900 sm:mt-0 sm:col-span-2">
                  {beasiswa.namaBeasiswa}

                </dd>
              </div>
              <div className="bg-white px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
                <dt className="text-sm font-medium text-gray-500">
                  Deskripsi
                </dt>
                <dd className="mt-1 text-sm text-gray-900 sm:mt-0 sm:col-span-2">
                  {beasiswa.deskripsi}
                </dd>
              </div>
              <div className="bg-gray-50 px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
                <dt className="text-sm font-medium text-gray-500">
                  Semester Minimal

                </dt>
                <dd className="mt-1 text-sm text-gray-900 sm:mt-0 sm:col-span-2">
                  {beasiswa.semMin}
                </dd>
              </div>
              <div className="bg-gray-50 px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
                <dt className="text-sm font-medium text-gray-500">
                  Semester Minimal

                </dt>
                <dd className="mt-1 text-sm text-gray-900 sm:mt-0 sm:col-span-2">
                  {beasiswa.semMin}
                </dd>
              </div>
              <div className="bg-white px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
                <dt className="text-sm font-medium text-gray-500">
                  status
                </dt>
                <dd className="mt-1 text-sm text-gray-900 sm:mt-0 sm:col-span-2">
                  <span className="px-2 inline-flex text-xs leading-5 font-semibold rounded-full bg-green-100 text-green-800">
                    {beasiswa.status}
                  </span>
                </dd>
              </div>
            </dl>
          </div>
        </div>
      </div>

      {/* batas bawah */}

    </>
  );
}

export default DetailBeasiswa;
