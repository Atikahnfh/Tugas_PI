<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Statusbeasiswa extends Model
{
    use HasFactory;

    public function statusbeasiswas() {
        return $this->hasMany(Beasiswa::class);
    }
}
