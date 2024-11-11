<?php

use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return response()->json('Welcome API Nasho Learn 1.0, Laravel Components 11.0');
});
