<?php

namespace App\Http\Controllers;

use App\Models\Nino;
use Illuminate\Http\Request;

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
    public function store(Request $request)
    {
        $nino = new Nino();
        $nino->cod_nino = $request->cod_nino;
        $nino->nom_nino = $request->nom_nino;
        $nino->apell_nino = $request->apell_nino;
        $nino->foto_nino = $request->foto_nino;
        $nino->fecha_nac_nino = $request->fecha_nac_nino;
        // $nino->nivel_id = $request->nivel_id;
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
    public function update(Request $request, Nino $nino)
    {
        $nino->cod_nino = $request->cod_nino;
        $nino->nom_nino = $request->nom_nino;
        $nino->apell_nino = $request->apell_nino;
        $nino->foto_nino = $request->foto_nino;
        $nino->fecha_nac_nino = $request->fecha_nac_nino;
        // $nino->nivel_id = $request->nivel_id;
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
