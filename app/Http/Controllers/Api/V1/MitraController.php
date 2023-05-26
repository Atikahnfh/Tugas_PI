<?php

namespace App\Http\Controllers\Api\V1;

use App\Models\Mitra;
use App\Models\Beasiswa;
use App\Models\JurusanBeasiswa;
use App\Http\Controllers\Controller;
use App\Http\Requests\V1\StoreMitraRequest;
use App\Http\Requests\V1\BulkStoreMitraRequest;
use App\Http\Requests\V1\UpdateMitraRequest;
use App\Http\Resources\V1\MitraResource;
use App\Http\Resources\V1\MitraCollection;
use Illuminate\Http\Request;
use Illuminate\Support\Arr;
use App\Filters\V1\MitraFilter;

class MitraController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        $filter = new MitraFilter();
        $queryitem = $filter->transform($request);

        $includebeasiswas = $request->query('includeBeasiswas');
        $mitrass = Mitra::where($queryitem);
        
        
        if($includebeasiswas){
            $mitrass = $mitrass->with('beasiswas');
        }

        
        return new MitraCollection($mitrass->paginate()->appends($request->query()));
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
            return Arr::except($arr, ['namaMitra','idMitra','angkatanAwal','angkatanAkhir','semMin','semMax']);
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
    public function show($mitra)
    {
        $cekmitra = Mitra::where('id',$mitra)->first();
        if(!$cekmitra){
            return response()->json('ID mitra tidak valid');
        }
        
        return new MitraResource($cekmitra);
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
    public function update(UpdateMitraRequest $request, $mitra)
    {
        $cekmitra = Mitra::where('id',$mitra)->first();
        if(!$cekmitra){
            return response()->json('ID mitra tidak valid');
        }
        if($cekmitra->update($request->all())){
            return $cekmitra;
        }else{
            return response()->json('Terjadi kesalahan');
        };

        
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy($mitra)
    {
        //cekmitra
        $mitra = Mitra::where('id',$mitra)->first();
        if(!$mitra){
            return response()->json('ID mitra tidak valid');
        }
        //hapus mitra artinya hapus beasiswa, hapus beasiswa artinya hapus jurusan beasiswa
        //get dulu id beasiswanya

        $getidbeasiswa = Beasiswa::where('mitra_id', $mitra->id)->get('id');
        //hapus jurusan beasiswas
        foreach($getidbeasiswa as $idbeasiswa){
            //pertama tama delete yang ada di jurusan beasiswas
            $deljrsnbeasiswa = JurusanBeasiswa::where('beasiswa_id',$idbeasiswa->id)->delete();
            //baru yang beasiswa
            $delbeasiswa = Beasiswa::where('id',$idbeasiswa->id)->delete();
            if(!$delbeasiswa){
                return response()->json("ada Beasiswa dengan mitra tersebut yang gagal didelete");
            }
        }
        $delmitra = Mitra::where('id',$mitra->id)->delete();
        if($delmitra){
            return response()->json("Mitra berhasil didelete!");
        }else{
            return response()->json("Mitra gagal didelete");
        }
    }
}
