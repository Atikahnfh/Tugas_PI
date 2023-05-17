<?php

namespace App\Http\Controllers\Api\V1;

use App\Models\Mitra;
use App\Http\Controllers\Controller;
use App\Http\Requests\V1\StoreMitraRequest;
use App\Http\Requests\V1\UpdateMitraRequest;
use App\Http\Resources\V1\MitraResource;
use App\Http\Resources\V1\MitraCollection;
use Illuminate\Http\Request;
use Illuminate\Support\Arr;
use App\Http\Requests\V1\BulkStoreMitraRequest;

class MitraController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return new MitraCollection(Mitra::all());
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
    public function store(StoreMitraRequest $request)
    {
        return new MitraResource(Mitra::create($request->all()));    
    }

    public function bulkStore(BulkStoreMitraRequest $request)
    {
        $bulk = collect($request->all())->map(function($arr, $key) {
            return Arr::except($arr, ['namaMitra']);
        });

        if(Mitra::insert($bulk->toArray())){
            return response()->json("Mitra berhasil dimasukkan!");
        }else{
            return response()->json("Mitra gagal dimasukkan");
        }


    }
    /**
     * Display the specified resource.
     */
    public function show(Mitra $mitra)
    {
        return new MitraResource($mitra);
    }

    /**
     * Show the form for editing the specified resource.
     */
    // public function edit(Mitra $mitra)
    // {
    //     //
    // }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateMitraRequest $request, Mitra $mitra)
    {
        $mitra->update($request->all());

        return $mitra;    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Mitra $mitra)
    {
        $jurusan->delete();

        return 204;
    }
}
