<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class EducadorasRequest extends FormRequest
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
            'cod_educadora'=>'required|unique:educadora,cod_educadora',
            'nom_educadora'=>'required|string|between:1,30',
            'apell_educadora'=>'required|string',
            'fecha_nac_educadora'=>'required|date_format:"Y-m-d"|before:today|after:1900-01-01',
            'nivel' => 'required|exists:nivel,cod_nivel',
        ];
    }

    public function messages(){
        return [
            'cod_educadora.required' => 'Indique código de educadora',
            'cod_educadora.unique' => 'El código :input ya existe en el sistema',
            // 'cod_educadora.min' => 'El código debe tener al menos 2 chars',
            'nom_educadora.required' => 'Indique nombre del producto',
            'nom_educadora.string' => 'El nombre solo puede contener caráctere',
            'nom_educadora.between:1' => 'El nombre no puede ser vacío',
            'nom_educadora.between:30' => 'El nombre no puede tener más de 30 carácteres',
            // 'nom_educadora.between' => 'El nombre no puede tener más de 30 carácteres',
            'apell_educadora.required' => 'Indique stock del producto',
            'apell_educadora.string' => 'El apellido solo puede contener carácteres',
            // 'stock.gte' => 'El valor mínimo de stock es cero',
            'fecha_nac_educadora.required' => 'Indique fecha de nacimiento',
            'fecha_nac_educadora.date_format' => 'El formato debe ser año-mes-día',
            'fecha_nac_educadora.before' => 'Fecha debe ser antes que hoy',
            'fecha_nac_educadora.after' => 'Fecha debe ser después de 1900-01-01', 
            // 'fecha_nac_educadora.after' => 'Fecha debe ser después de 1900-01-01', 
            'nivel.required' => 'Indique código de nivel',
            'nivel.exists' => 'Nivel :input no se encuentra en el sistema'
        ];
    }
}
