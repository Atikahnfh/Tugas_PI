<?php

namespace App\Http\Requests\V1;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class BulkStoreJurusanRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        $user = $this->user( );

        return $user != null && $user->tokenCan('*');
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array|string>
     */
    public function rules(): array
    {
        return [
            '*.namaJurusan'=> ['required'],
        ];

        
    }
    protected function prepareForValidation() {

        $data = [];

        foreach($this->toArray() as $obj) {
            $obj['nama_jurusan'] = $obj['namaJurusan'] ?? null;
           
            $data[] = $obj;

        }

        $this->merge($data);



    }
}
