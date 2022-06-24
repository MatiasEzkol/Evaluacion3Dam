<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\{EducadoraController, EventoController, NinoController, NivelController};

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::apiResource('/educadora',EducadoraController::class);
Route::apiResource('/evento',EventoController::class);
Route::apiResource('/nino',NinoController::class);
Route::apiResource('/nivel',NivelController::class);