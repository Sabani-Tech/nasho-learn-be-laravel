<?php

namespace App\Http\Controllers;

class Controller
{
    public function success_response($data, string $message = 'SUCCESS', int $status_code = 200, bool $error = false)
    {
        return response()->json(
            [
                'error' => $error,
                'statusCode' => $status_code,
                'message' => $message,
                'data' => $data
            ],
            $status_code
        );
    }

    public function error_response(string $message = 'ERROR', int $status_code = 422, bool $error = true, $debug = "{}", $env_mode = "{}")
    {
        //selain error uncorrectable proses maka tampilkan mode debug
        if ($status_code != 422) {
            $error_res = array(
                'error' => $error,
                'statusCode' => $status_code,
                'message' => $message,
                'debug' => $debug,
                'env_mode' => $env_mode,
            );
        } else {
            $error_res = array(
                'error' => $error,
                'statusCode' => $status_code,
                'message' => $message
            );
        }
        return response()->json($error_res, $status_code);
    }
}
