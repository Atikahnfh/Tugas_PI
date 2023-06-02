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
    @if (session('success'))
        @include('layout.success-alert')
    @endif
    {{-- End Alert --}}

    <!-- About Section Start -->
    <section id="about" class="pt-36 pb-36 dark:bg-dark">
        <div class="container">
            <div class="flex flex-wrap">
                <div class="w-full px-4 mb-10 lg:w-1/2">
                    <h4 class="font-bold text-bold uppercase text-primary text-lg mb-3">API Token</h4>
                    <h2 class="font-bold text-dark text-3xl mb-5 max-w-md lg:text-4xl dark:text-white">Generate API Token Mahasiswa!</h2>
                    <p class="font-medium text-base text-secondary max-w-xl lg:tx-lg">Generate API Token dengan mengisi form yang disediakan agar kamu dapat menggunakan API Mahasiswa.</p>
                </div>
                <div class="w-full px-4 lg:w-1/2">
                    <h3 class="font-semibold text-dark text-2xl mb-4 lg:text-3xl lg:pt-10 dark:text-white">Generate API Token</h3>
                    <div class="mt-5 sm:max-w-sm">
                        <form class="space-y-6" action="{{ '/generate-token' }}" method="POST">
                            @csrf
                            <label for="email">
                                <span class="mt-4 leading-6 block text-sm font-medium mb-2 text-slate-700 after:content-['*'] after:text-pink-500 after:ml-0.5 dark:text-white">Email</span>
                                <input type="" name="email" id="email" placeholder="Masukkan Email" class="px-3 py-2 border shadow rounded w-full block text-sm placeholder:text-slate-400 focus:outline-none focus:ring-1 focus:ring-primary focus:border-primary dark:shadow-sm dark:shadow-slate-600 @error('email')  ring-pink-700 border-pink-700 @enderror" value="{{ old('email') }}">
                                @error('email')
                                <p class="text-sm m-1 text-pink-700">{{ $message }}</p>
                                @enderror
                            </label>
                            <label for="name">
                                <span class="mt-4 leading-6 block text-sm font-medium mb-2 text-slate-700 after:content-['*'] after:text-pink-500 after:ml-0.5 dark:text-white">Nama</span>
                                <input type="text" name="name" id="name" placeholder="Masukkan Nama" class="px-3 py-2 border shadow rounded w-full block text-sm placeholder:text-slate-400 focus:outline-none focus:ring-1 focus:ring-primary focus:border-primary dark:shadow-sm dark:shadow-slate-600 @error('name')  ring-pink-700 border-pink-700 @enderror" value="{{ old('name') }}">
                                @error('name')
                                <p class="text-sm m-1 text-pink-700">{{ $message }}</p>
                                @enderror
                            </label>
                            <label for="purpose">
                                <span class="mt-4 leading-6 block text-sm font-medium mb-2 text-slate-700 after:content-['*'] after:text-pink-500 after:ml-0.5 dark:text-white">Untuk</span>
                                <textarea name="purpose" id="purpose" placeholder="Tujuan saya untuk..." class="px-3 py-2 border shadow rounded w-full block text-sm placeholder:text-slate-400 focus:outline-none focus:ring-1 focus:ring-primary focus:border-primary dark:shadow-sm dark:shadow-slate-600 @error('purpose')  ring-pink-700 border-pink-700 @enderror" value="{{ old('purpose') }}"></textarea>
                                @error('purpose')
                                <p class="text-sm m-1 text-pink-700">{{ $message }}</p>
                                @enderror
                            </label>
                    
                            <div>
                                <button type="submit" class="flex w-full justify-center rounded-md bg-indigo-600 px-3 py-1.5 text-sm font-semibold leading-6 text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600">Kirim</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- About Section End -->


    {{-- Footer Section Start --}}
    @include('layout.footer')
    {{-- Footer Section End --}}

    @vite('resources/js/app.js')

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