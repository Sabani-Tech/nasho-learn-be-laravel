<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Symfony\Component\HttpFoundation\Response;

class AdminMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next): Response
    {
        //roleID 2 karena untuk admin dan platform admin adalah web
        if (Auth::guard()->user()->role_id != 2) {
            return response()->json(['statusCode' => 401, 'message' => 'anda bukan admin'], 401);
        }

        if (!empty($request->header('X-PLATFORM-NASHO')) && !empty($request->header('X-VERSION-NASHO')) && !empty($request->header('X-CLIENT-KEY-NASHO'))) {
            if (
                DB::table('request_header')
                ->where('platform', $request->header('X-PLATFORM-NASHO'))
                ->first()->platform != 'web'
            ) {
                return response()->json(['statusCode' => 401, 'message' => 'platform ini bukan untuk web'], 401);
            }

            if (
                !DB::table('request_header')
                    ->where([
                        ['platform', '=', $request->header('X-PLATFORM-NASHO')],
                        ['version', '=', $request->header('X-VERSION-NASHO')]
                    ])->first()
            ) {
                return response()->json(['statusCode' => 401, 'message' => 'version platform tidak sesuai'], 401);
            }

            if (
                !DB::table('request_header')
                    ->where([
                        ['platform', '=', $request->header('X-PLATFORM-NASHO')],
                        ['version', '=', $request->header('X-VERSION-NASHO')],
                        ['client_key', '=', $request->header('X-CLIENT-KEY-NASHO')]
                    ])->first()
            ) {
                return response()->json(['statusCode' => 401, 'message' => 'client key dari platform dan version tidak sesuai'], 401);
            }
            return $next($request);
        } else {
            return response()->json(['statusCode' => 401, 'Message' => 'Header is:version,platform,client_key'], 401);
        }
    }
}
