<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>API Mahasiswa</title>
    <?php echo app('Illuminate\Foundation\Vite')('resources/css/app.css'); ?>
    <script>
        if (localStorage.theme === 'dark' || (!('theme' in localStorage) && window.matchMedia('(prefers-color-scheme: dark)').matches)) {
        document.documentElement.classList.add('dark')
        } else {
        document.documentElement.classList.remove('dark')
        }
    </script>
</head>
<body class="dark:bg-dark">

    
    <?php echo $__env->make('layout.header', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
    


    
    <?php if(session('error')): ?>
        <?php echo $__env->make('layout.error-alert', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
    <?php endif; ?>
    

    
    <section id="about" class="pt-36 pb-36 dark:bg-dark">
        <div class="container">
            <div class="flex">
                <div class="w-full px-4">
                    <h3 class="font-semibold text-dark text-2xl mb-4 lg:text-3xl lg:pt-10 dark:text-white text-center">Silakan Login</h3>
                    <div class="mt-5 sm:max-w-sm mx-auto">
                        <form class="space-y-6" action="<?php echo e('/'); ?>" method="POST">
                            <?php echo csrf_field(); ?>
                            <label for="email">
                              <span class="mt-4 leading-6 block text-sm font-medium mb-2 text-slate-700 after:content-['*'] after:text-pink-500 after:ml-0.5 dark:text-white">Email</span>
                              <input type="email" name="email" id="email" placeholder="Masukkan Email" class="px-3 py-2 border shadow rounded w-full block text-sm placeholder:text-slate-400 focus:outline-none focus:ring-1 focus:ring-primary focus:border-primary dark:shadow-sm dark:shadow-slate-600 <?php $__errorArgs = ['email'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?>  ring-pink-700 border-pink-700 <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>" value="<?php echo e(old('email')); ?>">
                              <?php $__errorArgs = ['email'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?>
                              <p class="text-sm m-1 text-pink-700"><?php echo e($message); ?></p>
                              <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>
                            </label>
                            <label for="password">
                              <span class="mt-4 leading-6 block text-sm font-medium mb-2 text-slate-700 after:content-['*'] after:text-pink-500 after:ml-0.5 dark:text-white">Password</span>
                              <input type="password" name="password" id="password" placeholder="Masukkan Password" class="px-3 py-2 border shadow rounded w-full block text-sm placeholder:text-slate-400 focus:outline-none focus:ring-1 focus:ring-primary focus:border-primary dark:shadow-sm dark:shadow-slate-600 <?php $__errorArgs = ['password'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?>  ring-pink-700 border-pink-700 <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>" value="<?php echo e(old('password')); ?>">
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
                              <?php $__errorArgs = ['password'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?>
                              <p class="text-sm m-1 text-pink-700"><?php echo e($message); ?></p>
                              <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>
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
    

    
    <?php echo $__env->make('layout.footer', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
    


    <?php echo app('Illuminate\Foundation\Vite')('resources/js/app.js'); ?>
</body>
</html><?php /**PATH D:\Mhd Afifan Aly Rahman Saragih\Teknologi Informasi '20\TI SM6\Pemorgraman Integrative\Tugas_PI\api-mahasiswa\resources\views/login.blade.php ENDPATH**/ ?>