<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;

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
//-----------------------------
//public
//-----------------------------

//ga perlu pake prefix v1 vv
Route::post('/login', [AuthController::class, 'login']);
Route::post('/register', [AuthController::class, 'register']);

//perlu pakai prefix v1 vvv
Route::group(['prefix' => 'v1', 'namespace' => 'App\Http\Controllers\Api\V1'], function(){
    // Route::apiResource('beasiswas', BeasiswaController::class);
    // Route::post('beasiswas/bulk', ['uses'=> 'BeasiswaController@bulkStore']);
    
    // Route::apiResource('mitras', MitraController::class);
    // Route::apiResource('jrsnbeasiswas', JurusanbeasiswaController::class);//yang ini routenya pakai "s" yang di controller parameternya sama tapi ga pakai "s"
    // Route::apiResource('akuns', AkunController::class);
    // Route::apiResource('tokens', TokenController::class);
    // Route::apiResource('jurusans', JurusanController::class);
    // Route::apiResource('kliens', KlienController::class);
    // Route::apiResource('levelkliens', LevelKlienController::class);

    
});




//-----------------------------------
//private
//-----------------------------------

// Route::post('/logout', [AuthController::class, 'logout']);

Route::group(['middleware' => ['auth:sanctum']], function(){
    //ga perlu pake prefix v1 vv
    Route::post('/logout', [AuthController::class, 'logout']);
    Route::put('changeuserlevel/{userid}', [AuthController::class, 'changeuserlevel']);

    //yg perlu pake prefix v1 vvv
    Route::group(['prefix' => 'v1', 'namespace' => 'App\Http\Controllers\Api\V1'], function(){
        
        Route::get('beasiswas', ['uses' =>'BeasiswaController@index']);
        Route::get('beasiswas/{beasiswa}', ['uses' =>'BeasiswaController@show']);
        
        Route::get('jurusans', 'JurusanController@index');
        Route::get('jurusans/{jurusan}', ['uses'=>'JurusanController@show']);
    
        Route::get('jrsnbeasiswas', 'JurusanbeasiswaController@index');
        Route::get('jrsnbeasiswas/{jurusanbeasiswa}', ['uses'=>'JurusanbeasiswaController@show']);
    
        Route::get('mitras', 'MitraController@index');
        Route::get('mitras/{mitra}', ['uses'=>'MitraController@show']);
    


        Route::post('beasiswas', ['uses' =>'BeasiswaController@store']);
        Route::post('beasiswas/bulk', ['uses'=> 'BeasiswaController@bulkStore']);
        Route::put('beasiswas/{beasiswa}', ['uses' =>'BeasiswaController@update']);
        Route::patch('beasiswas/{beasiswa}', ['uses' =>'BeasiswaController@update']);
        Route::delete('beasiswas/{beasiswa}', ['uses' => 'BeasiswaController@destroy']);

        Route::post('jurusans', 'JurusanController@store');
        Route::put('jurusans/{jurusan}', 'JurusanController@update');
        Route::delete('jurusans/{jurusan}', 'JurusanController@destroy');
        Route::post('jurusans/bulk', ['uses'=> 'JurusanController@bulkStore']);

        Route::post('jrsnbeasiswas', 'JurusanbeasiswaController@store');
        Route::post('jrsnbeasiswas/bulk', ['uses'=> 'JurusanbeasiswaController@bulkStore']);
        Route::put('jrsnbeasiswas/{jurusanbeasiswa}', 'JurusanbeasiswaController@update');
        Route::patch('jrsnbeasiswas/{jurusanbeasiswa}', 'JurusanbeasiswaController@update');
        Route::delete('jrsnbeasiswas/{jrsnbeasiswa}', 'JurusanbeasiswaController@destroy');

        Route::post('mitras', 'MitraController@store');
        Route::put('mitras/{mitra}', 'MitraController@update');
        Route::delete('mitras/{mitra}', 'MitraController@destroy');
        Route::post('mitras/bulk', ['uses'=> 'MitraController@bulkStore']);

        Route::post('cekelligible', 'CheckelligibleController@cekelligible');
        Route::post('cekbeasiswa', 'CheckelligibleController@cekbeasiselligible');


    });
});