<?php

namespace App\Http\Controllers\Api\V1;

use App\Models\Jurusanbeasiswa;
use App\Models\Jurusan;
use App\Models\Beasiswa;
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
        $getjrsnbeasis = Jurusanbeasiswa::join('beasiswas','beasiswa_id','=','beasiswas.id')
        ->join('jurusans','id_beasiswakhsjrsn','=','jurusans.id')
        ->select('*', 'jurusanbeasiswas.id AS idjrsnbeasis')
        ->get();
        
        return new JurusanbeasiswaCollection($getjrsnbeasis);
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
        //cek valid beasiswa
        $cekbeasis = Beasiswa::where('id','=',$request->beasiswa_id)->first();
        if(!$cekbeasis){
            return response()->json('Beasiswa dengan ID tersebut tidak ada');
        }
        //cek valid jurusan
        $cekjurusan = Jurusan::where('id','=',$request->id_beasiswakhsjrsn)->first();
        if(!$cekjurusan){
            return response()->json('Jurusan dengan ID tersebut tidak ada');
        }
        //cek duplikasi
        $cekduplikat = Jurusanbeasiswa::where('beasiswa_id','=',$request->beasiswa_id)
                        ->where('id_beasiswakhsjrsn','=',$request->id_beasiswakhsjrsn)->first();    
        if($cekduplikat){
            return response()->json('Relasi sudah ada.');
        }
        
        return new JurusanbeasiswaResource(Jurusanbeasiswa::create($request->all()));
    }

    public function bulkStore(BulkStoreJurusanbeasiswaRequest $request)
    {
        $bulk = collect($request->all())->map(function($arr, $key) {
            return Arr::except($arr, ['beasiswaId','idBeasiswakhsjrsn','ipkMin']);
        });

        //validasi jursan dan beasiswa
        foreach($bulk as $key=>$value){
            //cek valid beasiswa
            $cekbeasis = Beasiswa::where('id','=',$value['beasiswa_id'])->first();
            if(!$cekbeasis){
                return response()->json('Beasiswa dengan ID tersebut tidak ada');
            }
            //cek valid jurusan
            $cekjurusan = Jurusan::where('id','=',$value['id_beasiswakhsjrsn'])->first();
            if(!$cekjurusan){
                return response()->json('Jurusan dengan ID tersebut tidak ada');
            }
            //cek duplikasi
            $cekduplikat = Jurusanbeasiswa::where('beasiswa_id','=',$value['beasiswa_id'])
                            ->where('id_beasiswakhsjrsn','=',$value['id_beasiswakhsjrsn'])->first();    
            if($cekduplikat){
            return response()->json('Relasi sudah ada.');
            }
        }
        
        
        if(Jurusanbeasiswa::insert($bulk->toArray())){
            return response()->json("Jurusan beasiswa berhasil dimasukkan!");
        }else{
            return response()->json("Jurusan beasiswa gagal dimasukkan");
        }


    }

    /**
     * Display the specified resource.
     */
    public function show($jurusanbeasiswa)
    {
        //cek valid
        $cekjurusanbeasiswa = Jurusanbeasiswa::where('id','=',$jurusanbeasiswa)->first();

        if(!$cekjurusanbeasiswa){
            return response()->json('ID jurusan beasiswa tidak valid');
        }
        
        
        
        $getjrsnbeasis = Jurusanbeasiswa::select('*', 'jurusanbeasiswas.id AS idjrsnbeasis')
        ->join('beasiswas','beasiswa_id','=','beasiswas.id')
        ->join('jurusans','id_beasiswakhsjrsn','=','jurusans.id')
        ->where('jurusanbeasiswas.id','=',$cekjurusanbeasiswa->id)->first();
        
        return new JurusanbeasiswaResource($getjrsnbeasis);
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
    public function update(UpdateJurusanbeasiswaRequest $request,$jurusanbeasiswa)
    {        
        $getdatabefore = Jurusanbeasiswa::where('id','=',$jurusanbeasiswa)->first();
        //cek validasi jurusan dan beasiswa
        if(isset($request->beasiswa_id)){
            $cekbeasis = Beasiswa::where('id','=',$request->beasiswa_id)->first();
            if(!$cekbeasis){
                return response()->json('Beasiswa dengan ID tersebut tidak ada');
            }
        }  
        if(isset($request->id_beasiswakhsjrsn)){
            //cek valid jurusan
            $cekjurusan = Jurusan::where('id','=',$request->id_beasiswakhsjrsn)->first();
            if(!$cekjurusan){
                return response()->json('Jurusan dengan ID tersebut tidak ada');
            }
        }
        //end cek validasi jurusan dan beasiswa
        //cek duplikasi
        $cekduplikat = False;
        if(isset($request->beasiswa_id)&&isset($request->id_beasiswakhsjrsn)){
            $cekduplikat = Jurusanbeasiswa::where('beasiswa_id','=',$request->beasiswa_id)
            ->where('id_beasiswakhsjrsn','=',$request->id_beasiswakhsjrsn)->first();  
        }elseif(isset($request->beasiswa_id)||isset($request->id_beasiswakhsjrsn)){

            $checkerjrsn = $request->id_beasiswakhsjrsn ?? $getdatabefore->id_beasiswakhsjrsn;
            $checkerbeas = $request->beasiswa_id ?? $getdatabefore->beasiswa_id;
            $cekduplikat = Jurusanbeasiswa::where('beasiswa_id','=',$checkerbeas)
                        ->where('id_beasiswakhsjrsn','=',$checkerjrsn)->first();
        }       
        if($cekduplikat){
            return response()->json('Relasi sudah ada.');
        }
        //end cek duplikasi
        
        if($getdatabefore->update($request->all())){
            return response()->json('Relasi berhasil diupdate!');
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    // public function destroy(Jurusanbeasiswa $jurusanbeasiswa)
    // {
    //     //
    // }

    public function destroy($jrsnbeasiswa)
    {
        $cekjurusanbeasiswa = Jurusanbeasiswa::where('id','=',$jrsnbeasiswa)->first();

        if(!$cekjurusanbeasiswa){
            return response()->json('ID jurusan beasiswa tidak valid');
        }
        
        $deljrsnbeasiswa = JurusanBeasiswa::where('id',$cekjurusanbeasiswa->id)->delete();
        if($deljrsnbeasiswa){
            return response()->json("Jurusan Beasiswa berhasil didelete!");
        }else{
            return response()->json("Jurusan Beasiswa gagal didelete");
        }
    }
}
