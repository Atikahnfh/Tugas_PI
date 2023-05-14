<?php

namespace App\Http\Controllers\Api\V1;

use App\Models\Akun;
use App\Http\Controllers\Controller;
use App\Http\Requests\StoreAkunRequest;
use App\Http\Requests\UpdateAkunRequest;
use App\Http\Resources\V1\AkunResource;
use App\Http\Resources\V1\AkunCollection;

class AkunController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return new AkunCollection(Akun::all());
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
    public function store(StoreAkunRequest $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(Akun $akun)
    {
        return new AkunResource($akun);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Akun $akun)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateAkunRequest $request, Akun $akun)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Akun $akun)
    {
        //
    }
}
