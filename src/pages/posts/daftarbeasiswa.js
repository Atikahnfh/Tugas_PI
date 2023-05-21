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
            <h1 className="mt-20 ml-10 font-bold text-2xl">Daftar Beasiswa</h1>
            <div className="flex flex-wrap mx-36 mt-12">
                {beasiswas.map((beasiswa) => (
                    <div className="card-body my-2 mx-2 bg-dark w-80 p-2 block" key={beasiswa.idBeasiswa}>
                        <div className="pl-4 pr-4 pt-12 pb-10 w-64 h-32 text-center text-white font-bold">
                            <Link href={`/posts/detailbeasiswa?id=${beasiswa.idBeasiswa}`} className="text-base font-semibold text-white bg-primary p-4 hover:shadow-lg hover:opacity-80 transition duration-300 ease-in-out shadow-md rounded-full">
                                <b>{beasiswa.namaBeasiswa}</b>
                            </Link>
                        </div>
                    </div>
                ))}
            </div>
            <Footer />
        </>
    );
}

export default DaftarBeasiswa;
