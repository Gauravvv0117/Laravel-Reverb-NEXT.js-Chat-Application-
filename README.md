A fully functional real-time chat application built with **Laravel** (backend) and **Next.js** (frontend), powered by **Laravel Reverb** for WebSocket-based real-time communication.
## 🚀 Features

- ✅ Real-time private and group messaging  
- ✅ Typing indicators  
- ✅ Online/offline user status  
- ✅ Message read receipts  
- ✅ Authentication (Laravel Breeze)  
- ✅ WebSocket powered with Laravel Reverb (no Pusher or Socket.IO)  
- ✅ Tailwind CSS for a clean UI  
- ✅ Laravel Reverb (self-hosted WebSocket server)  
- ✅ Support for presence channels  

## 📦 Tech Stack

- **Backend:** Laravel (latest), Laravel Reverb, Laravel Breeze  
- **Frontend:** Next.js, Tailwind CSS  
- **Real-time:** Laravel Reverb (WebSocket), custom ReverbConnector  
- **Authentication:** Sanctum (API tokens)








To install the backend here is cmds

composer install
php artisan install:api
php artisan install:broadcasting 



to install frontend here is cmds 

# React dependencies (usually already installed with Next.js)
npm install react react-dom

# Next.js (core framework)
npm install next

# Axios for HTTP requests
npm install axios

# lodash.debounce for optimizing input handlers
npm install lodash

# uuid for generating unique message IDs
npm install uuid

# Bootstrap for UI styling
npm install bootstrap

# Optional: Tailwind if you're using both (comment out if only Bootstrap is used)
# npm install -D tailwindcss postcss autoprefixer
# npx tailwindcss init -p

npm install laravel-echo
npm install pusher-js # Only if you're using Pusher (skip if you're using Reverb)
# OR
npm install @ably/laravel-echo # if you're using Ably, etc.
npm install ws

