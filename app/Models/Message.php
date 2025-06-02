<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Message extends Model
{
    use HasFactory;

    protected $fillable = [
    'message', 'sender_id', 'receiver_id', 'read_at', 'is_read'
];

    // Generic relation to User (you can keep this if needed elsewhere)
    public function user()
    {
        return $this->belongsTo(User::class);
    }

    // Specific relation for sender
    public function sender()
    {
        return $this->belongsTo(User::class, 'sender_id');
    }

    // Specific relation for receiver
    public function receiver()
    {
        return $this->belongsTo(User::class, 'receiver_id');
    }

    public function sentMessages()
{
    return $this->hasMany(Message::class, 'sender_id');
}

public function receivedMessages()
{
    return $this->hasMany(Message::class, 'receiver_id');
}

public function allMessages()
{
    return Message::where('sender_id', $this->id)
                  ->orWhere('receiver_id', $this->id);
}
}
