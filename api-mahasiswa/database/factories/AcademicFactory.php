<?php

namespace Database\Factories;

use App\Models\Student;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Academic>
 */
class AcademicFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'student_id' => Student::all()->unique()->random()->id,
            'faculty' => $this->faker->randomElement(['Ilmu Komputer dan Teknologi Informasi']),
            'major' => 'Teknologi Informasi',
            'level' => 'S1',
            'gpa' => '3.5'
        ];
    }
}
