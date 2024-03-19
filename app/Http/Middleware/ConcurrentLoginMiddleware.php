<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class ConcurrentLoginMiddleware
{
    public function handle($request, Closure $next)
    {
        $userId = Auth::id();
        $sessionId = session()->getId();

        // Check if the user is already logged in elsewhere
        $activeSession = DB::table('sessions')
            ->where('user_id', $userId)
            ->where('id', '<>', $sessionId)
            ->first();

        if ($activeSession) {
            // Invalidate previous session
            DB::table('sessions')->where('id', $activeSession->id)->delete();
        }

        return $next($request);
    }
}
