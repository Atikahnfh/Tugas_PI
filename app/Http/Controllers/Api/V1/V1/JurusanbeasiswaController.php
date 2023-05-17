<?php

namespace App\Http\Controllers\Api\V1;

use App\Models\Jurusanbeasiswa;
use App\Http\Controllers\Controller;
use App\Http\Requests\V1\StoreJurusanbeasiswaRequest;
use App\Http\Requests\V1\UpdateJurusanbeasiswaRequest;
use App\Http\Resources\V1\JurusanbeasiswaResource;
use App\Http\Resources\V1\JurusanbeasiswaCollection;
use Illuminate\Http\Request;
use Illuminate\Support\Arr;
use App\Http\Requests\V1\BulkStoreJurusanbeasiswaRequest;


class JurusanbeasiswaController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return new JurusanbeasiswaCollection(Jurusanbeasiswa::all());
    }

    /**
     * Show the form for creating a new resource.
     */
    // public function create()
    // {
    //     //
    // }

    /**
     * Store a newly created resource in storage.
     */
    public function store(StoreJurusanbeasiswaRequest $request)
    {
        return new JurusanbeasiswaResource(Jurusanbeasiswa::create($request->all()));
    }

    public function bulkStore(BulkStoreJurusanbeasiswaRequest $request)
    {
        $bulk = collect($request->all())->map(function($arr, $key) {
            return Arr::except($arr, ['beasiswaId','idBeasiswakhsjrsn','ipkMin']);
        });

        if(Jurusanbeasiswa::insert($bulk->toArray())){
            return response()->json("Jurusan beasiswa berhasil dimasukkan!");
        }else{
            return response()->json("Jurusan beasiswa gagal dimasukkan");
        }


    }

    /**
     * Display the specified resource.
     */
    public function show(Jurusanbeasiswa $jurusanbeasiswa)////yang ini ga pakai "s" di akhir parameternya tpi yang di controller  sama tapi pakai "s"
    {
        return new JurusanbeasiswaResource($jurusanbeasiswa);
    }

    /**
     * Show the form for editing the specified resource.
     */
    // public function edit(Jurusanbeasiswa $jurusanbeasiswa)
    // {
    //     //
    // }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateJurusanbeasiswaRequest $request, Jurusanbeasiswa $jrsnbeasiswa)
    {
        $jrsnbeasiswa->update($request->all());
    }

    /**
     * Remove the specified resource from storage.
     */
    // public function destroy(Jurusanbeasiswa $jurusanbeasiswa)
    // {
    //     //
    // }

    public function delete(Request $request, $jrsnbeasiswa)
    {
        // $jrsnbeasiswa = Jurusanbeasiswa::findOrFail($jrsnbeasiswa);
        $jrsnbeasiswa->delete();

        return 204;
    }
}
