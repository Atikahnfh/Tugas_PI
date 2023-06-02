<div id="myAlert" class="fixed top-0 left-0 right-0 bottom-0 flex items-center justify-center">
    <div class="bg-white w-1/3 p-6 rounded-xl shadow-xl border border-slate-200">
        <p class="text-xl font-bold mb-4">❌ Gagal</p>
        <p id="alertMessage" class="text-gray-700 mb-10">{{ session('error') }}</p>
        <div class="flex items-center justify-center">
            <button id="closeAlert" class="bg-primary hover:bg-indigo-700 text-white font-bold py-2 px-4 rounded">Close</button>
        </div>
    </div>
</div>