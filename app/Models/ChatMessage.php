<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ChatMessage extends Model
{
    protected $fillable = ["sender_id","reciver_id","message"];
    public function sender(){
        return $this->belongsTo(User::class,"sender_id");
    }
    public function reciver(){
        return $this->belongsTo(User::class,"reciver_id");
    }
    public function isUnread()
{
    return is_null($this->read_at);
}

}
