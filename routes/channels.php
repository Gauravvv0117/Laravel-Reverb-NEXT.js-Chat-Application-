<?php

use Illuminate\Support\Facades\Broadcast;
use Illuminate\Support\Facades\Log;

Broadcast::channel('chat.{userId1}.{userId2}', function ($user, $userId1, $userId2) {
    if (!auth()->check()) {
        Log::error('Channel authorization failed: User not authenticated', [
            'userId1' => $userId1,
            'userId2' => $userId2,
            'request' => request()->all(),
        ]);
        return false;
    }

    $isAuthorized = in_array((int)$user->id, [(int)$userId1, (int)$userId2]);
    if (!$isAuthorized) {
        Log::error('Channel authorization failed: User ID mismatch', [
            'user_id' => $user->id,
            'userId1' => $userId1,
            'userId2' => $userId2,
        ]);
    } else {
        Log::info('Channel authorization succeeded', [
            'user_id' => $user->id,
            'userId1' => $userId1,
            'userId2' => $userId2,
        ]);
    }

    return $isAuthorized;
});

Broadcast::channel('presence-chat', function ($user) {
    if (!auth()->check()) {
        Log::error('Presence channel authorization failed: User not authenticated');
        return null;
    }

    if (!isset($user->id) || !isset($user->name)) {
        Log::error('Presence channel authorization failed: Invalid user data', [
            'user_id' => $user->id ?? 'missing',
            'user_name' => $user->name ?? 'missing',
        ]);
        return null;
    }

    Log::info('Presence channel authorization succeeded', ['user_id' => $user->id]);
    return [
        'id' => $user->id,
        'name' => $user->name ?? 'User ' . $user->id, // Fallback name
    ];
});