<?php

namespace App\Models;

use App\Models\Student;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Academic extends Model
{
    use HasFactory;

    protected $fillable = [
        'student_id', 'faculty', 'major', 'level', 'gpa'
    ];

    public function student()
    {
        return $this->belongsTo(Student::class);
    }
}
