<?php

namespace App\Http\Controllers\Api\V1;

use App\Models\Jurusanbeasiswa;
use App\Http\Controllers\Controller;
use App\Http\Requests\StoreJurusanbeasiswaRequest;
use App\Http\Requests\UpdateJurusanbeasiswaRequest;
use App\Http\Resources\V1\JurusanbeasiswaResource;
use App\Http\Resources\V1\JurusanbeasiswaCollection;

class JurusanbeasiswaController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return new JurusanbeasiswaCollection(JurusanBeasiswa::all());
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(StoreJurusanbeasiswaRequest $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(Jurusanbeasiswa $jrsnbeasiswa)////yang ini ga pakai "s" di akhir parameternya tpi yang di controller  sama tapi pakai "s"
    {
        return new JurusanbeasiswaResource($jrsnbeasiswa);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Jurusanbeasiswa $jurusanbeasiswa)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateJurusanbeasiswaRequest $request, Jurusanbeasiswa $jurusanbeasiswa)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Jurusanbeasiswa $jurusanbeasiswa)
    {
        //
    }
}
