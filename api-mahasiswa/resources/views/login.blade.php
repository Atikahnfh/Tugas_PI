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

    <!-- Header Start -->
    <header class="bg-transparent absolute top-0 left-0 w-full flex items-center z-10">
        <div class="container">
            <div class="flex items-center justify-between relative">
                <div required class="px-4">
                    <a href="#home" class="font-bold text-lg text-primary block py-6">API Mahasiswa</a>
                </div>
                <div class="flex items-center">
                    <button id="hamburger" name="hamburger" type="button" class="block absolute right-4 lg:hidden">
                        <span class="hamburger-line transition duration-300 ease-in-out origin-top-left"></span>
                        <span class="hamburger-line transition duration-300 ease-in-out"></span>
                        <span class="hamburger-line transition duration-300 ease-in-out origin-bottom-left"></span>
                    </button>

                    <nav id="nav-menu" class="hidden absolute py-5 bg-white shadow-lg rounded-lg max-w-[250px] w-full right-4 top-full lg:block lg:static lg:bg-transparent lg:max-w-full lg:shadow-none lg:rounded-none dark:bg-dark lg:dark:bg-transparent dark:shadow-slate-800">
                        <ul class="block lg:flex">
                            <li class="mt-3 flex items-center pl-8 lg:mt-0">
                                <div class="flex">
                                    <span class="mr-2 text-sm text-slate-500">Light</span>
                                    <input type="checkbox" name="dark-toggle" id="dark-toggle" class="hidden">
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
    <!-- Header End -->

    {{-- Alert --}}
    @if (session('error'))
    <div id="myAlert" class="fixed top-0 left-0 right-0 bottom-0 flex items-center justify-center">
        <div class="bg-white w-1/3 p-6 rounded-xl shadow-xl border border-slate-200">
            <p class="text-xl font-bold mb-4">❌ Gagal</p>
            <p id="alertMessage" class="text-gray-700 mb-10">{{ session('error') }}</p>
            <div class="flex items-center justify-center">
                <button id="closeAlert" class="bg-primary hover:bg-indigo-700 text-white font-bold py-2 px-4 rounded">Close</button>
            </div>
        </div>
    </div>
    @endif
    {{-- End Alert --}}

    <!-- Login Section Start -->
    <section id="about" class="pt-36 pb-36 dark:bg-dark">
        <div class="container">
            <div class="flex">
                <div class="w-full px-4">
                    <h3 class="font-semibold text-dark text-2xl mb-4 lg:text-3xl lg:pt-10 dark:text-white text-center">Silakan Login</h3>
                    <div class="mt-5 sm:max-w-sm mx-auto">
                        <form class="space-y-6" action="{{ '/' }}" method="POST">
                            @csrf
                            <label for="email">
                              <span class="mt-4 leading-6 block text-sm font-medium mb-2 text-slate-700 after:content-['*'] after:text-pink-500 after:ml-0.5 dark:text-white">Email</span>
                              <input type="email" name="email" id="email" placeholder="Masukkan Email" class="px-3 py-2 border shadow rounded w-full block text-sm placeholder:text-slate-400 focus:outline-none focus:ring-1 focus:ring-primary focus:border-primary dark:shadow-sm dark:shadow-slate-600 @error('email')  ring-pink-700 border-pink-700 @enderror" value="{{ old('email') }}">
                              @error('email')
                              <p class="text-sm m-1 text-pink-700">{{ $message }}</p>
                              @enderror
                            </label>
                            <label for="password">
                              <span class="mt-4 leading-6 block text-sm font-medium mb-2 text-slate-700 after:content-['*'] after:text-pink-500 after:ml-0.5 dark:text-white">Password</span>
                              <input type="password" name="password" id="password" placeholder="Masukkan Password" class="px-3 py-2 border shadow rounded w-full block text-sm placeholder:text-slate-400 focus:outline-none focus:ring-1 focus:ring-primary focus:border-primary dark:shadow-sm dark:shadow-slate-600 @error('password')  ring-pink-700 border-pink-700 @enderror" value="{{ old('password') }}">
                              <span class="relative inset-y-0 right-0 flex items-center pr-3">
                                <svg id="show-password" xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 cursor-pointer text-gray-400 hover:text-gray-500" viewBox="0 0 20 20" fill="currentColor">
                                  <path d="M10 12a2 2 0 100-4 2 2 0 000 4z" />
                                  <path fill-rule="evenodd" d="M10 3a7 7 0 100 14 7 7 0 000-14zm0 12a5 5 0 100-10 5 5 0 000 10z" clip-rule="evenodd" />
                                </svg>
                                <svg id="hide-password" xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 cursor-pointer text-gray-400 hover:text-gray-500 hidden" viewBox="0 0 20 20" fill="currentColor">
                                  <path fill-rule="evenodd" d="M9 12a3 3 0 100-6 3 3 0 000 6zM7 9a1 1 0 112 0 1 1 0 01-2 0z" clip-rule="evenodd" />
                                  <path fill-rule="evenodd" d="M3.27 4.27a.999.999 0 111.42-1.42l12 12a.999.999 0 11-1.42 1.42l-12-12z" clip-rule="evenodd" />
                                </svg>
                              </span>
                              @error('password')
                              <p class="text-sm m-1 text-pink-700">{{ $message }}</p>
                              @enderror
                            </label>
                
                            <div>
                              <button type="submit" class="flex w-full justify-center rounded-md bg-indigo-600 px-3 py-1.5 text-sm font-semibold leading-6 text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600">Login</button>
                            </div>
                          </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Login Section End -->

    <!-- Footer Start -->
    <footer class="pt-11 pb-12 block">
        <div class="container">
            
            <div class="w-full pt-5 border-t border-secondary">
                <div class="flex items-center justify-center mb-5">
                    <!-- Youtube -->
                    <a href="https://youtube.com" target="_blank" class="w-9 h-9 mr-3 rounded-full flex justify-center items-center border border-slate-300 text-slate-300 hover:border-primary hover:bg-primary hover:text-white">
                        <svg width="20" class="fill-current" role="img" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><title>YouTube</title><path d="M23.498 6.186a3.016 3.016 0 0 0-2.122-2.136C19.505 3.545 12 3.545 12 3.545s-7.505 0-9.377.505A3.017 3.017 0 0 0 .502 6.186C0 8.07 0 12 0 12s0 3.93.502 5.814a3.016 3.016 0 0 0 2.122 2.136c1.871.505 9.376.505 9.376.505s7.505 0 9.377-.505a3.015 3.015 0 0 0 2.122-2.136C24 15.93 24 12 24 12s0-3.93-.502-5.814zM9.545 15.568V8.432L15.818 12l-6.273 3.568z"/></svg>
                    </a>

                    <!-- Instagram -->
                    <a href="https://instagram.com/m.afifanars" target="_blank" class="w-9 h-9 mr-3 rounded-full flex justify-center items-center border border-slate-300 text-slate-300 hover:border-primary hover:bg-primary hover:text-white">
                        <svg width="20" class="fill-current" role="img" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><title>Instagram</title><path d="M12 0C8.74 0 8.333.015 7.053.072 5.775.132 4.905.333 4.14.63c-.789.306-1.459.717-2.126 1.384S.935 3.35.63 4.14C.333 4.905.131 5.775.072 7.053.012 8.333 0 8.74 0 12s.015 3.667.072 4.947c.06 1.277.261 2.148.558 2.913.306.788.717 1.459 1.384 2.126.667.666 1.336 1.079 2.126 1.384.766.296 1.636.499 2.913.558C8.333 23.988 8.74 24 12 24s3.667-.015 4.947-.072c1.277-.06 2.148-.262 2.913-.558.788-.306 1.459-.718 2.126-1.384.666-.667 1.079-1.335 1.384-2.126.296-.765.499-1.636.558-2.913.06-1.28.072-1.687.072-4.947s-.015-3.667-.072-4.947c-.06-1.277-.262-2.149-.558-2.913-.306-.789-.718-1.459-1.384-2.126C21.319 1.347 20.651.935 19.86.63c-.765-.297-1.636-.499-2.913-.558C15.667.012 15.26 0 12 0zm0 2.16c3.203 0 3.585.016 4.85.071 1.17.055 1.805.249 2.227.415.562.217.96.477 1.382.896.419.42.679.819.896 1.381.164.422.36 1.057.413 2.227.057 1.266.07 1.646.07 4.85s-.015 3.585-.074 4.85c-.061 1.17-.256 1.805-.421 2.227-.224.562-.479.96-.899 1.382-.419.419-.824.679-1.38.896-.42.164-1.065.36-2.235.413-1.274.057-1.649.07-4.859.07-3.211 0-3.586-.015-4.859-.074-1.171-.061-1.816-.256-2.236-.421-.569-.224-.96-.479-1.379-.899-.421-.419-.69-.824-.9-1.38-.165-.42-.359-1.065-.42-2.235-.045-1.26-.061-1.649-.061-4.844 0-3.196.016-3.586.061-4.861.061-1.17.255-1.814.42-2.234.21-.57.479-.96.9-1.381.419-.419.81-.689 1.379-.898.42-.166 1.051-.361 2.221-.421 1.275-.045 1.65-.06 4.859-.06l.045.03zm0 3.678c-3.405 0-6.162 2.76-6.162 6.162 0 3.405 2.76 6.162 6.162 6.162 3.405 0 6.162-2.76 6.162-6.162 0-3.405-2.76-6.162-6.162-6.162zM12 16c-2.21 0-4-1.79-4-4s1.79-4 4-4 4 1.79 4 4-1.79 4-4 4zm7.846-10.405c0 .795-.646 1.44-1.44 1.44-.795 0-1.44-.646-1.44-1.44 0-.794.646-1.439 1.44-1.439.793-.001 1.44.645 1.44 1.439z"/></svg>
                    </a>

                    <!-- Twitter -->
                    <a href="https://twitter.com/" target="_blank" class="w-9 h-9 mr-3 rounded-full flex justify-center items-center border border-slate-300 text-slate-300 hover:border-primary hover:bg-primary hover:text-white">
                        <svg width="20" class="fill-current" role="img" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><title>Twitter</title><path d="M23.953 4.57a10 10 0 01-2.825.775 4.958 4.958 0 002.163-2.723c-.951.555-2.005.959-3.127 1.184a4.92 4.92 0 00-8.384 4.482C7.69 8.095 4.067 6.13 1.64 3.162a4.822 4.822 0 00-.666 2.475c0 1.71.87 3.213 2.188 4.096a4.904 4.904 0 01-2.228-.616v.06a4.923 4.923 0 003.946 4.827 4.996 4.996 0 01-2.212.085 4.936 4.936 0 004.604 3.417 9.867 9.867 0 01-6.102 2.105c-.39 0-.779-.023-1.17-.067a13.995 13.995 0 007.557 2.209c9.053 0 13.998-7.496 13.998-13.985 0-.21 0-.42-.015-.63A9.935 9.935 0 0024 4.59z"/></svg>
                    </a>

                    <!-- Tiktok -->
                    <a href="https://tiktok.com/" target="_blank" class="w-9 h-9 mr-3 rounded-full flex justify-center items-center border border-slate-300 text-slate-300 hover:border-primary hover:bg-primary hover:text-white">
                        <svg width="20" class="fill-current" role="img" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><title>TikTok</title><path d="M12.525.02c1.31-.02 2.61-.01 3.91-.02.08 1.53.63 3.09 1.75 4.17 1.12 1.11 2.7 1.62 4.24 1.79v4.03c-1.44-.05-2.89-.35-4.2-.97-.57-.26-1.1-.59-1.62-.93-.01 2.92.01 5.84-.02 8.75-.08 1.4-.54 2.79-1.35 3.94-1.31 1.92-3.58 3.17-5.91 3.21-1.43.08-2.86-.31-4.08-1.03-2.02-1.19-3.44-3.37-3.65-5.71-.02-.5-.03-1-.01-1.49.18-1.9 1.12-3.72 2.58-4.96 1.66-1.44 3.98-2.13 6.15-1.72.02 1.48-.04 2.96-.04 4.44-.99-.32-2.15-.23-3.02.37-.63.41-1.11 1.04-1.36 1.75-.21.51-.15 1.07-.14 1.61.24 1.64 1.82 3.02 3.5 2.87 1.12-.01 2.19-.66 2.77-1.61.19-.33.4-.67.41-1.06.1-1.79.06-3.57.07-5.36.01-4.03-.01-8.05.02-12.07z"/></svg>
                    </a>

                    <!-- Linkedin -->
                    <a href="https://linkedin.com/in/mafifanars" target="_blank" class="w-9 h-9 mr-3 rounded-full flex justify-center items-center border border-slate-300 text-slate-300 hover:border-primary hover:bg-primary hover:text-white">
                        <svg width="20" class="fill-current" role="img" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><title>LinkedIn</title><path d="M20.447 20.452h-3.554v-5.569c0-1.328-.027-3.037-1.852-3.037-1.853 0-2.136 1.445-2.136 2.939v5.667H9.351V9h3.414v1.561h.046c.477-.9 1.637-1.85 3.37-1.85 3.601 0 4.267 2.37 4.267 5.455v6.286zM5.337 7.433c-1.144 0-2.063-.926-2.063-2.065 0-1.138.92-2.063 2.063-2.063 1.14 0 2.064.925 2.064 2.063 0 1.139-.925 2.065-2.064 2.065zm1.782 13.019H3.555V9h3.564v11.452zM22.225 0H1.771C.792 0 0 .774 0 1.729v20.542C0 23.227.792 24 1.771 24h20.451C23.2 24 24 23.227 24 22.271V1.729C24 .774 23.2 0 22.222 0h.003z"/></svg>
                    </a>
                </div>
                <p class="font-medium text-xs text-slate-500 text-center">Dibuat dengan <span class="text-pink-500">❤️</span> oleh <a href="https://instagram.com/m.afifanars" target="_blank" class="font-bold text-primary">Scholarfy - Kelompok 3</a></p>
            </div>
        </div>
    </footer>
    <!-- Footer End -->
    @vite('resources/js/app.js')
    <script>
        const showPasswordBtn = document.getElementById('show-password');
        const hidePasswordBtn = document.getElementById('hide-password');
        const passwordInput = document.getElementById('password');
      
        showPasswordBtn.addEventListener('click', () => {
          showPasswordBtn.classList.add('hidden');
          hidePasswordBtn.classList.remove('hidden');
          passwordInput.type = 'text';
        });
      
        hidePasswordBtn.addEventListener('click', () => {
          hidePasswordBtn.classList.add('hidden');
          showPasswordBtn.classList.remove('hidden');
          passwordInput.type = 'password';
        });

    </script>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const closeBtn = document.getElementById('closeAlert');
            const alert = document.getElementById('myAlert');
            
            function hideAlert() {
                alert.style.display = 'none';
            }
    
            closeBtn.addEventListener('click', function() {
                hideAlert();
            });
        });
    </script>
</body>
</html>