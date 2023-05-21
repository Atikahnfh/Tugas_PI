import React from 'react';

const Client = ({children}) => {
  return (
    
    <section id="clients" class="pt-36 pb-32 bg-slate-800 dark:bg-slate-300">
        <div class="container">
            <div class="w-full px-4">
                <div class="mx-auto text-center mb-16">
                    <h4 class="font-semibold text-lg text-primary mb-2">Universitas</h4>
                    <h2 class="font-bold text-white text-3xl mb-4 sm:text-4xl lg:text-5xl dark:text-dark">Universitas yang Berkejasama</h2>
                    <p class="font-medium text-md text-secondary md:text-lg">Temukan universitasmu disini</p>
                </div>
            </div> 
            <div class="w-full px-4">
                <div class="flex flex-wrap items-center justify-center">
                    <a href="https://www.usu.ac.id/id">
                        <img src="/images/usu.png" alt="usu" class="max-w-[120px] mx-4 py-4 grayscale opacity-60 transition duration-500 hover:grayscale-0 hover:opacity-100 lg:mx-6 xl:mx-8"/>
                    </a>
                    <a href="https://www.ui.ac.id/">
                        <img src="/images/ui.png" alt="ui" class="max-w-[120px] mx-4 py-4 grayscale opacity-60 transition duration-500 hover:grayscale-0 hover:opacity-100 lg:mx-6 xl:mx-8"/>
                    </a>
                    <a href="https://www.ugm.ac.id/">
                        <img src="/images/ugm.png" alt="ugm" class="max-w-[120px] mx-4 py-4 grayscale opacity-60 transition duration-500 hover:grayscale-0 hover:opacity-100 lg:mx-6 xl:mx-8"/>
                    </a>
                    <a href="https://www.itb.ac.id/">
                        <img src="/images/itb.png" alt="itb" class="max-w-[120px] mx-4 py-4 grayscale opacity-60 transition duration-500 hover:grayscale-0 hover:opacity-100 lg:mx-6 xl:mx-8"/>
                    </a>           
                </div>
            </div>
        </div>
    </section>


  );
};

export default Client;