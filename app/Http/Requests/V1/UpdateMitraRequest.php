<?php

namespace App\Http\Requests\V1;

use Illuminate\Foundation\Http\FormRequest;

class UpdateMitraRequest extends FormRequest
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
                'namaMitra'=> ['required'],
            ];
        }else{
            return [
                'namaMitra'=> ['sometimes','required'],
            ];
        }
        
        
    }
    protected function prepareForValidation() {

        if($this->namaMitra){
            $this->merge(['nama_mitra' => $this->namaMitra,]);
        }
        
    }
}
