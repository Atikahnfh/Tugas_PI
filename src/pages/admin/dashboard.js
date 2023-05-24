import { useState, useEffect } from 'react';
import Navbar from '../components/navbar';
import Sidebar from '../components/sidebar';
import { useRouter } from 'next/router';

import Link from 'next/link';

function Dashboard() {
    const [beasiswas, setBeasiswas] = useState([]);
    const itemsPerPage = 4;
    const [currentPage, setCurrentPage] = useState(1);
    const router = useRouter();


    useEffect(() => {
        const getData = async () => {
            try {
                const response = await fetch('http://localhost:8000/api/v1/beasiswas', {
                    headers: { Authorization: 'Bearer 14|AVS8XBLWFWCyDclmpaTPF3qZBs5p2XVJOn4lyMmT' },
                });
                const objek = await response.json();
                console.log(objek.data);
                setBeasiswas(objek.data);
            } catch (error) {
                console.log(error);
            }
        };

        getData();
    }, []);

    const totalPages = Math.ceil(beasiswas.length / itemsPerPage);

    const startIndex = (currentPage - 1) * itemsPerPage;
    const endIndex = startIndex + itemsPerPage;
    const slicedBeasiswas = beasiswas.slice(startIndex, endIndex);

    const goToPage = (page) => {
        setCurrentPage(page);
    };

    const goToPreviousPage = () => {
        if (currentPage > 1) {
            setCurrentPage((prevPage) => prevPage - 1);
        }
    };

    const goToNextPage = () => {
        if (currentPage < totalPages) {
            setCurrentPage((prevPage) => prevPage + 1);
        }
    };

    return (
        <>
            <Navbar />
            <Sidebar/>

            <div class="p-4 sm:ml-64 mt-20">
                <div class="p-4 border-2 border-gray-200 border-dashed rounded-lg dark:border-gray-700">
                    <div class="grid grid-cols-3 gap-4 mb-4">
                        <div class="flex items-center justify-center h-24 rounded bg-gray-50 dark:bg-gray-800">
                            <p class="text-2xl text-gray-400 dark:text-gray-500">+</p>
                        </div>
                        <div class="flex items-center justify-center h-24 rounded bg-gray-50 dark:bg-gray-800">
                            <p class="text-2xl text-gray-400 dark:text-gray-500">+</p>
                        </div>
                        <div class="flex items-center justify-center h-24 rounded bg-gray-50 dark:bg-gray-800">
                            <p class="text-2xl text-gray-400 dark:text-gray-500">+</p>
                        </div>
                    </div>
                    <div class="flex items-center justify-center h-48 mb-4 rounded bg-gray-50 dark:bg-gray-800">
                        {/* table */}
                        <table className="min-w-full min-h-full bg-white border border-blue-600 mx-auto ">
                            <thead>
                                <tr>
                                    <th className="py-2 px-4 border-b">Nama Beasiswa</th>
                                    <th className="py-2 px-4 border-b">Semester Minimal</th>
                                    <th className="py-2 px-4 border-b">Semester Maksimal</th>
                                </tr>
                            </thead>
                            <tbody>
                                {slicedBeasiswas.map((beasiswa) => (
                                    <tr key={beasiswa.idBeasiswa}>
                                        <td className="py-2 px-4 border-b">{beasiswa.namaBeasiswa}</td>
                                        <td className="py-2 px-4 border-b">{beasiswa.semMin}</td>
                                        <td className="py-2 px-4 border-b">{beasiswa.semMax}</td>
                                    </tr>
                                ))}
                            </tbody>
                        </table>
                    </div>
                    {/* Pagination */}
                    <div className="flex justify-center mt-4">
                        <button
                            onClick={goToPreviousPage}
                            disabled={currentPage === 1}
                            className="px-4 py-2 bg-blue-500 text-white rounded-lg mr-4"
                        >
                            Previous
                        </button>
                        {Array.from({ length: totalPages }, (_, index) => (
                            <button
                                key={index}
                                onClick={() => goToPage(index + 1)}
                                className={`px-4 py-2 rounded-lg ${currentPage === index + 1 ? 'bg-blue-500 text-white' : 'bg-white text-black'
                                    }`}
                            >
                                {index + 1}
                            </button>
                        ))}
                        <button
                            onClick={goToNextPage}
                            disabled={currentPage === totalPages}
                            className="px-4 py-2 bg-blue-500 text-white rounded-lg ml-4"
                        >
                            Next
                        </button>
                    </div>
                        {/* table  */}
                    </div>
                    {/* <div class="grid grid-cols-2 gap-4 mb-4">
                        <div class="flex items-center justify-center rounded bg-gray-50 h-28 dark:bg-gray-800">
                            <p class="text-2xl text-gray-400 dark:text-gray-500">+</p>
                        </div>
                        <div class="flex items-center justify-center rounded bg-gray-50 h-28 dark:bg-gray-800">
                            <p class="text-2xl text-gray-400 dark:text-gray-500">+</p>
                        </div>
                        <div class="flex items-center justify-center rounded bg-gray-50 h-28 dark:bg-gray-800">
                            <p class="text-2xl text-gray-400 dark:text-gray-500">+</p>
                        </div>
                        <div class="flex items-center justify-center rounded bg-gray-50 h-28 dark:bg-gray-800">
                            <p class="text-2xl text-gray-400 dark:text-gray-500">+</p>
                        </div>
                    </div>
                    <div class="flex items-center justify-center h-48 mb-4 rounded bg-gray-50 dark:bg-gray-800">
                        <p class="text-2xl text-gray-400 dark:text-gray-500">+</p>
                    </div>
                    <div class="grid grid-cols-2 gap-4">
                        <div class="flex items-center justify-center rounded bg-gray-50 h-28 dark:bg-gray-800">
                            <p class="text-2xl text-gray-400 dark:text-gray-500">+</p>
                        </div>
                        <div class="flex items-center justify-center rounded bg-gray-50 h-28 dark:bg-gray-800">
                            <p class="text-2xl text-gray-400 dark:text-gray-500">+</p>
                        </div>
                        <div class="flex items-center justify-center rounded bg-gray-50 h-28 dark:bg-gray-800">
                            <p class="text-2xl text-gray-400 dark:text-gray-500">+</p>
                        </div>
                        <div class="flex items-center justify-center rounded bg-gray-50 h-28 dark:bg-gray-800">
                            <p class="text-2xl text-gray-400 dark:text-gray-500">+</p>
                        </div>
                    </div>
                </div> */}
            </div>                
        </>
    );
}

export default Dashboard;
