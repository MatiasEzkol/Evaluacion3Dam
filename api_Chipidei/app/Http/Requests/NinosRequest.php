<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class NinosRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, mixed>
     */
    public function rules()
    {
        return [
            'cod_nino'=>'required|unique:educadora,cod_educadora',
            'nom_nino'=>'required|string|min:3|max:20',
            'apell_nino'=>'required|string',
            'fecha_nac_nino'=>'required|before:today|after:1900-01-01',
            'nivel' => 'required|exists:nivel,cod_nivel',
            'foto_nino'=>'required|string',
        ];
    }

    public function messages(){
        return [
            'cod_nino.required' => 'Indique código de nino',
            'cod_nino.unique' => 'El código :input ya existe en el sistema',
            'nom_nino.required' => 'Indique nombre del nino',
            // 'nom_nino.string' => 'El nombre solo puede contener carácteres',
            'nom_nino.min' => 'El nombre debe contener al menos 5 carácteres',
            'nom_nino.max' => 'El nombre debe contener hasta 20 carácteres',
            'apell_nino.required' => 'Indique apellido del nino',
            // 'apell_nino.string' => 'El apellido solo puede contener carácteres',
            'fecha_nac_nino.required' => 'Indique fecha de nacimiento',
            'fecha_nac_nino.before' => 'Fecha debe ser antes que hoy',
            'fecha_nac_nino.after' => 'Fecha debe ser después de 1900-01-01', 
            'nivel.required' => 'Indique código de nivel',
            'nivel.exists' => 'Nivel :input no se encuentra en el sistema'
        ];
    }
}
