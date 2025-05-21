<?php

use Illuminate\Support\Facades\Broadcast;

Broadcast::channel('chat.{reciver_id}', function ($user, $reciver_id) {
    return (int) $user->id === (int) $reciver_id;
});


