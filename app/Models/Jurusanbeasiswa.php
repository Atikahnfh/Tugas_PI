<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Jurusanbeasiswa extends Model
{
    use HasFactory;

    public function Beasiswas() {
        return $this->belongsTo(Beasiswa::class);
    }
}
