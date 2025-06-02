<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use Illuminate\Routing\Controller;
use Illuminate\Support\Facades\Broadcast;
use Illuminate\Support\Facades\Log;

class BroadcastController extends Controller
{
    public function authenticate(Request $request)
    {
        $user = $request->user();
        if (!$user) {
            Log::error('Broadcast auth failed: User not authenticated', [
                'request' => $request->all(),
                'headers' => $request->headers->all(),
            ]);
            return response('Unauthorized', 401);
        }

        if (!isset($user->id)) {
            Log::error('Broadcast auth failed: Invalid user data', [
                'user' => $user,
                'channel' => $request->channel_name,
            ]);
            return response('Invalid user data', 422);
        }

        Log::info('Broadcast auth succeeded', [
            'user_id' => $user->id,
            'channel' => $request->channel_name,
        ]);
        return Broadcast::auth($request);
    }
}