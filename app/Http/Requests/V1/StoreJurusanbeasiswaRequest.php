<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class StoreJurusanbeasiswaRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array|string>
     */
    public function rules(): array
    {
        return [
            'beasiswaId'=> ['required'],
            'idBeasiswakhsjrsn'=> ['required'],
            'ipkMin'=> ['required']
        ];

        
    }
    protected function prepareForValidation() {
            $this->merge([
                'beasiswa_id' => $this->beasiswaId,
                'id_beasiswakhsjrsn' => $this->idBeasiswakhsjrsn,
                'ipk_min' => $this->ipkMin

            ]);
    }
}
