<?php

namespace App\Http\Controllers;

use App\Models\Educadora;
use Illuminate\Http\Request;
use App\Http\Requests\EducadoraRequest;

class EducadoraController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return Educadora::all();
        // return Educadora::orderBy('nombre_educadora')->get();
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $educadora = new Educadora();
        $educadora->cod_educadora = $request->cod_educadora;
        $educadora->nom_educadora = $request->nom_educadora;
        $educadora->apell_educadora = $request->apell_educadora;
        $educadora->fecha_nac_educadora = $request->fecha_nac_educadora;
        // $educadora->nivel_id = $request->nivel_id;
        $educadora->save();
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Educadora $educadora
     * @return \Illuminate\Http\Response
     */
    public function show(Educadora $educadora)
    {
        return $educadora;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Educadora $educadora
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Educadora $educadora)
    {
        $educadora->cod_educadora = $request->cod_educadora;
        $educadora->nom_educadora = $request->nom_educadora;
        $educadora->apell_educadora = $request->apell_educadora;
        $educadora->fecha_nac_educadora = $request->fecha_nac_educadora;
        // $educadora->nivel_id = $request->nivel_id;
        $educadora->save();
        return $educadora;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Educadora $educadora
     * @return \Illuminate\Http\Response
     */
    public function destroy(Educadora $educadora)
    {
        $educadora->delete();
    }
}
