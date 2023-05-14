<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::group(['prefix' => 'v1', 'namespace' => 'App\Http\Controllers\Api\V1'], function(){
    Route::apiResource('mitras', MitraController::class);
    Route::apiResource('jrsnbeasiswas', JurusanbeasiswaController::class);//yang ini routenya pakai "s" yang di controller parameternya sama tapi ga pakai "s"
    Route::apiResource('beasiswas', BeasiswaController::class);
    Route::post('beasiswas/bulk', ['uses'=> 'BeasiswaController@bulkStore']);
    Route::apiResource('akuns', AkunController::class);
    Route::apiResource('tokens', TokenController::class);
    Route::apiResource('jurusans', JurusanController::class);
    Route::apiResource('kliens', KlienController::class);
    Route::apiResource('levelkliens', LevelKlienController::class);
});