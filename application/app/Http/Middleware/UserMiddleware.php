<?php

namespace App\Http\Middleware;

use App\Http\Controllers\Controller;
use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Symfony\Component\HttpFoundation\Response;

class UserMiddleware extends Controller
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
            return $this->error_response('Your not users,this feature for user roles', 401, true, 'hint: please use token from role_id:1 cause that roles is users', env('APP_ENV'));
        }

        if (!empty($request->header('X-PLATFORM-NASHO')) && !empty($request->header('X-VERSION-NASHO')) && !empty($request->header('X-CLIENT-KEY-NASHO'))) {
            if (
                !DB::table('request_header')
                    ->where('platform', $request->header('X-PLATFORM-NASHO'))
                    ->first()
            ) {
                return $this->error_response('platform not exists', 401, true, 'Hint: platform available is mobile or web,and use that platform base on roles', env('APP_ENV'));
            }

            if (
                DB::table('request_header')
                ->where('platform', $request->header('X-PLATFORM-NASHO'))
                ->first()->platform != config('header.mobile_platform')
            ) {
                return $this->error_response('wrong platform', 401, true, 'Hint:use mobile platfrom cause that is user roles', env('APP_ENV'));
            }

            if (
                !DB::table('request_header')
                    ->where([
                        ['platform', '=', $request->header('X-PLATFORM-NASHO')],
                        ['version', '=', $request->header('X-VERSION-NASHO')]
                    ])->first()
            ) {
                return $this->error_response('wrong version', 401, true, 'Hint: use the version platform is matches from platform used it', env('APP_ENV'));
            }

            if (
                !DB::table('request_header')
                    ->where([
                        ['platform', '=', $request->header('X-PLATFORM-NASHO')],
                        ['version', '=', $request->header('X-VERSION-NASHO')],
                        ['client_key', '=', $request->header('X-CLIENT-KEY-NASHO')]
                    ])->first()
            ) {
                return $this->error_response('wrong client key', 401, true, 'Hint: please contact administrator for client key base on platform and version,cause that secret on used', env('APP_ENV'));
            }
            return $next($request);
        } else {
            return $this->error_response('Please field all header it used', 401, true, 'Hint:version,platform,client_key', env('APP_ENV'));
        }
    }
}
