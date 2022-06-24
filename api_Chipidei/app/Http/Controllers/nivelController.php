<?php

namespace App\Http\Controllers;

use App\Models\Nivel;
use App\Http\Requests\NivelesRequest;
use Illuminate\Http\Request;

class NivelController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return Nivel::all();
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(NivelesRequest $request)
    {
        $nivel = new Nivel();
        $nivel->cod_nivel = $request->cod_nivel;
        $nivel->nom_nivel = $request->nom_nivel;
        $nivel->save();
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Nivel $nivel
     * @return \Illuminate\Http\Response
     */
    public function show(Nivel $nivel)
    {
        return $nivel;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Nivel $nivel
     * @return \Illuminate\Http\Response
     */
    public function update(NivelesRequest $request, Nivel $nivel)
    {
        $nivel->cod_nivel = $request->cod_nivel;
        $nivel->nom_nivel = $request->nom_nivel;
        $nivel->save();
        return $nivel;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Nivel $nivel
     * @return \Illuminate\Http\Response
     */
    public function destroy(Nivel $nivel)
    {
        $nivel->delete();
    }
}
