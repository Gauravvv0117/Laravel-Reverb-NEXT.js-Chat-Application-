<?php

namespace App\Http\Controllers\Api;

use App\Events\MessageSent;
use App\Http\Controllers\Controller;
use App\Models\Message;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class ChatController extends Controller
{
    public function sendMessage(Request $request)
    {
        $request->validate([
            'receiver_id' => 'required|exists:users,id',
            'message' => 'required|string',
        ]);

        $message = Message::create([
            'sender_id' => $request->user()->id,
            'receiver_id' => $request->receiver_id,
            'message' => $request->message,
        ]);

        $message->load(['sender:id,name', 'receiver:id,name']);

        broadcast(new MessageSent($message))->toOthers();

        return response()->json(['message' => 'Message sent', 'data' => $message], 201);
    }

    public function getMessages()
    {
        $messages = Message::with('user:id,name')->latest()->take(50)->get()->reverse()->values();
        return response()->json(['messages' => $messages]);
    }

    public function getPrivateMessages($userId)
    {
        $authUserId = auth()->id();
        $messages = Message::where(function ($query) use ($authUserId, $userId) {
            $query->where('sender_id', $authUserId)->where('receiver_id', $userId);
        })->orWhere(function ($query) use ($authUserId, $userId) {
            $query->where('sender_id', $userId)->where('receiver_id', $authUserId);
        })->orderBy('created_at', 'asc')->get();
        return response()->json($messages);
    }

    public function markMessagesRead(Request $request)
    {
        $request->validate([
            'message_ids' => 'required|array',
            'message_ids.*' => 'exists:messages,id',
        ]);

        $userId = auth()->id();
        $messageIds = $request->message_ids;

        $updated = Message::whereIn('id', $messageIds)
            ->where('receiver_id', $userId)
            ->whereNull('read_at')
            ->update(['read_at' => now()]);

        return response()->json(['message' => "$updated messages marked as read"]);
    }

    public function getUnreadCounts(Request $request)
    {
        $userId = auth()->id();
        if (!$userId) {
            return response()->json(['error' => 'Unauthorized'], 401);
        }

        $counts = Message::where('receiver_id', $userId)
            ->whereNull('read_at')
            ->groupBy('sender_id')
            ->selectRaw('sender_id, COUNT(*) as unread_count')
            ->with('sender:id,name')
            ->get()
            ->mapWithKeys(function ($item) {
                return [$item->sender_id => $item->unread_count];
            });

        return response()->json($counts);
    }
}