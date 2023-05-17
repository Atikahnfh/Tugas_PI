<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Jurusanbeasiswa extends Model
{
    use HasFactory;
    protected $fillable = [
        'beasiswa_id',
        'id_beasiswakhsjrsn',
        'ipk_min',

    ];
    public $timestamps = false;

    public function Jurusanbeasiswas() {
        return $this->belongsTo(Beasiswa::class);
    }
}
