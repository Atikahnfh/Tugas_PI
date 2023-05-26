<?php

namespace App\Http\Controllers\Api\V1;

use App\Models\Jurusan;
use App\Models\Jurusanbeasiswa;
use App\Http\Controllers\Controller;
use App\Http\Requests\V1\StoreJurusanRequest;
use App\Http\Requests\V1\UpdateJurusanRequest;
use App\Http\Resources\V1\JurusanCollection;
use App\Http\Resources\V1\JurusanResource;

class JurusanController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return new JurusanCollection(Jurusan::all());
    }

    /**
     * Show the form for creating a new resource.
     */
    // public function create()
    // {
    //     return Jurusan::create($request->all());
    // }

    /**
     * Store a newly created resource in storage.
     */
    public function store(StoreJurusanRequest $request)
    {
        return new JurusanResource(Jurusan::create($request->all()));    
    }

    public function bulkStore(BulkStoreJurusanRequest $request)
    {
        $bulk = collect($request->all())->map(function($arr, $key) {
            return Arr::except($arr, ['namaJurusan']);
        });

        if(Jurusan::insert($bulk->toArray())){
            return response()->json("Jurusan berhasil dimasukkan!");
        }else{
            return response()->json("Jurusan gagal dimasukkan");
        }


    }

    /**
     * Display the specified resource.
     */
    public function show($jurusan)
    {
        $cekjurusan = Jurusan::where('id','=',$jurusan)->first();
        if(!$cekjurusan){
            return response()->json('Jurusan dengan ID tersebut tidak ada');
        }
        
        
        return new JurusanResource($cekjurusan);
    }

    /**
     * Show the form for editing the specified resource.
     */
    // public function edit(Jurusan $jurusan)
    // {
    //     $jurusan = Jurusan::findOrFail($id);
    //     $jurusan->update($request->all());

    //     return $jurusan;
    // }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateJurusanRequest $request,$jurusan)
    {
        //cek valid
        $cekjurusan = Jurusan::where('id','=',$jurusan)->first();
        if(!$cekjurusan){
            return response()->json('Jurusan dengan ID tersebut tidak ada');
        }
        //klo valid maka
        $cekjurusan->update($request->all());

        return $cekjurusan;
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy($jurusan)
    {
        $cekjurusan = Jurusan::where('id','=',$jurusan)->first();
        if(!$cekjurusan){
            return response()->json('Jurusan dengan ID tersebut tidak ada');
        }
        //hapus jurusan hapus dulu jrsnbeasiswa
        $deljrsnbeasiswa = JurusanBeasiswa::where('id_beasiswakhsjrsn',$cekjurusan->id)->delete();
        //baru delete jurusan
        $deljurusan = Jurusan::where('id', $cekjurusan->id)->delete();
        if(!$deljurusan){
            return response()->json("Jurusan gagal didelete");
        }
        return response()->json("Jurusan berhasil didelete");


    }
}
