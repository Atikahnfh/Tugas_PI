<?php

use GuzzleHttp\Client;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\LoginController;
use App\Http\Controllers\SendTokenController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/
Route::group(['middleware' => 'guest'], function () {
    Route::get('/', [LoginController::class, 'index'])->name('login');
    Route::post('/', [LoginController::class, 'login']);
});
Route::group(['middleware' => 'auth'], function () {
    Route::get('/logout', [LoginController::class, 'logout']);
    Route::get('/dokumentasi', function () {
        return view('dokumentasi');
    });
    Route::get('/generate-token', [SendTokenController::class, 'index']);
    Route::post('/generate-token', [SendTokenController::class, 'sendToken']);
});
