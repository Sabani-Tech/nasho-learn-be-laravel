<?php

use App\Http\Controllers\v1\admin\auth\AdminAuthController;
use App\Http\Controllers\v1\admin\master_data\AboutController;
use App\Http\Controllers\v1\admin\master_data\KategoriMateriController;
use App\Http\Controllers\v1\admin\master_data\MateriController;
use App\Http\Controllers\v1\admin\master_data\QuisController;
use App\Http\Controllers\v1\admin\master_data\UjianController;
use App\Http\Controllers\v1\admin\master_data\UserManagementController;
use App\Http\Controllers\v1\user\auth\UserAuthController;
use App\Http\Controllers\v1\user\category\CategoryController;
use App\Http\Controllers\v1\user\soal\SoalController;
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
            Route::middleware(['auth:api', 'user_middleware'])->group(function () {
                Route::post('logout', [UserAuthController::class, 'logout'])->name('user.auth.logout');
            });
        });
        Route::middleware(['auth:api', 'user_middleware'])->group(function () {
            Route::get('profile', [UserAuthController::class, 'profile'])->name('user.auth.profile');
            Route::prefix('category')->group(function () {
                Route::get('/', [CategoryController::class, 'ListCategory'])->name('user.category');
                Route::get('/{kategori_id}/materi', [CategoryController::class, 'ListMateriByCategory'])->name('user.category_id.materi');
                Route::put('/{category_id}/status/{status_category}', [CategoryController::class, 'UpdateStatusByCategoryId'])->name('user.category_id.status');
                //quis and exam
                Route::get('/{category_id}/materi/{materi_id}/quis', [SoalController::class, 'quis'])->name('user.category_id.quis');
                Route::post('/{category_id}/materi/{materi_id}/quis/submit', [SoalController::class, 'quisSubmit'])->name('user.category_id.quis.submit');
                Route::get('/{category_id}/exam', [SoalController::class, 'exam'])->name('user.category_id.exam');
                Route::post('/{category_id}/exam/submit', [SoalController::class, 'examSubmit'])->name('user.category_id.exam.submit');
            });
        });
    });
    Route::prefix('admin')->group(function () {
        Route::prefix('auth')->group(function () {
            Route::post('login', [AdminAuthController::class, 'login'])->name('admin.auth.login');
            Route::middleware(['auth:api', 'admin_middleware'])->group(function () {
                Route::post('logout', [AdminAuthController::class, 'logout'])->name('admin.auth.logout');
            });
        });
        Route::middleware(['auth:api', 'admin_middleware'])->group(function () {
            Route::get('profile', [AdminAuthController::class, 'profile'])->name('admin.auth.profile');
            Route::prefix('master-data')->group(function () {
                Route::resource('materi', MateriController::class);
                Route::resource('kategori-materi', KategoriMateriController::class);
                Route::resource('about', AboutController::class);
                Route::resource('user', UserManagementController::class);
                Route::resource('quis', QuisController::class);
                Route::resource('ujian', UjianController::class);
            });
        });
    });
});
