<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\ChatController;
use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\Api\BroadcastController;

Route::post('/register', [AuthController::class, 'register']);
Route::post('/login', [AuthController::class, 'login']);

Route::middleware('auth:sanctum')->group(function () {
    Route::post('/logout', [AuthController::class, 'logout']);
    Route::get('/user', function () {
        return auth()->user();
    });
    Route::get('/users', function () {
        return App\Models\User::where('id', '!=', auth()->id())->get();
    });
    Route::post('/chat/message', [ChatController::class, 'sendMessage']);
    Route::get('/chat/messages', [ChatController::class, 'getMessages']);
    Route::get('/chat/messages/private/{userId}', [ChatController::class, 'getPrivateMessages']);
    Route::get('/chat/unread-counts', [ChatController::class, 'getUnreadCounts']);
    Route::post('/chat/mark-messages-read', [ChatController::class, 'markMessagesRead']);
    Route::post('/broadcasting/auth', [BroadcastController::class, 'authenticate']);
});