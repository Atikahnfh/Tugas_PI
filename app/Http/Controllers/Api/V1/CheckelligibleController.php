<?php

namespace App\Http\Controllers\Api\V1;

use App\Models\Beasiswa;
use App\Models\JurusanBeasiswa;
use App\Models\Jurusan; 
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class CheckelligibleController extends Controller
{
    public function cekelligible(Request $request){
        $input = $request->all();
        //pertama-tama validasi data request
        //ipkmahasiswa,jurusan mahasiswa,angkatan mahasiswa, idbeasiswa
        $validator = Validator::make($input, [
            'ipkMhs' => 'required',
            'jrsnMhs' => 'required',
            'aktMhs' => 'required',
            'semMhs' => 'required',
            'idBeasiswa' => 'required'
        ]);

        if($validator->fails()){
            return response()->json('data belum lengkap');
        }
        //cek validasi data di database
        $cekvalidasidb = Beasiswa::where('id', $request->idBeasiswa)->where('status','=',1)->first();
        $cekvalidasijrsn = Jurusan::where('id', $request->jrsnMhs)->first();
        if(!$cekvalidasidb)
            return response()->json('Beasiswa dengan ID tersebut tidak ada atau beasiswa tersebut tidak aktif lagi');
        if(!$cekvalidasijrsn)
            return response()->json('Jurusan dengan ID tersebut tidak ada.');

        //cek angkatan
        $cekangkatan = Beasiswa::where('angkatan_awal','<=',$request->aktMhs)
                        ->where('angkatan_akhir','>=', $request->aktMhs)
                        ->where('id',$request->idBeasiswa)->first();
        if(!$cekangkatan){
            return response()->json('Maaf anda tidak eligible untuk masuk beasiswa ini. Angkatan anda tidak dalam jangkauan beasiswa.');
        }

        //cek semester
        $ceksemester = Beasiswa::where('sem_min','<=',$request->semMhs)
                        ->where('sem_max','>=', $request->semMhs)
                        ->where('id',$request->idBeasiswa)->first();
        if(!$ceksemester){
            return response()->json('Maaf anda tidak eligible untuk masuk beasiswa ini. Semester anda tidak dalam jangkauan beasiswa.');
        }
        //cek IPK dan jurusan
        $cekjrsn = Jurusanbeasiswa::where('beasiswa_id','=', $request->idBeasiswa)
                                        ->where('id_beasiswakhsjrsn','=', $request->jrsnMhs)->first();
        if(!$cekjrsn){
            return response()->json('Maaf anda tidak elligible untuk masuk beasiswa ini. Jurusan yang diterima beasiswa tidak mencakup jurusan anda.');
        }
        $cekipk = Jurusanbeasiswa::where('id', $cekjrsn->id)->where('ipk_min','<=',$request->ipkMhs)->first();
        if(!$cekipk){
            return response()->json('Maaf anda tidak elligible untuk masuk beasiswa ini. Nilai IPK anda tidak mencukupi.');
        }

        //klo lancar semua artinya berhasil
        return response()->json('Anda berkesempatan untuk memasuki beasiswa ini! Congrats!');

    }
    
    public function cekbeasiselligible(Request $request){
        $input = $request->all();
        //pertama-tama validasi data request
        //ipkmahasiswa,jurusan mahasiswa,angkatan mahasiswa
        $validator = Validator::make($input, [
            'ipkMhs' => 'required',
            'jrsnMhs' => 'required',
            'aktMhs' => 'required',
            'semMhs' => 'required'
        ]);
        if($validator->fails()){
            return response()->json('data belum lengkap');
        }

        //cekvalidasi jurusan
        $cekvalidasijrsn = Jurusan::where('id', $request->jrsnMhs)->first();
        if(!$cekvalidasijrsn)
            return response()->json('Jurusan dengan ID tersebut tidak ada.');
        //cari beasiswa sesuai jurusan

        $carijurusanbeasiswa = Jurusanbeasiswa::where('id_beasiswakhsjrsn', $request->jrsnMhs)
        ->where('ipk_min','<=', $request->ipkMhs)
        ->get();

        //cek setiap beasiswa semester,dll
        $arraybeasis[] = '';

        foreach($carijurusanbeasiswa as $key=>$value){
            $cekkompatibilitas = Beasiswa::where('id',$value['beasiswa_id'])
                                    ->where('angkatan_awal','<=', $request->aktMhs)
                                    ->where('angkatan_akhir','>=', $request->aktMhs)
                                    ->where('sem_min','<=', $request->semMhs)
                                    ->where('sem_max','>=', $request->semMhs)           
                                    ->first();
            if(!$cekkompatibilitas){
                continue;
            }
            //untuk setiap beasiswa yang cocok masukkan ke sebuaharray.
            //(idbeasiswanya aja) abis tu pakai beasiswaresource untuk tampilkannya
        }

        
    }

}
