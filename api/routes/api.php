<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;

Route::get('/user/{id}', function ($id) {
	return 'User :' . $id;
});

Route::get("/", AuthController::class . "@index");
Route::get("/", [AuthController::class, "index"]);
Route::post("/", [AuthController::class, "logout"]);

// Login
Route::post("/login", [AuthController::class, "login"]);
Route::get("/login/{email}/{pass}", [AuthController::class, "login"]);
