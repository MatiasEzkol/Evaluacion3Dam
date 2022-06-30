<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
// TODO: Eventos Request

class EventosRequest extends FormRequest
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
            'cod_evento' => 'required|unique:evento,cod_evento',
            'descripcion_evento' => 'required|min:7|max:50',
        ];
    }

    public function messages(){
        return [
            'cod_evento.required' => 'Indique código de evento',
            'cod_evento.unique' => 'El código :input ya existe en el sistema',
            // 'cod_educadora.min' => 'El código debe tener al menos 2 chars',
            'descripcion_evento.required' => 'Indique la descripción',
            'descripcion_evento.min' => 'La descripción debe contener al menos 7 carácteres',
            'descripcion_evento.max' => 'La descripción debe contener hasta 50 carácteres',
        ];
    }
}
