<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Symfony\Component\HttpFoundation\Response;

class UserMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next): Response
    {
        //roleID 1 karena untuk user dan platform user adalah mobile
        if (Auth::guard()->user()->role_id != 1) {
            return response()->json(['statusCode' => 401, 'message' => 'anda bukan user'], 422);
        }

        if (!empty($request->header('X-PLATFORM-NASHO')) && !empty($request->header('X-VERSION-NASHO')) && !empty($request->header('X-CLIENT-KEY-NASHO'))) {
            if (
                DB::table('request_header')
                ->where('platform', $request->header('X-PLATFORM-NASHO'))
                ->first()->platform != 'mobile'
            ) {
                return response()->json(['statusCode' => 401, 'message' => 'platform ini bukan untuk web']);
            }

            if (
                !DB::table('request_header')
                    ->where([
                        ['platform', '=', $request->header('X-PLATFORM-NASHO')],
                        ['version', '=', $request->header('X-VERSION-NASHO')]
                    ])->first()
            ) {
                return response()->json(['statusCode' => 401, 'message' => 'version platform tidak sesuai']);
            }

            if (
                !DB::table('request_header')
                    ->where([
                        ['platform', '=', $request->header('X-PLATFORM-NASHO')],
                        ['version', '=', $request->header('X-VERSION-NASHO')],
                        ['client_key', '=', $request->header('X-CLIENT-KEY-NASHO')]
                    ])->first()
            ) {
                return response()->json(['statusCode' => 401, 'message' => 'client key dari platform dan version tidak sesuai']);
            }
            return $next($request);
        } else {
            return response()->json(['statusCode' => 401, 'Message' => 'Header is:version,platform,client_key'], 401);
        }
    }
}
