<?php

namespace App\Livewire;
use App\Models\ChatMessage;
use Illuminate\Support\Facades\Auth;
use Livewire\Component;
use App\Models\User;
use App\Events\MessageSent;




class Chat extends Component
{
    public $users;
    public $selectedUser;
    public $newMessage;
    public $messages;
    public $unreadCounts = [];
    public $loginID;
    public $messageObj;


    public function mount()
    {
        $this->users = User::whereNot("id", Auth::id())->latest()->get();
        $this->selectedUser = $this->users->first();
        $this->loadMessages();
        $this->loginID = Auth::id();
        $this->unreadCounts = $this->getUnreadCounts();
        $this->messages = ChatMessage::query()
            ->where(function ($q) {
                $q->where("sender_id", Auth::id())
                    ->where("reciver_id", $this->selectedUser->id);
            })
            ->orWhere(function ($q) {
                $q->where("sender_id", $this->selectedUser->id)
                    ->where("reciver_id", Auth::id());
            })
            ->get();

    }
    public function getUnreadCounts()
    {
        return ChatMessage::select('sender_id', \DB::raw('count(*) as unread'))
            ->where('reciver_id', Auth::id())
            ->whereNull('read_at')
            ->groupBy('sender_id')
            ->pluck('unread', 'sender_id')
            ->toArray();
    }



   public function selectUser($id)
{
    $this->selectedUser = User::find($id);

    ChatMessage::where('sender_id', $this->selectedUser->id)
        ->where('reciver_id', Auth::id())
        ->whereNull('read_at')
        ->update(['read_at' => now()]);

    $this->loadMessages();
    $this->unreadCounts = $this->getUnreadCounts(); // Refresh count
}


    public function loadMessages()
    {
        $this->messages
            = ChatMessage::query()
                ->where(function ($q) {
                    $q->where("sender_id", Auth::id())
                        ->where("reciver_id", $this->selectedUser->id);
                })
                ->orWhere(function ($q) {
                    $q->where("sender_id", $this->selectedUser->id)
                        ->where("reciver_id", Auth::id());
                })

                ->get();

    }

    public function submit()
    {
        if (!$this->newMessage)
            return;

        $message = ChatMessage::create([
            'sender_id' => Auth::id(),
            'reciver_id' => $this->selectedUser->id,
            'message' => $this->newMessage,
        ]);

        $this->messages
            ->push($message);
        $this->newMessage = '';
        broadcast(new MessageSent($message));
    }

    public function updatedNewMessage($value)
    {
        $this->dispatch(
            "userTyping",
            userId: $this->loginID,
            userName: Auth::user()->name,
            selectedUser: $this->selectedUser->id
        );
    }


    public function getListeners()
    {
        return [
            "echo-private:chat.{$this->loginID},MessageSent" => "newChatMessageNotification"
        ];
    }

    public function newChatMessageNotification($message)
{
    $messageObj = ChatMessage::find($message['id']);

    if ($message["sender_id"] == $this->selectedUser->id) {
        $this->messages->push($messageObj);
        $messageObj->update(['read_at' => now()]);
    }

    $this->unreadCounts = $this->getUnreadCounts();
}


    public function render()
    {
        return view('livewire.chat');
    }
}
