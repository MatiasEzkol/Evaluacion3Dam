<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class NivelesRequest extends FormRequest
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
            'cod_nivel'=>'required|unique:nivel,cod_nivel',
            'nom_nivel'=>'required|string|min:3|max:30',
        ];
    }

    public function messages(){
        return [
            'cod_nivel.required' => 'Indique código de nivel',
            'cod_nivel.unique' => 'El código :input ya existe en el sistema',
            // 'cod_nivel.min' => 'El código debe tener al menos 2 chars',
            'nom_nivel.required' => 'Indique nombre del nivel',
            // 'nom_nivel.string' => 'El nombre solo puede contener caráctere',
            'nom_nivel.min' => 'El nombre debe tener como mínimo 3 caracteres',
            'nom_nivel.max' => 'El nombre debe tener como máximo 30 caracteres',
        ];
    }
}
