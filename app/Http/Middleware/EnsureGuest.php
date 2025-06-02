<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class EnsureGuest
{
    public function handle(Request $request, Closure $next)
    {
        if (Auth::check()) {
            return response()->json(['error' => 'You are already logged in. Please logout first.'], 403);
        }

        return $next($request);
    }
}