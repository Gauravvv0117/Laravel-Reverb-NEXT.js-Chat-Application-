<div class="w-full max-w-5xl mx-auto p-6">
    <div class="relative mb-6 w-full">
        <flux:heading size="xl" level="1">{{ __('Chat') }}</flux:heading>
        <flux:subheading size="lg" class="mb-6">{{ __('Manage your profile and account settings') }}</flux:subheading>
        <flux:separator variant="subtle" />
    </div>

    <!-- Chat Container -->
    <div class="flex h-[550px] text-sm border rounded-xl shadow overflow-hidden bg-white">

        <!-- User List -->
        <div class="w-1/4 border-r bg-gray-50">
            <div class="p-4 font-bold text-gray-700 border-b">Users</div>
            <div class="divide-y">
                @foreach ($users as $user)
                    <div wire:click="selectUser({{ $user->id }})" class="p-3 cursor-pointer hover:bg-blue-100 transition 
                            {{$selectedUser->id === $user->id ? 'bg-blue-50 font-semibold' : ''}}">

                        <div class="flex justify-between items-center">
                            <div>
                                <div class="text-gray-800 font-medium">{{ $user->name }}</div>
                                <div class="text-xs text-gray-500">{{ $user->email }}</div>
                            </div>
                            @if (isset($unreadCounts[$user->id]) && $unreadCounts[$user->id] > 0)
                                <span
                                    class="bg-red-500 text-white text-xs rounded-full h-6 min-w-[1.5rem] text-center leading-6 rounded-full">
                                    {{ $unreadCounts[$user->id] }}
                                </span>
                            @endif
                        </div>

                    </div>
                @endforeach
            </div>
        </div>

        <!-- Chat Section -->
        <div class="w-3/4 flex flex-col">
            <!-- Chat Header -->
            <div class="p-4 border-b bg-gray-50">
                <div class="text-lg font-semibold text-gray-800">{{$selectedUser->name}}</div>
                <div class="text-xs text-gray-500">{{ $selectedUser->email }}</div>
            </div>

            <!-- Messages -->
            <div class="flex-1 p-4 overflow-y-auto space-y-2 bg-gray-50">
                @foreach ($messages as $message)
                    <div class="flex {{ $message->sender_id === Auth()->id() ? 'justify-end' : 'justify-start' }} ">
                        <div
                            class="max-w-xs px-4 py-2 rounded-2xl shadow 
                            {{ $message->sender_id === Auth()->id() ? 'bg-blue-600 text-white' : 'bg-green-400 text-white' }} ">

                            {{ $message->message }}
                        </div>
                    </div>
                @endforeach
            </div>

            <div id="typing-indicator" class="px-4 pb-1 text-xs text-gray-400 italic">

            </div>
            <!-- Message Input -->
            <form wire:submit="submit" class="p-4 border-t bg-white flex items-center gap-2">
                <input type="text" wire:model.live="newMessage" ;
                    class="flex-1 border border-gray-300 rounded-full px-4 py-2 text-sm focus:outline-none focus:ring focus:border-blue-400"
                    placeholder="Type your message..." />
                <button type="submit" class="bg-blue-600 hover:bg-blue-700 text-white text-sm px-4 py-2 rounded-full">
                    Send
                </button>
            </form>
        </div>
    </div>
</div>

<script>
    document.addEventListener('livewire:initialized', () => {
        Livewire.on('userTyping', (event) => {
            console.log(event);
            window.Echo.private(`chat.${event.selectedUser}`).whisper("typing", {
                userID: event.userID,
                userName: event.userName
            });
        });

        window.Echo.private(`chat.{{ $loginID }}`).listenForWhisper("typing", (event) => {
            var t = document.getElementById("typing-indicator");
            t.innerText = `${event.userName} is Typing...`;
            setTimeout(() => {
                t.innerText = '';
            }, 2000);
        });

    });
</script>