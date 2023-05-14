<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Beasiswa extends Model
{
    use HasFactory;

    protected $fillable = [
        'nama_beasiswa',
        'id_mitra',
        'deskripsi',
        'angkatan_awal',
        'angkatan_akhir',
        'sem_min',
        'sem_max',
        'status'
    ];
    public $timestamps = false;
    public function jurusanbeasiswas() {
        return $this->hasMany(Jurusanbeasiswa::class);
    }

}
