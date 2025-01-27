<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ShipmentController;
use App\Http\Controllers\Api\AuthController;

Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');

//Apis Routes for mobile
Route::post('/login', [AuthController::class, 'login']);
Route::middleware('auth:sanctum')->post('/logout', [AuthController::class, 'logout']);
Route::post('admin/shipments/create', [ShipmentController::class, 'storeAPI']);

Route::middleware('auth:sanctum')->group(function () {
    //Route::put('/shipments/{id}/status', [ShipmentController::class, 'updateStatus']);
    Route::post('admin/shipments/client-update', [ShipmentController::class, 'clientUpdate']);
    Route::post('admin/shipments/client-status', [ShipmentController::class, 'clientStatus']);
    Route::post('admin/shipments/client-status2', [ShipmentController::class, 'clientStatus2']);
});
