<?php

namespace App\Http\Controllers\Api\V1;

use App\Models\Beasiswa;
use App\Models\Mitra;
use App\Models\JurusanBeasiswa;
use App\Models\StatusBeasiswa;
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
        //cek valid atau nggak
        $cekmitra = Mitra::where('id','=',$request->mitra_id)->first();
        if(!$cekmitra){
            return response()->json('Tidak ada mitra dengan ID tersebut.');         
        }
        $cekstatus = Statusbeasiswa::where('id_status', '=', $request->status)->first();
        if(!$cekstatus){
            return response()->json('Status beasiswa tidak valid...');
        }
        //klo berhasilkelaurkan response data yg dimasukkan
        return new BeasiswaResource(Beasiswa::create($request->all()));
    }

    public function bulkStore(BulkStoreBeasiswaRequest $request)
    {
        $bulk = collect($request->all())->map(function($arr, $key) {
            return Arr::except($arr, ['namaBeasiswa','idMitra','angkatanAwal','angkatanAkhir','semMin','semMax']);
        });

        //cek validitas
        foreach($bulk as $key=>$value){
            $cekmitra = Mitra::where('id','=',$value['mitra_id'])->first();
            if(!$cekmitra){
                return response()->json('Satu atau banyak data memiliki ID mitra yang tidak valid');         
            }
            $cekstatus = Statusbeasiswa::where('id_status', '=', $value['status'])->first();
            if(!cekstatus){
            return response()->json('Satu atau banyak data memiliki status yang tidak valid');
            }
        }

        //klo valid semua
        if(Beasiswa::insert($bulk->toArray())){
            return response()->json("Beasiswa berhasil dimasukkan!");
        }else{
            return response()->json("Beasiswa gagal dimasukkan");
        }


    }


    /**
     * Display the specified resource.
     */
    public function show($beasiswa)
    {
        $beas = Beasiswa::where('beasiswas.id','=',$beasiswa);
        //cek validasi
        $cekbeasiswa = $beas->first();
        if(!$cekbeasiswa){
            return response()->json("Beasiswa tidak ditemukan!");
        }
        //end validasi
        $includejrsnbeasiswas = request()->query('includeJurusans');
        

        if($includejrsnbeasiswas){
           $beas = $beas->with('jurusanbeasiswas');
        }
        return new BeasiswaResource($beas->first());
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
    public function destroy($beasiswa)
    {
        // $cekbeasiswa = Beasiswa::where('id',$beasiswa->id)->first();
        $beas = Beasiswa::where('beasiswas.id','=',$beasiswa);
        //cek validasi
        $cekbeasiswa = $beas->first();//dipake pas untuk mendelete
        if(!$cekbeasiswa){
            return response()->json("Beasiswa tidak ditemukan!");
        }
        //end validasi
        
        //pertama tama delete yang ada di jurusan beasiswas
        $deljrsnbeasiswa = JurusanBeasiswa::where('beasiswa_id',$cekbeasiswa->id)->delete();
        //baru yang beasiswa
        $delbeasiswa = $beas->delete();
        if($delbeasiswa){
            return response()->json("Beasiswa berhasil didelete!");
        }else{
            return response()->json("Beasiswa gagal didelete");
        }


    }
}
