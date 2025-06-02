import Echo from 'laravel-echo';
import Pusher from 'pusher-js';

if (process.env.NODE_ENV === 'development') {
    Pusher.logToConsole = true;
}

let echoInstance = null;

export function createEcho(token) {
    if (!token) {
        throw new Error('Token is required for Echo initialization');
    }

    if (echoInstance) {
        echoInstance.disconnect();
        echoInstance = null;
    }

    echoInstance = new Echo({
        broadcaster: 'pusher',
        key: process.env.NEXT_PUBLIC_REVERB_APP_KEY || 're0fa3ayvvqvypf9khqv',
        wsHost: process.env.NEXT_PUBLIC_REVERB_HOST || 'localhost',
        wsPort: process.env.NEXT_PUBLIC_REVERB_PORT || 8081,
        wssPort: process.env.NEXT_PUBLIC_REVERB_PORT || 8081,
        forceTLS: process.env.NEXT_PUBLIC_REVERB_SCHEME === 'https',
        enabledTransports: ['ws'],
        disableStats: true,
        authEndpoint: 'http://localhost:8000/broadcasting/auth',
        auth: {
            headers: {
                Authorization: `Bearer ${token}`,
            },
        },
    });

    echoInstance.connector.pusher.connection.bind('error', (error) => {
        console.error('Reverb connection error:', error);
    });

    return echoInstance;
}

export function getEcho() {
    return echoInstance;
}

export function disconnectEcho() {
    if (echoInstance) {
        echoInstance.disconnect();
        echoInstance = null;
    }
}