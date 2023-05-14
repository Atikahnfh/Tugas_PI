<?php

namespace App\Http\Controllers\Api\V1;

use App\Models\Token;
use App\Http\Controllers\Controller;
use App\Http\Requests\StoreTokenRequest;
use App\Http\Requests\UpdateTokenRequest;
use App\Http\Resources\V1\TokenResource;
use App\Http\Resources\V1\TokenCollection;

class TokenController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return new TokenCollection(Token::all());
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(StoreTokenRequest $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(Token $token)
    {
        return new TokenResource($token);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Token $token)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateTokenRequest $request, Token $token)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Token $token)
    {
        //
    }
}
