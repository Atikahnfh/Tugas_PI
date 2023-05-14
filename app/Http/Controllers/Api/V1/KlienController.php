<?php

namespace App\Http\Controllers\Api\V1;

use App\Models\Klien;
use App\Http\Controllers\Controller;
use App\Http\Requests\StoreKlienRequest;
use App\Http\Requests\UpdateKlienRequest;
use App\Http\Resources\V1\KlienCollection;
use App\Http\Resources\V1\KlienResource;

class KlienController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return new KlienCollection(Klien::all());
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
    public function store(StoreKlienRequest $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(Klien $klien)
    {
        return new KlienResource($klien);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Klien $klien)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateKlienRequest $request, Klien $klien)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Klien $klien)
    {
        //
    }
}
