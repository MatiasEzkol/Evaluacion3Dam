<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\{EducadoraController, EventoController, NinoController, NivelController};

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

// Request Educadora
//===================================================================
 Route::get('/educadora',[EducadoraController::class,'index']);
 Route::get('/educadora/{educadora}',[EducadoraController::class,'show']);
 Route::post('/educadora',[EducadoraController::class,'store']);
 Route::delete('educadora/{educadora}',[EducadoraController::class,'destroy']);
 Route::patch('/educadora/{educadora}',[EducadoraController::class,'update']);
/*===================================================================*/

// Request Evento
//===================================================================
 Route::get('/evento',[EventoController::class,'index']);
 Route::get('/evento/{evento}',[EventoController::class,'show']);
 Route::post('/evento',[EventoController::class,'store']);
 Route::delete('/evento/{evento}',[EventoController::class,'destroy']);
 Route::patch('/evento/{evento}',[EventoController::class,'update']);
/*===================================================================*/

// Request Nino
//===================================================================
 Route::get('/nino',[NinoController::class,'index']);
 Route::get('/nino/{nino}',[NinoController::class,'show']);
 Route::post('/nino',[NinoController::class,'store']);
 Route::delete('/nino/{nino}',[NinoController::class,'destroy']);
 Route::patch('/nino/{nino}',[NinoController::class,'update']);
/*===================================================================*/

// Request Nivel
//===================================================================
 Route::get('/nivel',[NivelController::class,'index']);
 Route::get('/nivel/{nivel}',[NivelController::class,'show']);
 Route::post('/nivel',[NivelController::class,'store']);
 Route::delete('/nivel/{nivel}',[NivelController::class,'destroy']);
 Route::patch('/nivel/{nivel}',[NivelController::class,'update']);
/*===================================================================*/

Route::apiResource('/educadora',EducadoraController::class);
Route::apiResource('/evento',EventoController::class);
Route::apiResource('/nino',NinoController::class);
Route::apiResource('/nivel',NivelController::class);