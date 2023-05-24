import Link from 'next/link';
import Navbar from '../components/navbar';
import { useState, useEffect } from 'react';
import React from 'react';
import Footer from '../components/footer';

function Beasiswa() {
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
            <section id="portfolio" class="pt-36 pb-16 dark:bg-slate-800">
                <div class=" container max-w-screen relative mt-8">
                    <div class="w-full px-4 -mt-12">
                        <div class="max-w-xl mx-auto text-center mb-8">
                            <h4 class="font-semibold text-lg text-primary mb-2">Beasiswa</h4>
                            <h2 class="font-bold text-dark text-3xl mb-4 sm:text-4xl lg:text-5xl dark:text-white">Beasiswa Terbaru</h2>
                            <p class="font-medium text-md text-secondary md:text-lg">Jelajahi informasi terbaru beasiswa dan jadilah awardee beasiswa dari beasiswa-beasiswa terbaik di dunia.</p>
                        </div>
                    </div>

                    <div class="w-full px-4 flex flex-wrap justify-center xl:w-10/12 xl:mx-auto">
                        {beasiswas.slice(0, 4).map((beasiswa) => (
                            <div class="mb-12 p-4 md:w-1/2">
                                <div class="rounded-t-md shadow-md overflow-hidden bg-white ">
                                    <img src="https://img.freepik.com/premium-vector/3d-hand-throwing-graduation-hats-air_169241-7265.jpg" class="w-full h-64 mx-auto" alt="img1" />
                                </div>
                                <div class='bg-slate-200 rounded-b-lg px-8 -mt-5'>
                                <h3 class="font-semibold text-xl text-dark mt-5 mb-3 dark:text-slate-500">{beasiswa.namaBeasiswa}</h3>
                                <p class="font-medium text-justify text-base text-secondary -mt-4 pb-3">{beasiswa.deskripsi}</p>
                                </div>
                             </div>
                        ))};
                    </div>
                </div>
                <div class="mx-96 justify-center pl-44 -mt-8 pb-8">
                    <Link href="/posts/daftarbeasiswa" class="text-base font-semibold text-white bg-primary py-3 px-8 rounded-full hover:shadow-lg hover:opacity-80 trasition duration-300 ease-in-out justify-center">Lihat Selengkapnya</Link>
                </div>
            </section>

            {/* <div className="flex flex-wrap mx-36 mt-12">
                        {beasiswas.slice(0, 4).map((beasiswa) => (
                    <div className="card-body my-2 mx-2 bg-dark w-80 p-2 block" key={beasiswa.idBeasiswa}>
                        <div className="pl-4 pr-4 pt-12 pb-10 w-64 h-32 text-center text-white font-bold">
                            <Link href={`/posts/detailbeasiswa?id=${beasiswa.idBeasiswa}`} className="text-base font-semibold text-white bg-primary p-4 hover:shadow-lg hover:opacity-80 transition duration-300 ease-in-out shadow-md rounded-full">
                                <b>{beasiswa.namaBeasiswa}</b>
                            </Link>
                        </div>
                    </div>
                ))}
                    </div> */}
        </>
    );
}

export default Beasiswa;
