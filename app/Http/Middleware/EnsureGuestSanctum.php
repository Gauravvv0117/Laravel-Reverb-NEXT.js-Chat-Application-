<?php

// app/Http/Middleware/EnsureGuestSanctum.php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpKernel\Exception\HttpException;

class EnsureGuestSanctum
{
    public function handle(Request $request, Closure $next)
    {
        if ($request->user('sanctum')) {
            // User is already logged in, return 403
            throw new HttpException(403, 'Already authenticated');
        }

        return $next($request);
    }
}

