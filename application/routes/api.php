<?php

use App\Http\Controllers\v1\user\auth\UserAuthController;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/**
 * api v1(nasho_learn)
 */

//handler for build response success or error response
function handle_builder_response($data, $message, $status_code = 200)
{
    if ($status_code != 200) {
        // error response
        $res = array('statusCode' => $status_code, 'message' => $message);
    } else {
        // success response
        $res = array('statusCode' => $status_code, 'message' => $message, 'data' => $data);
    }

    return response()->json($res, $status_code);
}

//mapping data user and token base on user
function handle_mapping_user_by_token($user, $token)
{
    return array(
        'id' => $user->id,
        'name' => $user->name,
        'email' => $user->email,
        'token' => $token,
    );
}

//setter for set personal access token for user
function set_personal_access_client($id_user)
{

    $user = User::find($id_user);
    if (handle_validate_existing_user($user)) {
        $token = handle_token_data_by_user($user);
        $data = handle_mapping_user_by_token($user, $token);
        return handle_builder_response($data, 'berhasil get token by user');
    }

    return handle_builder_response($user, 'user invalid for generate token', 422);
}

//validate if user any data or not
function handle_validate_existing_user($user)
{
    if (!empty($user)) {
        return true;
    }
    return false;
}

//generate token for user
function handle_token_data_by_user($user)
{
    return $user->createToken('nasho_learn')->accessToken;
}

// get token from set access token
function get_personal_access_client($id_user)
{
    try {
        return set_personal_access_client($id_user);
    } catch (\Exception $errors) {
        return handle_builder_response($errors, $errors->getMessage(), 500);
    }
}

Route::prefix('v1')->group(function () {
    Route::get('test', function (Request $request) {
        return get_personal_access_client($request->input('id'));
    });
    Route::prefix('user')->group(function () {
        Route::prefix('auth')->group(function () {
            Route::post('register', [UserAuthController::class, 'register'])->name('user.auth.register');
            Route::post('login', [UserAuthController::class, 'login'])->name('user.auth.login');
            Route::middleware('auth:api')->group(function () {
                Route::post('logout', [UserAuthController::class, 'logout'])->name('user.auth.logout');
            });
        });
        Route::middleware('auth:api')->group(function () {
            Route::get('profile', [UserAuthController::class, 'profile'])->name('user.auth.profile');
        });
    });
    Route::prefix('admin')->group(function () {});
});
