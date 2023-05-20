<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Status extends Model
{
    use HasFactory;

    protected $fillable = [
        'student_id', 'batch', 'registered_semester', 'status'
    ];

    public function student()
    {
        return $this->belongsTo(Student::class);
    }
}
