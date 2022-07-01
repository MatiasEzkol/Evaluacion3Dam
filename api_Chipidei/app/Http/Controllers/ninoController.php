<?php

namespace App\Http\Controllers;

use App\Models\Nino;
use Illuminate\Http\Request;
use App\Http\Requests\NinosRequest;

class NinoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return Nino::all();
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(NinosRequest $request)
    {
        $nino = new Nino();
        $nino->rut_nino = $request->rut_nino;
        $nino->nom_nino = $request->nom_nino;
        $nino->apell_nino = $request->apell_nino;
        $nino->fecha_nac_nino = $request->fecha_nac_nino;
        $nino->fecha_adm_nino = $request->fecha_adm_nino;
        $nino->nom_padre_nino = $request->nom_padre_nino;
        $nino->nom_madre_nino = $request->nom_madre_nino;
        $nino->tel_nino = $request->tel_nino;
        $nino->direccion_nino = $request->direccion_nino;
        $nino->nivel = $request->nivel;
        $nino->save();
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Nino $nino
     * @return \Illuminate\Http\Response
     */
    public function show(Nino $nino)
    {
        return $nino;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Nino $nino
     * @return \Illuminate\Http\Response
     */
    public function update(NinosRequest $request, Nino $nino)
    {
        $nino->rut_nino = $request->rut_nino;
        $nino->nom_nino = $request->nom_nino;
        $nino->apell_nino = $request->apell_nino;
        $nino->fecha_nac_nino = $request->fecha_nac_nino;
        $nino->fecha_adm_nino = $request->fecha_adm_nino;
        $nino->nom_padre_nino = $request->nom_padre_nino;
        $nino->nom_madre_nino = $request->nom_madre_nino;
        $nino->tel_nino = $request->tel_nino;
        $nino->direccion_nino = $request->direccion_nino;
        $nino->nivel = $request->nivel;
        $nino->save();
        return $nino;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Nino $nino
     * @return \Illuminate\Http\Response
     */
    public function destroy(Nino $nino)
    {
        $nino->delete();
    }
}
