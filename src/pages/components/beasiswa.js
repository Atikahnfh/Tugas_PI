import Link from 'next/link';
import React from 'react';

const Beasiswa = ({ children }) => {
    return (

        <section id="portfolio" class="pt-36 pb-16 dark:bg-slate-800">
            <div class=" container max-w-screen relative mt-20">
                <div class="w-full px-4">
                    <div class="max-w-xl mx-auto text-center mb-16">
                        <h4 class="font-semibold text-lg text-primary mb-2">Beasiswa</h4>
                        <h2 class="font-bold text-dark text-3xl mb-4 sm:text-4xl lg:text-5xl dark:text-white">Beasiswa Terbaru</h2>
                        <p class="font-medium text-md text-secondary md:text-lg">Jelajahi informasi terbaru beasiswa dan jadilah awardee beasiswa dari beasiswa-beasiswa terbaik di dunia.</p>
                    </div>
                </div>
                <div class="w-full px-4 flex flex-wrap justify-center xl:w-10/12 xl:mx-auto">
                    <div class="mb-12 p-4 md:w-1/2">
                        <div class="rounded-md shadow-md overflow-hidden">
                            <img src="/images/kse.png" class="w-full" alt="Landing Page" />
                        </div>
                        <h3 class="font-semibold text-xl text-dark mt-5 mb-3 dark:text-white">Karya Salemba Empat</h3>
                        <p class="font-medium text-justify text-base text-secondary">Memberikan Beasiswa kepada siswa di 35 Perguruan Tinggi Negeri dengan berbagai program beasiswa seperti Reguler, Unggul, Skripsi, Akademi Kewirausahaan, dan Technology For Indonesia.</p>
                    </div>
                    <div class="mb-12 p-4 md:w-1/2">
                        <div class="rounded-md shadow-md overflow-hidden">
                            <img src="/images/genbi.jpg" alt="E-Commerce" width="w-full" />
                        </div>
                        <h3 class="font-semibold text-xl text-dark mt-5 mb-3 dark:text-white">Beasiswa Bank Indonesia</h3>
                        <p class="font-medium text-justify text-base text-secondary">Beasiswa Bank Indonesia merupakan beasiswa yang diberikan oleh Bank Indonesia bagi para mahasiswa S1 di PTN & PTS serta pelajar SMK terpilih. Melalui beasiswa ini, BI akan memberikan bantuan untuk biaya pendidikan, tunjangan studi, dan juga biaya hidup.</p>
                    </div>
                    <div class="mb-12 p-4 md:w-1/2">
                        <div class="rounded-md shadow-md overflow-hidden">
                            <img src="/images/bu.jpg" alt="Technical Documention" width="w-full" />
                        </div>
                        <h3 class="font-semibold text-xl text-dark mt-5 mb-3 dark:text-white">Beasiswa Unggulan</h3>
                        <p class="font-medium text-justify text-base text-secondary ">Merupakan beasiswa dalam negeri untuk jenjang Sarjana, Magister dan Doktoral. Beasiswa Unggulan Masyarakat Berprestasi dapat diikuti oleh calon mahasiswa yang sudah memiliki surat diterima di perguruan tinggi maupun mahasiswa yang sudah melangsungkan perkuliahan maksimal semester 3 (semua jenjang) pada saat mendaftar.</p>
                    </div>
                    <div class="mb-12 p-4 md:w-1/2">
                        <div class="rounded-md shadow-md overflow-hidden">
                            <img src="/images/rk.png" alt="Tribute Page" width="w-full" />
                        </div>
                        <h3 class="font-semibold text-xl text-dark mt-5 mb-3 dark:text-white">Beasiswa Rumah Kepemimpinan</h3>
                        <p class="font-medium text-justify text-base text-secondary">Rumah Kepemimpinan adalah sebuah organisasi yang bersifat non-partisan, non-profit, terbuka, profesional, relijius, dan kebersamaan yang berada di bawah naungan Yayasan Bina Nurul Fikri. Semua kegiatannya disampaikan kepada publik secara terbuka dan bertanggung jawab serta seluruh hasil kegiatannya dipersembahkan untuk kepentingan bangsa dan negara.</p>
                    </div>
                </div>
            </div>
            <div class="mx-96 justify-center pl-44">
                <Link href="/posts/daftarbeasiswa" class="text-base font-semibold text-white bg-primary py-3 px-8 rounded-full hover:shadow-lg hover:opacity-80 trasition duration-300 ease-in-out justify-center">Lihat Selengkapnya</Link>
            </div>

        </section>

    );
};

export default Beasiswa;