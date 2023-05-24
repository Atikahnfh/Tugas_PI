import Link from 'next/link';
import Navbar from '../components/navbar';
import { useState, useEffect } from 'react';
import React from 'react';
import Footer from '../components/footer';

function DaftarBeasiswa() {
    const [beasiswas, setBeasiswas] = useState([]);

    useEffect(() => {
        const getData = async () => {
            try {
                const response = await fetch('http://localhost:8000/api/v1/beasiswas', { headers: { Authorization: 'Bearer 14|AVS8XBLWFWCyDclmpaTPF3qZBs5p2XVJOn4lyMmT' } });
                const objek = await response.json();
                console.log(objek.data);
                setBeasiswas(objek.data);
            } catch (error) {
                console.log(error);
            }
        };

        getData();
    }, []);

    return (
        <>
            <Navbar />
            <h1 className="mt-20 ml-10 mb-8 font-bold text-2xl">Daftar Beasiswa</h1>
            <Link href={`/`} className="text-base font-semibold text-white ml-10 mt-20 bg-primary p-2 hover:shadow-lg hover:opacity-80 transition duration-300 ease-in-out shadow-md rounded-lg">
                kembali
            </Link>

            <div class="w-full px-8 py-8 flex flex-wrap justify-center xl:w-10/12 xl:mx-auto bg-slate-400 mt-20">
                {beasiswas.map((beasiswa) => (
                    <div class="mb-3 p-4 md:w-1/2">
                        <div class="rounded-t-md shadow-md overflow-hidden bg-white ">
                            <img src="https://img.freepik.com/premium-vector/3d-hand-throwing-graduation-hats-air_169241-7265.jpg" class="w-full h-64 mx-auto" alt="img1" />
                        </div>
                        <div class='bg-slate-100 rounded-b-lg px-8 py-6 -mt-5'>
                            <h3 class="font-semibold text-xl text-dark mt-5 mb-3 dark:text-slate-500">
                                <Link href={`/posts/detailbeasiswa?id=${beasiswa.idBeasiswa}`} className="text-base font-semibold text-primary  hover:shadow-lg hover:opacity-80 transition duration-300 ease-in-out shadow-xs ">
                                    {beasiswa.namaBeasiswa}
                                </Link>
                            </h3>
                            <p class="font-medium text-justify text-base text-secondary -mt-4 pt-5 pb-3">{beasiswa.deskripsi}</p>
                        </div>
                    </div>
                ))};
            </div>
            {/* <div className='mx-auto bg-green-200 items-center'>
            <div className="flex flex-wrap mx-24 mt-12">
                {beasiswas.map((beasiswa) => (
                    <div className="card-body my-2 mx-2 bg-dark w-80 p-2 block" key={beasiswa.idBeasiswa}>
                        <div className="pl-4 pr-4 pt-12 pb-10 w-64 h-32 text-center text-white font-bold">
                            <Link href={`/posts/detailbeasiswa?id=${beasiswa.idBeasiswa}`} className="text-base font-semibold text-white bg-primary p-4 hover:shadow-lg hover:opacity-80 transition duration-300 ease-in-out shadow-md ">
                                <b>{beasiswa.namaBeasiswa}</b>
                            </Link>
                        </div>
                    </div>
                ))}
            </div>
            </div> */}
        </>
    );
}

export default DaftarBeasiswa;
