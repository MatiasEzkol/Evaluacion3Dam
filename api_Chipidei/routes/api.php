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


Route::apiResource('/educadora',EducadoraController::class);
Route::apiResource('/evento',EventoController::class);
Route::apiResource('/nino',NinoController::class);
Route::apiResource('/nivel',NivelController::class);