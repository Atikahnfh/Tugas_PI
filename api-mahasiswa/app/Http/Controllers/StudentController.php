<?php

namespace App\Http\Controllers;

use App\Models\Student;
use App\Models\Academic;
use Illuminate\Http\Request;
use App\Traits\HttpResponses;
use App\Http\Resources\StudentResource;

class StudentController extends Controller
{
    use HttpResponses;
    
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return StudentResource::collection(
                Student::all()
            );
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(Student $student, $nim)
    {
        $student  = Student::where('nim', '=', $nim)->first();
        // $academic =  Academic::where('id', '=', $student->id)->first();

        return $this->isNotExisted($nim) ? $this->isNotExisted($nim) : new StudentResource($student);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }

    private function isNotExisted($nim)
    {
        $s_nim = Student::where('nim', '=', $nim)->exists();
        if(!$s_nim) {
            return $this->error('', 'nim do not match', 403);
        }
    }
}
