<?php

namespace App\Http\Controllers\Api\V1;

use App\Models\Jurusan;
use App\Http\Controllers\Controller;
use App\Http\Requests\V1\StoreJurusanRequest;
use App\Http\Requests\V1\UpdateJurusanRequest;
use App\Http\Resources\V1\JurusanCollection;
use App\Http\Resources\V1\JurusanResource;
use Illuminate\Http\Request;
use Illuminate\Support\Arr;
use App\Http\Requests\V1\BulkStoreJurusanRequest;


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
    public function show(Jurusan $jurusan)
    {
        return new JurusanResource($jurusan);
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
    public function update(UpdateJurusanRequest $request, Jurusan $jurusan)
    {
        // $jurusan = Jurusan::findOrFail($jurusan);
        $jurusan->update($request->all());

        return $jurusan;
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Jurusan $jurusan)
    {
        // $jurusan = Jurusan::findOrFail($id);
        $jurusan->delete();

        return 204;
    }
}
