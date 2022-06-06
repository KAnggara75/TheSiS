<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\APIController;

Route::get('/user/{id}', function ($id) {
	return 'User :' . $id;
});

Route::get("/", APIController::class . "@index");
Route::get("/", [APIController::class, "index"]);
Route::post("/", [APIController::class, "logout"]);

// Login
Route::post("/login", [APIController::class, "login"]);

// Register

// Board
// Location
// Control
// Gyro

//  Device {4 above}
Route::get("/board", [APIController::class, "board"]);
