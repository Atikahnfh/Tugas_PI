import React from 'react';
import Link from 'next/link';

const Navbar = () => {
  return (
    <header class="bg-transparent absolute top-0 left-0 w-full flex items-center z-10">
        <div class="container">
            <div class="flex items-center justify-between relative">
                <div class="px-4">
                    <a href="#home" class="font-bold text-lg text-primary block py-6">Scholarfy</a>
                </div>
                <div class="flex items-center">
                    <button id="hamburger" name="hamburger" type="button" class="block absolute right-4 lg:hidden">
                        <span class="hamburger-line transition duration-300 ease-in-out origin-top-left"></span>
                        <span class="hamburger-line transition duration-300 ease-in-out"></span>
                        <span class="hamburger-line transition duration-300 ease-in-out origin-bottom-left"></span>
                    </button>

                    <nav id="nav-menu" class="hidden absolute py-5 bg-white shadow-lg rounded-lg max-w-[250px] w-full right-4 top-full lg:block lg:static lg:bg-transparent lg:max-w-full lg:shadow-none lg:rounded-none dark:bg-dark lg:dark:bg-transparent dark:shadow-slate-800">
                        <ul class="block lg:flex">
                            <li class="group">
                                <Link href="/" class="text-base py-2 mx-8 flex group-hover:text-primary dark:text-dark">Beranda</Link>
                            </li>
                        
                            <li class="mt-3 flex items-center pl-8 lg:mt-0">
                                <div class="flex">
                                    <span class="mr-2 text-sm text-slate-500">Light</span>
                                    <input type="checkbox" name="dark-toggle" id="dark-toggle" class="hidden"/>
                                    <label for="dark-toggle">
                                        <div class="flex h-5 w-9 cursor-pointer items-center rounded-full bg-slate-500 p-1">
                                            <div class="toggle-circle h-4 w-4 rounded-full bg-white"></div>
                                        </div>
                                    </label>
                                    <span class="ml-2 text-sm text-slate-500">Dark</span>
                                </div>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </header>
  );
};

export default Navbar;