<?php

namespace App\Http\Requests\V1;

use Illuminate\Foundation\Http\FormRequest;

class UpdateJurusanbeasiswaRequest extends FormRequest
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
                'beasiswaId'=> ['required'],
                'idBeasiswakhsjrsn'=> ['required'],
                'ipkMin'=> ['required'] 
            ];
        }else{
            return [
                'beasiswaId'=> ['sometimes','required'],
                'idBeasiswakhsjrsn'=> ['sometimes','required'],
                'ipkMin'=> ['sometimes','required']
            ];
        }
        
        
    }
    protected function prepareForValidation() {

        if($this->beasiswaId){
            $this->merge(['beasiswa_id' => $this->beasiswaId,]);
        }
        if($this->idBeasiswakhsjrsn){
            $this->merge(['id_beasiswakhsjrsn' => $this->idBeasiswakhsjrsn,]);
        }
        if($this->ipkMin){
            $this->merge(['ipk_min' => $this->ipkMin,]);
        }
    }
}
