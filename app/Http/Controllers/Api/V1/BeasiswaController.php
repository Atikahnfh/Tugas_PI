<?php

namespace App\Http\Controllers\Api\V1;

use App\Models\Beasiswa;
use App\Http\Controllers\Controller;
use App\Http\Requests\V1\StoreBeasiswaRequest;
use App\Http\Requests\V1\UpdateBeasiswaRequest;
use App\Http\Resources\V1\BeasiswaResource;
use App\Http\Resources\V1\BeasiswaCollection;
use Illuminate\Http\Request;
use Illuminate\Support\Arr;
use App\Filters\V1\BeasiswaFilter;
use App\Http\Requests\V1\BulkStoreBeasiswaRequest;


class BeasiswaController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        $filter = new BeasiswaFilter();
        $queryitem = $filter->transform($request); //qcolumn , operator, value

        $includejrsnbeasiswas = $request->query('includeJurusans');

        $beas = Beasiswa::where($queryitem);

        if($includejrsnbeasiswas){
            $beas = $beas->with('jurusanbeasiswas');
        }
        
        return new BeasiswaCollection($beas->paginate()->appends($request->query()));
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
    public function store(StoreBeasiswaRequest $request)
    {
        return new BeasiswaResource(Beasiswa::create($request->all()));
    }

    public function bulkStore(BulkStoreBeasiswaRequest $request)
    {
        $bulk = collect($request->all())->map(function($arr, $key) {
            return Arr::except($arr, ['namaBeasiswa','idMitra','angkatanAwal','angkatanAkhir','semMin','semMax']);
        });

        Beasiswa::insert($bulk->toArray());
    }


    /**
     * Display the specified resource.
     */
    public function show(Beasiswa $beasiswa)
    {
        $includejrsnbeasiswas = request()->query('includeJurusans');
        if($includejrsnbeasiswas){
            return new BeasiswaResource($beasiswa->loadMissing('jurusanbeasiswas'));
        }
        return new BeasiswaResource($beasiswa);
    }

    /**
     * Show the form for editing the specified resource.
     */
    // public function edit(Beasiswa $beasiswa)
    // {
    //     //
    // }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateBeasiswaRequest $request, Beasiswa $beasiswa)
    {
        $beasiswa->update($request->all());
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Beasiswa $beasiswa)
    {
        //
    }
}
