import Link from 'next/link';
import Navbar from '../components/navbar';

import React, { Children } from 'react';

const Cek = () => {
  return (
    <><Navbar /><section id="search" class="dark:bg-dark">

      <div class="mt-16 bg-dark container max-w-screen">
        <div class=" pt-12 h-72 flex flex-wrap items-center justify-center">
          <form class="flex items-center">
            <h3 class="font-bold text-3xl text-slate-200 mt-12 -ml-5">Check your eligibility here</h3>
            <div class="absolute ml-2 mx-20 mt-5">
              <input type="text" id="simple-search" class="mb-20  w-72 py-4 px-8 bg-white border border-gray-300 text-gray-900 text-sm rounded-full focus:ring-blue-500 focus:border-blue-500 block dark:bg-slate-200 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" placeholder="fill with your student id" required />
            </div>
            <button type="submit" class="p-3 -ml-14 mb-16 text-sm font-medium text-white bg-red-300 rounded-full border border-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">
              <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"></path></svg>
            </button>
          </form>
        </div>
      </div>
    </section></>
  );
};

export default Cek;