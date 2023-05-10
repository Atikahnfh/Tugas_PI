<!doctype html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  @vite('resources/css/app.css')
</head>
<body>

<!-- navbar -->
<nav class="bg-lime-950">
    <div class="max-w-screen-xl flex flex-wrap items-center justify-between mx-auto p-4">
      <a href="#" class="flex items-center">
          <img src="{{ asset('img/logo.png') }}" class="h-14 mr-3" alt="Scholars Logo" />
      </a>
      <div class="hidden w-full md:block md:w-auto" id="navbar-default">
      <ul class="font-medium flex flex-col p-4 md:p-0 mt-4   md:flex-row md:space-x-8 md:mt-0 md:border-0">
        <li>
          <a href="#" class="block py-2 pl-3 pr-4 text-white bg-blue-700 rounded md:bg-transparent md:text-white-200 md:p-0 dark:text-white md:dark:text-white-200" aria-current="page">
          Home
          </a>
        </li>
        <li>
          <a href="#" class="block py-2 pl-3 pr-4 text-gray-900 rounded hover:bg-gray-100 md:hover:bg-transparent md:border-0 md:hover:text-blue-700 md:p-0 dark:text-white md:dark:hover:text-blue-500 dark:hover:bg-gray-700 dark:hover:text-white md:dark:hover:bg-transparent">Log in</a>
        </li>
      </ul>
    </div>
  </div>
<!-- text -->
<h2 class="text-slate-200 text-4xl ml-72 font-sans"><b>Check your Eligibility for Applying Scholarship</b></h2>
<!-- search-bar -->
<form>   
    <label for="default-search" class="mb-2 text-sm font-medium text-gray-900 sr-only dark:text-white">Search</label>
    <div class="relative mb-50">
        <div class="absolute inset-y-0 left-0 flex items-center  pl-3 pointer-events-none">
            <svg aria-hidden="true" class="ml-80 -mt-5  w-5 h-5 text-gray-500 dark:text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"></path></svg>
        </div>
        <input type="search" id="default-search" class=" ml-80 mt-10 mb-16 w-2/4 p-4 pl-10 text-sm text-gray-900 border border-gray-300 rounded-lg bg-white-50 focus:ring-blue-500 focus:border-blue-500 dark:bg-white-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" placeholder="Search Mockups, Logos..." required>
        <button type="submit" class="text-white mr-64 mb-16 absolute right-2.5 bottom-2.5 bg-green-400 hover:bg-green-400 focus:ring-4 focus:outline-none focus:ring-green-300 font-medium rounded-lg text-sm px-4 py-2 dark:bg-green-600 dark:hover:bg-yellow-400 dark:focus:ring-green-400">Search</button>
    </div>
</form>

</div>
</nav>
 
<!-- container -->

<div class="box-content ml-56 mt-20 h-72 w-72 border-1 float-left rounded-lg hover:bg-red-300 active:bg-red-600 shadow-lg shadow-black-50">
    <img src="{{ asset('img/univ.jpg') }}" class="h-64 mr-3 rounded-lg object-center hover:object-top " alt="Scholars Logo" />
</div>
<div class="box-content ml-4 mt-20 h-72 w-72 border-1 float-left rounded-lg shadow-lg shadow-gray-50">
  <img src="{{ asset('img/beasiswa_indo.jpg') }}" class="h-64 mr-3 rounded-lg " alt="Scholars Logo" />
</div>
<div class="box-content ml-4 mt-20 h-72 w-72 border-1 float-left rounded-lg shadow-lg shadow-gray-50">
  <img src="{{ asset('img/beasiswa_ln.jpg') }}" class="h-64 mr-3 rounded-lg " alt="Scholars Logo" />
</div>
</body>
</html>