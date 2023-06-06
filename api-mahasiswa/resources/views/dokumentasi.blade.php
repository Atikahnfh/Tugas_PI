<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>API Mahasiswa</title>
    @vite('resources/css/app.css')
    <script>
        if (localStorage.theme === 'dark' || (!('theme' in localStorage) && window.matchMedia('(prefers-color-scheme: dark)').matches)) {
        document.documentElement.classList.add('dark')
        } else {
        document.documentElement.classList.remove('dark')
        }
    </script>
</head>
<body class="dark:bg-dark">

    {{-- Header Section Start --}}
    @include('layout.header')
    {{-- Header Section End --}}


    {{-- Alert --}}
    @if (session('error'))
        @include('layout.error-alert')
    @endif
    {{-- End Alert --}}

    {{-- Documentation Section Start --}}
    <section id="about" class="pt-36 pb-32 dark:bg-dark">
        <div class="container">
            <div class="flex flex-wrap">
                <div class="w-full px-4 mb-10 lg:w-1/4 hidden lg:block">
                    <li>
                        <a href="#semua-mahasiswa">Semua Mahasiswa</a>
                    </li>
                    <li>
                        <a href="#satu-mahasiswa">Satu Mahasiswa</a>
                    </li>
                </div>
                <div class="w-full px-4 lg:w-3/4">
                    <div>
                        <h2 class="font-bold text-dark text-3xl mb-5 max-w-md lg:text-3xl dark:text-white">Dokumentasi API Mahasiswa</h2>
                        <div class="mt-8">
                            <h4 class="font-bold text-bold text-primary text-lg mb-3">👋🏻Introduction</h4>
                            <p class="text-base text-secondary max-w-3xl lg:tx-lg">Selamat datang di API Mahasiswa. API Mahasiswa ini dibangun menggunakan Framework Laravel v10.x dan TailwindCSS v3.3.2</p>

                            <h4 class="font-bold text-bold text-primary text-lg mt-4 mb-3">🚀Getting started with API Mahasiswa</h4>
                            <p class="text-base text-secondary max-w-3xl lg:tx-lg">Koleksi ini berisi dokumentasi menyeluruh dari API Mahasiswa. Mereka akan membantu Anda memahami kemampuan layanan yang kami miliki dan cara menggunakannya secara efektif.</p>
                        </div>
                    </div>
                    
                    <div class="mt-3 mb-5">
                        <h3 class="font-semibold text-dark text-xl mb-3 lg:text-2xl lg:pt-10 dark:text-white">Generete Token</h3>
                        <p class="text-base text-secondary max-w-3xl lg:tx-lg">Klik API Token pada navbar menu untuk men-generate API Token Mahasiswa. Kemudian token akan dikirimkan ke email yang ada masukkan pada field email</p>
                        <div class="mt-3 sm:max-w-sm">
                            <label for="email">
                                <span class="mt-4 leading-6 block text-[12px] font-medium mb-2 text-slate-700 dark:text-white">Email</span>
                                <input type="" name="email" id="email" value="email@mail.com" disabled class="disabled-input px-3 py-2 border shadow rounded w-full block text-[12px] placeholder:text-slate-400 focus:outline-none focus:ring-1 focus:ring-primary focus:border-primary dark:shadow-sm dark:shadow-slate-600 dark:bg-slate-50">
                            </label>
                        </div>
                    </div>

                    <div id="semua-mahasiswa" class="mt-3 mb-3">
                        <h3 class="font-semibold text-dark text-xl mb-3 lg:text-2xl lg:pt-10 dark:text-white"><span class="uppercase text-green-500">Get</span> Semua Mahasiswa</h3>
                        <p class="text-base text-secondary max-w-3xl lg:tx-lg">Request method ini berfungsi untuk mengambil seluruh data mahasiswa dari database</p>
                        <div class="mt-5">
                            <code class="bg-slate-50 px-4 py-2 shadow rounded-md break-all text-sm">http://localhost:8000/api/mahasiswa</code>

                            <div class="mt-5 dark:text-white">
                                <table class="border-collapse">
                                    <tr rowspan="2">
                                      <td class="border-b font-semibold text-md">Authorization <span class="font-medium text-secondary">Bearer Token</span></td>
                                      <td class="border-b font-semibold text-md"></td>
                                    </tr>
                                    <tr>
                                      <td class="pt-5 font-semibold text-sm">Token</td>
                                      <td class="pt-5 text-sm ">1|0pZP0tQaIFt212bhEDUamE7jy5Z1uJfhHcAFAAg1</td>
                                    </tr>
                                    
                                    <tr rowspan="2">
                                      <td class="pt-5 border-b font-semibold text-md">Request Headers</td>
                                      <td class="border-b font-semibold text-md"></td>
                                    </tr>
                                    <tr>
                                      <td class="pt-5 font-semibold text-sm">Accept</td>
                                      <td class="pt-5 text-sm ">application/vnd.api+json</td>
                                    </tr>
                                    <tr>
                                        <td class="pt-5 font-semibold text-sm">Content-Type</td>
                                        <td class="pt-5 text-sm ">application/vnd.api+json</td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>

                    <div id="satu-mahasiswa" class="mt-3 mb-3">
                        <h3 class="font-semibold text-dark text-xl mb-3 lg:text-2xl lg:pt-10 dark:text-white"><span class="uppercase text-green-500">Get</span> Satu Mahasiswa</h3>
                        <p class="text-base text-secondary max-w-3xl lg:tx-lg">Request method ini untuk mengambil satu data mahasiswa dari database berdasarkan nim yang diikutsertakan pada url</p>
                        <div class="mt-5">
                            <code class="bg-slate-50 px-4 py-2 shadow rounded-md break-all text-sm">http://localhost:8000/api/mahasiswa/{nim}</code>

                            <div class="mt-5 dark:text-white">
                                <table class="border-collapse">
                                    <tr rowspan="2">
                                        <td class="border-b font-semibold text-md">Authorization <span class="font-medium text-secondary">Bearer Token</span></td>
                                      <td class="border-b font-semibold text-md"></td>
                                    </tr>
                                    <tr>
                                      <td class="pt-5 font-semibold text-sm">Token</td>
                                      <td class="pt-5 text-sm ">1|0pZP0tQaIFt212bhEDUamE7jy5Z1uJfhHcAFAAg1</td>
                                    </tr>
                                    
                                    <tr rowspan="2">
                                      <td class="pt-5 border-b font-semibold text-md">Request Headers</td>
                                      <td class="border-b font-semibold text-md"></td>
                                    </tr>
                                    <tr>
                                      <td class="pt-5 font-semibold text-sm">Accept</td>
                                      <td class="pt-5 text-sm ">application/vnd.api+json</td>
                                    </tr>
                                    <tr>
                                        <td class="pt-5 font-semibold text-sm">Content-Type</td>
                                        <td class="pt-5 text-sm ">application/vnd.api+json</td>
                                    </tr>
                                </table>
                              </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    {{-- Documentation Section End --}}

    {{-- Footer Section Start --}}
    @include('layout.footer')
    {{-- Footer Section End --}}


    @vite('resources/js/app.js')
</body>
</html>