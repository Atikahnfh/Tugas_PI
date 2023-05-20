<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Mitra extends Model
{
    use HasFactory;
    protected $fillable = [
        'nama_mitra',   
    ];  
    public $timestamps = false;

    public function beasiswas() {
        return $this->hasMany(Beasiswa::class);
    }
}
