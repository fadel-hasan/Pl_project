<?php

use App\Http\Controllers\API\CategoryController;
use App\Http\Controllers\API\CompanyController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\API\OrderController;
use App\Http\Controllers\API\MedicineController;
use App\Http\Controllers\API\RegisterController;
use App\Models\Category;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/
Route::post('register',[RegisterController::class,'register']);
Route::post('login', [RegisterController::class,'login']);

Route::middleware('auth:api')->group(function(){
    Route::middleware('check')->group(function(){
        Route::post('medicine/create', [MedicineController::class, 'store']);
        Route::put('medicine/{id}', [MedicineController::class,'update']);
        Route::post('category/create', [CategoryController::class, 'store']);
        Route::post('company/create', [CompanyController::class, 'store']);
    });
    Route::get('category',[CategoryController::class,'index']);
    Route::get('company',[CompanyController::class,'index']);

    Route::get('medicine/prefer',[MedicineController::class,'getPreferredMedicines']);
    Route::get('medicine/prefer/{id}',[MedicineController::class,'addPreferredMedicine']);
    Route::get('medicine/', [MedicineController::class, 'index']);
    // Route::get('/v1/medicines/search', 'MedicineController@searchByClassification');
    Route::get('/medicine/search', [MedicineController::class,'search']);
    Route::get('/medicine/{id}', [MedicineController::class,'show']);

    Route::prefix('order')->group(function () {
    // Create a new order
    Route::post('create', [OrderController::class, 'create']);

    // Retrieve all orders
    Route::get('/', [OrderController::class, 'index']);

    Route::get('/pharmacist', [OrderController::class, 'pharmacistOrders']);
    // Retrieve a specific order
    Route::get('/{id}', [OrderController::class, 'show']);


    Route::delete('/{id}', [OrderController::class, 'destroy']);

    Route::middleware('check')->group(function(){
    Route::put('/paymentStatus/{orderId}', [OrderController::class, 'updatePaymentStatus']);
    Route::put('/status/{orderId}', [OrderController::class, 'updateStatus']);
    });
});
    Route::get('logout',[RegisterController::class,'logout']);
});


Route::get("hello",function(){
    return "heloo";
});
