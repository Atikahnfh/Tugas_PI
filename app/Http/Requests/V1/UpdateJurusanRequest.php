<?php

namespace App\Http\Requests\V1;

use Illuminate\Foundation\Http\FormRequest;

class UpdateJurusanRequest extends FormRequest
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
        $method = $this->method();

        if($method == 'PUT') {
            return [
                'namaJurusan'=> ['required'],
            ];
        }else{
            return [
                'namaJurusan'=> ['sometimes','required'],
            ];
        }
        
        
    }
    protected function prepareForValidation() {

        if($this->namaJurusan){
            $this->merge(['nama_jurusan' => $this->namaJurusan,]);
        }
        
    }
}