import { useEffect, useState, useRef, useCallback } from "react";
import { createEcho, disconnectEcho } from "../utils/echo";
import { useRouter } from "next/router";
import axios from "axios";
import debounce from "lodash/debounce";
import { v4 as uuidv4 } from 'uuid';
import "../styles/globals.css";
import 'bootstrap/dist/css/bootstrap.min.css';



// SVG Icons
const Send = ({ className = "w-5 h-5" }) => (
    <svg className={className} fill="none" viewBox="0 0 24 24" stroke="currentColor">
        <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M12 19l9 2-9-18-9 18 9-2zm0 0v-8" />
    </svg>
);
const LogOut = ({ className = "w-5 h-5" }) => (
    <svg className={className} fill="none" viewBox="0 0 24 24" stroke="currentColor">
        <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M17 16l4-4m0 0l-4-4m4 4H7m6 4v1a3 3 0 01-3 3H6a3 3 0 01-3-3V7a3 3 0 013-3h4a3 3 0 013 3v1" />
    </svg>
);
const MessageCircle = ({ className = "w-5 h-5" }) => (
    <svg className={className} fill="none" viewBox="0 0 24 24" stroke="currentColor">
        <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M8 12h.01M12 12h.01M16 12h.01M21 12c0 4.418-4.03 8-9 8a9.863 9.863 0 01-4.255-.949L3 20l1.395-3.72C3.512 15.042 3 13.574 3 12c0-4.418 4.03-8 9-8s9 3.582 9 8z" />
    </svg>
);
const Users = ({ className = "w-5 h-5" }) => (
    <svg className={className} fill="none" viewBox="0 0 24 24" stroke="currentColor">
        <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M12 4.354a4 4 0 110 5.292M15 21H3v-1a6 6 0 0112 0v1zm0 0h6v-1a6 6 0 00-9-5.197M13.5 7a2.5 2.5 0 11-5 0 2.5 2.5 0 015 0z" />
    </svg>
);
const User = ({ className = "w-5 h-5" }) => (
    <svg className={className} fill="none" viewBox="0 0 24 24" stroke="currentColor">
        <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z" />
    </svg>
);
const CheckCircle = ({ className = "w-4 h-4" }) => (
    <svg className={className} fill="none" viewBox="0 0 24 24" stroke="currentColor">
        <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z" />
    </svg>
);
const Check = ({ className = "w-4 h-4" }) => (
    <svg className={className} fill="none" viewBox="0 0 24 24" stroke="currentColor">
        <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M5 13l4 4L19 7" />
    </svg>
);
const Wifi = ({ className = "w-4 h-4" }) => (
    <svg className={className} fill="none" viewBox="0 0 24 24" stroke="currentColor">
        <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M8.111 16.404a5.5 5.5 0 017.778 0M12 20h.01m-7.08-7.071c3.904-3.905 10.236-3.905 14.141 0M1.394 9.393c5.857-5.857 15.355-5.857 21.213 0" />
    </svg>
);
const WifiOff = ({ className = "w-4 h-4" }) => (
    <svg className={className} fill="none" viewBox="0 0 24 24" stroke="currentColor">
        <path strokeLinecap="round" stroke灿
            strokeWidth={2} d="M3 3l18 18M10.584 10.587a4.5 4.5 0 006.32 6.32M7.05 7.05C4.74 9.36 4.74 13.14 7.05 15.45M19.07 4.93c-1.73-1.73-4.02-2.68-6.46-2.68" />
    </svg>
);

export default function Home() {
    const router = useRouter();
    const [messages, setMessages] = useState([]);
    const [input, setInput] = useState("");
    const [token, setToken] = useState(null);
    const [users, setUsers] = useState([]);
    const [selectedUser, setSelectedUser] = useState(null);
    const [currentUserId, setCurrentUserId] = useState(null);
    const [loadingMessages, setLoadingMessages] = useState(false);
    const [loadingUsers, setLoadingUsers] = useState(false);
    const [isConnected, setIsConnected] = useState(false);
    const [reconnectAttempts, setReconnectAttempts] = useState(0);
    const [typingUsers, setTypingUsers] = useState(new Set());
    const [isTyping, setIsTyping] = useState(false);
    const [lastSeen, setLastSeen] = useState({});
    const [messageStatuses, setMessageStatuses] = useState({});
    const [unreadCounts, setUnreadCounts] = useState({});
    const [debugMessage, setDebugMessage] = useState("");

    const echo = useRef(null);
    const channel = useRef(null);
    const messagesEndRef = useRef(null);
    const typingTimeoutRef = useRef(null);
    const reconnectTimeoutRef = useRef(null);
    const heartbeatRef = useRef(null);

    const setTemporaryDebugMessage = useCallback((message, duration = 5000) => {
        setDebugMessage(message);
        setTimeout(() => setDebugMessage(""), duration);
    }, []);

    const testAuth = async () => {
        try {
            const response = await axios.get("http://localhost:8000/api/user", {
                headers: { Authorization: `Bearer ${token}` },
            });
            setTemporaryDebugMessage(`Auth successful: ${response.data.name}`);
            console.log('Auth test:', response.data);
        } catch (error) {
            setTemporaryDebugMessage(`Auth failed: ${error.response?.data?.message || error.message}`);
            console.error('Auth test failed:', error.response?.data || error.message);
        }
    };

    const checkConnection = useCallback(() => {
        if (echo.current && echo.current.connector && echo.current.connector.pusher) {
            const state = echo.current.connector.pusher.connection.state;
            setIsConnected(state === 'connected');
            if (state === 'disconnected' || state === 'failed') {
                attemptReconnect();
            }
        }
    }, []);

    const attemptReconnect = useCallback(() => {
        if (reconnectAttempts >= 5) {
            setTemporaryDebugMessage("Max reconnection attempts reached. Please refresh.");
            return;
        }
        if (!token) {
            router.push("/login");
            return;
        }
        setReconnectAttempts(prev => prev + 1);
        reconnectTimeoutRef.current = setTimeout(() => {
            if (echo.current) disconnectEcho();
            try {
                echo.current = createEcho(token);
                setupEchoListeners();
                setTimeout(checkConnection, 2000);
            } catch (error) {
                setTemporaryDebugMessage(`Reconnection failed: ${error.message}`);
                console.error('Reconnection error:', error);
            }
        }, Math.pow(2, reconnectAttempts) * 1000);
    }, [reconnectAttempts, token, checkConnection, router, setTemporaryDebugMessage]);

    const setupEchoListeners = useCallback(() => {
        if (!echo.current) return;

        echo.current.connector.pusher.connection.bind('connected', () => {
            setIsConnected(true);
            setReconnectAttempts(0);
            setTemporaryDebugMessage("Reverb WebSocket connected successfully");
            console.log('✅ Reverb: Connected');
        });

        echo.current.connector.pusher.connection.bind('disconnected', () => {
            setIsConnected(false);
            console.log('🔌 Reverb: Disconnected');
            attemptReconnect();
        });

        echo.current.connector.pusher.connection.bind('error', (error) => {
            setIsConnected(false);
            setTemporaryDebugMessage(`Reverb error: ${error?.error?.data?.message || error.message}`);
            console.error('❌ Reverb error:', error);
            attemptReconnect();
        });

        echo.current.join('presence-chat')
            .here((users) => {
                const userStatuses = {};
                users.forEach(user => {
                    userStatuses[user.id] = { online: true, lastSeen: new Date() };
                });
                setLastSeen(prev => ({ ...prev, ...userStatuses }));
            })
            .joining((user) => {
                setLastSeen(prev => ({
                    ...prev,
                    [user.id]: { online: true, lastSeen: new Date() }
                }));
            })
            .leaving((user) => {
                setLastSeen(prev => ({
                    ...prev,
                    [user.id]: { online: false, lastSeen: new Date() }
                }));
            });
    }, [attemptReconnect, setTemporaryDebugMessage]);

    const handleTyping = useCallback(
        debounce(() => {
            if (!selectedUser || !channel.current) return;
            if (!isTyping) {
                setIsTyping(true);
                channel.current.whisper('typing', {
                    userId: currentUserId,
                    typing: true
                });
            }
            clearTimeout(typingTimeoutRef.current);
            typingTimeoutRef.current = setTimeout(() => {
                setIsTyping(false);
                if (channel.current) {
                    channel.current.whisper('typing', {
                        userId: currentUserId,
                        typing: false
                    });
                }
            }, 2000);
        }, 300),
        [selectedUser, currentUserId, isTyping]
    );

    const updateMessageStatus = useCallback((messageId, status, userId = null) => {
        setMessageStatuses(prev => ({
            ...prev,
            [messageId]: {
                ...prev[messageId],
                status,
                ...(userId && { userId }),
                timestamp: new Date()
            }
        }));
    }, []);

    const getUserName = useCallback((userId) => {
        const user = users.find(u => Number(u.id) === Number(userId));
        return user ? user.name : `User ${userId}`;
    }, [users]);

    useEffect(() => {
        const interceptor = axios.interceptors.response.use(
            response => response,
            error => {
                if (error.response?.status === 401) {
                    localStorage.removeItem("token");
                    router.push("/login");
                }
                return Promise.reject(error);
            }
        );

        const savedToken = localStorage?.getItem?.("token");
        if (!savedToken) {
            router.push("/login");
        } else {
            setToken(savedToken);
            axios.get("http://localhost:8000/api/user", {
                headers: { Authorization: `Bearer ${savedToken}` },
            })
                .then((res) => {
                    setCurrentUserId(Number(res.data.id));
                    console.log('Set currentUserId:', res.data.id);
                })
                .catch((error) => {
                    console.error('Token validation failed:', error.response?.data || error.message);
                    setTemporaryDebugMessage(`Token validation failed: ${error.response?.data?.message || error.message}`);
                    localStorage.removeItem("token");
                    router.push("/login");
                });
        }

        return () => axios.interceptors.response.eject(interceptor);
    }, [router, setTemporaryDebugMessage]);

    useEffect(() => {
        if (!token) return;

        if (!echo.current) {
            try {
                echo.current = createEcho(token);
                setupEchoListeners();
                heartbeatRef.current = setInterval(checkConnection, 10000);
            } catch (error) {
                console.error('Failed to initialize Reverb:', error);
                setTemporaryDebugMessage(`Failed to initialize Reverb: ${error.message}`);
                attemptReconnect();
            }
        }

        return () => {
            disconnectEcho();
            if (heartbeatRef.current) {
                clearInterval(heartbeatRef.current);
            }
            if (reconnectTimeoutRef.current) {
                clearTimeout(reconnectTimeoutRef.current);
            }
        };
    }, [token, setupEchoListeners, checkConnection, attemptReconnect, setTemporaryDebugMessage]);

    useEffect(() => {
        if (!token) return;

        const fetchUsers = async () => {
            setLoadingUsers(true);
            try {
                const [usersRes, unreadRes] = await Promise.all([
                    axios.get("http://localhost:8000/api/users", {
                        headers: { Authorization: `Bearer ${token}` },
                    }),
                    axios.get("http://localhost:8000/api/chat/unread-counts", {
                        headers: { Authorization: `Bearer ${token}` },
                    }).catch(() => ({ data: {} }))
                ]);

                setUsers(usersRes.data);
                setUnreadCounts(unreadRes.data || {});
            } catch (error) {
                console.error('Failed to fetch users:', error.response?.data || error.message);
                setTemporaryDebugMessage(`Failed to fetch users: ${error.response?.data?.message || error.message}`);
                localStorage.removeItem("token");
                router.push("/login");
            } finally {
                setLoadingUsers(false);
            }
        };

        fetchUsers();
    }, [token, router, setTemporaryDebugMessage]);

    useEffect(() => {
        if (!token || !selectedUser || !currentUserId || !echo.current) return;

        setLoadingMessages(true);
        setMessages([]);
        setTypingUsers(new Set());

        if (channel.current) {
            echo.current.leave(channel.current.name);
            channel.current = null;
        }

        const channelName = `chat.${Math.min(currentUserId, selectedUser.id)}.${Math.max(currentUserId, selectedUser.id)}`;
        console.log('Subscribing to Reverb channel:', channelName, {
            currentUserId,
            selectedUserId: selectedUser.id,
            time: new Date().toISOString()
        });

        channel.current = echo.current
            .private(channelName)
            .error((error) => {
                console.error('Reverb channel subscription error:', error);
                setTemporaryDebugMessage(`Reverb channel subscription error: ${error.message}`);
            })
            .subscribed(() => {
                console.log('Successfully subscribed to channel:', channelName);
                setTemporaryDebugMessage(`Subscribed to channel: ${channelName}`);
            });

        channel.current.listen("MessageSent", (e) => {
    console.log('Received MessageSent event:', JSON.stringify(e, null, 2));
    const newMessage = e.message || e;
    if (!newMessage?.message || !newMessage?.sender_id || !newMessage?.receiver_id) {
        console.warn('Invalid message format:', JSON.stringify(newMessage, null, 2));
        setTemporaryDebugMessage(`Invalid message format received`);
        return;
    }

    
    setMessages((prev) => {
        let replaced = false;

        const updatedMessages = prev.map(msg => {
            const isOptimisticMatch =
                msg.status === 'sending' &&
                msg.message === newMessage.message &&
                Number(msg.sender_id) === Number(newMessage.sender_id) &&
                Number(msg.receiver_id) === Number(newMessage.receiver_id);

            if (isOptimisticMatch && !replaced) {
                replaced = true;
                return {
                    ...newMessage,
                    id: newMessage.id,
                    sender_id: Number(newMessage.sender_id),
                    receiver_id: Number(newMessage.receiver_id),
                    created_at: newMessage.created_at || new Date().toISOString(),
                    status: 'sent',
                    sender: newMessage.sender || msg.sender,
                    receiver: newMessage.receiver || msg.receiver,
                };
            }

            return msg;
        });

        if (!replaced) {
            updatedMessages.push({
                id: newMessage.id,
                message: newMessage.message,
                sender_id: Number(newMessage.sender_id),
                receiver_id: Number(newMessage.receiver_id),
                created_at: newMessage.created_at || new Date().toISOString(),
                status: Number(newMessage.sender_id) === Number(currentUserId) ? 'sent' : 'delivered',
                sender: newMessage.sender || { id: newMessage.sender_id, name: getUserName(newMessage.sender_id) },
                receiver: newMessage.receiver || { id: newMessage.receiver_id, name: getUserName(newMessage.receiver_id) }
            });
        }

        return updatedMessages;
    });

    updateMessageStatus(
        newMessage.id,
        Number(newMessage.sender_id) === Number(currentUserId) ? 'sent' : 'delivered'
    );

    if (Number(newMessage.sender_id) !== Number(currentUserId)) {
        setTimeout(() => {
            axios
                .post(
                    `http://localhost:8000/api/chat/mark-messages-read`,
                    { message_ids: [newMessage.id] },
                    { headers: { Authorization: `Bearer ${token}` } }
                )
                .then(() => {
                    updateMessageStatus(newMessage.id, 'read');
                    setUnreadCounts((prev) => ({
                        ...prev,
                        [newMessage.sender_id]: Math.max((prev[newMessage.sender_id] || 0) - 1, 0),
                    }));
                })
                .catch((error) => {
                    console.error('Failed to mark message as read:', error.response?.data || error.message);
                    setTemporaryDebugMessage(
                        `Failed to mark message as read: ${error.response?.data?.message || error.message}`
                    );
                });
        }, 1000);
    }
});


        channel.current.listenForWhisper('typing', (e) => {
            console.log('Received typing whisper:', e);
            if (e.userId !== currentUserId) {
                setTypingUsers(prev => {
                    const newSet = new Set(prev);
                    if (e.typing) {
                        newSet.add(e.userId);
                    } else {
                        newSet.delete(e.userId);
                    }
                    return newSet;
                });

                setTimeout(() => {
                    setTypingUsers(prev => {
                        const newSet = new Set(prev);
                        newSet.delete(e.userId);
                        return newSet;
                    });
                }, 3000);
            }
        });

        axios.get(`http://localhost:8000/api/chat/messages/private/${selectedUser.id}`, {
            headers: { Authorization: `Bearer ${token}` },
        })
            .then((res) => {
                console.log('Messages loaded:', JSON.stringify(res.data, null, 2));
                const msgs = Array.isArray(res.data) ? res.data : (res.data.messages || res.data.data || []);
                setMessages(msgs.map(msg => ({
                    ...msg,
                    sender_id: Number(msg.sender_id),
                    receiver_id: Number(msg.receiver_id),
                    sender: msg.sender || { id: Number(msg.sender_id), name: getUserName(msg.sender_id) },
                    receiver: msg.receiver || { id: Number(msg.receiver_id), name: getUserName(msg.receiver_id) },
                    status: msg.read_at ? 'read' : 'delivered'
                })));
                setLoadingMessages(false);

                const unreadMessages = msgs.filter(msg => 
                    Number(msg.sender_id) !== Number(currentUserId) && !msg.read_at
                );
                
                if (unreadMessages.length > 0) {
                    const messageIds = unreadMessages.map(msg => msg.id);
                    axios.post(`http://localhost:8000/api/chat/mark-messages-read`, { message_ids: messageIds }, {
                        headers: { Authorization: `Bearer ${token}` }
                    })
                        .then(() => {
                            setUnreadCounts(prev => {
                                const newCounts = { ...prev };
                                unreadMessages.forEach(msg => {
                                    newCounts[msg.sender_id] = Math.max((newCounts[msg.sender_id] || 0) - 1, 0);
                                    if (newCounts[msg.sender_id] <= 0) delete newCounts[msg.sender_id];
                                });
                                return newCounts;
                            });
                            unreadMessages.forEach(msg => updateMessageStatus(msg.id, 'read'));
                        })
                        .catch(error => {
                            console.error('Failed to mark messages as read:', error.response?.data || error.message);
                            setTemporaryDebugMessage(`Failed to mark messages as read: ${error.response?.data?.message || error.message}`);
                        });
                }
            })
            .catch((error) => {
                console.error('Failed to load messages:', error.response?.data || error.message);
                setTemporaryDebugMessage(`Failed to load messages: ${error.response?.data?.message || error.message}`);
                setMessages([]);
                setLoadingMessages(false);
            });

        return () => {
            if (channel.current) {
                console.log('Leaving Reverb channel:', channel.current.name);
                echo.current.leave(channel.current.name);
                channel.current = null;
            }
        };
    }, [token, selectedUser, currentUserId, updateMessageStatus, setTemporaryDebugMessage, getUserName]);

    useEffect(() => {
        if (messagesEndRef.current) {
            messagesEndRef.current.scrollIntoView({ behavior: "smooth" });
        }
    }, [messages]);

    const sendMessage = async () => {
        if (!input.trim() || !selectedUser || !isConnected) return;

        const tempId = uuidv4();
        const tempMessage = {
            id: tempId,
            message: input,
            sender_id: Number(currentUserId),
            receiver_id: Number(selectedUser.id),
            created_at: new Date().toISOString(),
            status: 'sending',
            sender: { id: Number(currentUserId), name: getUserName(currentUserId) },
            receiver: { id: Number(selectedUser.id), name: selectedUser.name }
        };

        setMessages(prev => {
            console.log('Adding temporary message:', tempMessage);
            return [...prev, tempMessage];
        });
        const messageText = input;
        setInput("");

        try {
            const response = await axios.post(
                "http://localhost:8000/api/chat/message",
                {
                    message: messageText,
                    receiver_id: selectedUser.id,
                },
                {
                    headers: { Authorization: `Bearer ${token}` },
                }
            );

            const serverMessage = response.data.data;
            setMessages(prev => {
                const updatedMessages = prev.map(msg => 
                    msg.id === tempId 
                        ? { 
                            ...serverMessage, 
                            id: serverMessage.id,
                            sender_id: Number(serverMessage.sender_id),
                            receiver_id: Number(serverMessage.receiver_id),
                            status: 'sent', 
                            sender: serverMessage.sender || { id: Number(serverMessage.sender_id), name: getUserName(serverMessage.sender_id) },
                            receiver: serverMessage.receiver || { id: Number(serverMessage.receiver_id), name: getUserName(serverMessage.receiver_id) }
                        }
                        : msg
                );
                console.log('Updated messages after sending:', JSON.stringify(updatedMessages, null, 2));
                return [...updatedMessages];
            });

            updateMessageStatus(serverMessage.id, 'sent');
        } catch (err) {
            setMessages(prev => {
                const updatedMessages = prev.map(msg => 
                    msg.id === tempId 
                        ? { ...msg, status: 'failed' }
                        : msg
                );
                console.log('Updated messages after send failure:', JSON.stringify(updatedMessages, null, 2));
                return [...updatedMessages];
            });
            console.error('Failed to send message:', err.response?.data || err.message);
            setTemporaryDebugMessage(`Failed to send message: ${err.response?.data?.message || err.message}`);
            alert("Failed to send message");
        }
    };

    const logout = () => {
        disconnectEcho();
        localStorage.removeItem("token");
        document.cookie = 'auth-token=; path=/; expires=Thu, 01 Jan 1970 00:00:01 GMT';
        setToken(null);
        router.push("/login");
    };

    const formatTime = (timestamp) => {
        if (!timestamp) return '';
        const date = new Date(timestamp);
        if (isNaN(date.getTime())) return '';
        
        return date.toLocaleTimeString("en-US", {
            hour: "numeric",
            minute: "2-digit",
            hour12: true,
        });
    };

    const getMessageStatusIcon = (message) => {
        const status = messageStatuses[message.id]?.status || message.status;
        
        switch (status) {
            case 'sending':
                return <div className="w-4 h-4 border-2 border-blue-300 border-t-transparent rounded-full animate-spin" />;
            case 'sent':
                return <Check className="w-4 h-4 text-blue-200" />;
            case 'delivered':
                return <CheckCircle className="w-4 h-4 text-blue-200" />;
            case 'read':
                return <CheckCircle className="w-4 h-4 text-green-400" />;
            case 'failed':
                return <span className="text-red-400 text-xs">!</span>;
            default:
                return null;
        }
    };

    const isUserOnline = (userId) => {
        return lastSeen[userId]?.online || false;
    };

const getUserLastSeen = (userId) => {
    const userLastSeen = lastSeen[userId];

    if (!userLastSeen) return "Offline";

    // If the user is marked online
    if (userLastSeen.online) return "Online";

    // If the user is offline
    return "Offline";
};


    return (
        
        <div className="flex h-screen bg-gray-50">
            {!isConnected && (
                <div className="fixed top-0 left-0 right-0 bg-red-500 text-white px-4 py-2 text-sm text-center z-50">
                    <div className="flex items-center justify-center space-x-2">
                        <WifiOff className="w-4 h-4" />
                        <span>
                            {reconnectAttempts > 0 
                                ? `Reconnecting to Reverb... (${reconnectAttempts}/5)`
                                : "Reverb connection lost. Check settings or refresh."
                            }
                        </span>
                    </div>
                </div>
            )}

            {debugMessage && (
                <div className="fixed top-4 right-4 bg-gray-800 text-white p-4 rounded shadow-lg z-50 flex items-center space-x-2">
                    <span>{debugMessage}</span>
                    <button
                        onClick={() => setDebugMessage("")}
                        className="text-white hover:text-gray-300"
                        aria-label="Close debug message"
                    >
                        ✕
                    </button>
                </div>
            )}

            <div className="w-80 bg-white border-r border-gray-200 flex flex-col">
                <div className={`p-4 border-b border-gray-200 bg-gradient-to-r from-blue-600 to-purple-600 ${!isConnected ? 'mt-10' : ''}`}>
                    <div className="flex items-center justify-between">
                        <div className="flex items-center space-x-3">
                            <div className="w-10 h-10 bg-white/20 rounded-full flex items-center justify-center relative">
                                <MessageCircle className="w-6 h-6 text-white" />
                                {isConnected ? (
                                    <Wifi className="w-3 h-3 text-green-400 absolute -bottom-1-t" />
                                ) : (
                                    <WifiOff className="w-3 h-3 text-red-400 absolute -bottom-1-t" />
                                )}
                            </div>
                            <div>
                                <h1 className="text-xl font-bold text-white">ChatApp</h1>
                                <p className="text-blue-100 text-sm">
                                    {isConnected ? "Connected to Reverb" : "Offline"}
                                </p>
                            </div>
                        </div>
                        <button
                            onClick={logout}
                            className="p-2 text-white/80 hover:text-white hover:bg-white/10 rounded-lg transition-colors"
                            title="Logout"
                            aria-label="Log out"
                        >
                            <LogOut className="w-5 h-5" />
                        </button>
                    </div>
                    <button
                        onClick={testAuth}
                        className="mt-2 w-full py-1 bg-white/20 text-white rounded hover:bg-white/30"
                        aria-label="Test authentication"
                    >
                        Test Authentication
                    </button>
                </div>

                <div className="flex-1 overflow-y-auto">
                    {loadingUsers ? (
                        <div className="flex items-center justify-center h-full">
                            <div className="text-center">
                                <div className="w-8 h-8 border-4 border-blue-300 border-t-transparent rounded-full animate-spin mx-auto mb-4" />
                                <p className="text-gray-500">Loading contacts...</p>
                            </div>
                        </div>
                    ) : (
                        <div className="p-4">
                            <div className="flex items-center space-x-2 mb-4">
                                <Users className="w-5 h-5 text-gray-600" />
                                <h3 className="font-semibold text-gray-800">Contacts</h3>
                                <span className="bg-blue-600 text-white text-xs px-2 py-1 rounded-full">
                                    {users.length}
                                </span>
                            </div>

                            <div className="space-y-2" role="listbox" aria-label="Contacts list">
                                {users.map((user) => (
                                    <button
                                        key={user.id}
                                        onClick={() => {
                                            if (currentUserId) {
                                                setSelectedUser(user);
                                            }
                                        }}
                                        className={`w-full p-3 rounded-xl text-left hover:bg-gray-50 transition-all duration-200 relative ${
                                            selectedUser?.id === user.id
                                                ? "bg-gradient-to-r from-blue-50 to-purple-50 border-2 border-blue-200 shadow-sm"
                                                : "border-2 border-transparent"
                                        }`}
                                        aria-label={`Chat with ${user.name}`}
                                        role="option"
                                        aria-selected={selectedUser?.id === user.id}
                                    >
                                        <div className="flex items-center space-x-3">
                                            <div className="relative">
                                                <div className="w-10 h-10 bg-gradient-to-br from-blue-500 to-purple-500 rounded-full flex items-center justify-center">
                                                    <User className="w-5 h-5 text-white" />
                                                </div>
                                                <div className={`absolute -bottom-1 -right-1 w-4 h-4 rounded-full border-2 border-white ${
                                                    isUserOnline(user.id) ? "bg-green-500" : "bg-gray-400"
                                                }`} />
                                            </div>
                                            <div className="flex min-w-0">
                                                <p className="font-medium text-gray-900 truncate">{user.name}</p>
                                            </div>
                                            {unreadCounts[user.id] > 0 && (
                                                <div className="bg-red-500 text-white text-xs rounded-full w-5 h-5 flex items-center justify-center">
                                                    {unreadCounts[user.id] > 9 ? '9+' : unreadCounts[user.id]}
                                                </div>
                                            )}
                                        </div>
                                    </button>
                                ))}
                            </div>
                        </div>
                    )}
                </div>
            </div>

            <div className="flex-1 flex flex-col">
                {selectedUser ? (
                    <>
                        <div className={`p-4 bg-white border-b border-gray-200 shadow-sm ${!isConnected ? 'mt-10' : ''}`}>
                            <div className="flex items-center space-x-4">
                                <div className="relative">
                                    <div className="w-12 h-12 bg-gradient-to-br from-blue-500 to-purple-500 rounded-full flex items-center justify-center">
                                        <User className="w-6 h-6 text-white" />
                                    </div>
                                    <div className={`absolute -bottom-1 -right-1 w-4 h-4 rounded-full border-2 border-white ${
                                        isUserOnline(selectedUser.id) ? "bg-green-500" : "bg-gray-400"
                                    }`} />
                                </div>
                                <div>
                                    <h2 className="text-xl font-semibold text-gray-900">{selectedUser.name}</h2>
                                    <p className={`text-sm ${
                                        isUserOnline(selectedUser.id) ? "text-green-600" : "text-gray-500"
                                    }`}>
                                        {getUserLastSeen(selectedUser.id)}
                                    </p>
                                </div>
                            </div>
                        </div>

                        <div className="flex-1 overflow-y-auto p-4 space-y-4 bg-gradient-to-b from-gray-50 to-white">
                            {console.log('Rendering messages:', JSON.stringify(messages, null, 2))}
                            {loadingMessages ? (
                                <div className="flex items-center justify-center h-full">
                                    <div className="text-center">
                                        <div className="w-8 h-8 border-4 border-blue-300 border-t-transparent rounded-full animate-spin mx-auto mb-4" />
                                        <p className="text-gray-500">Loading messages...</p>
                                    </div>
                                </div>
                            ) : messages.length > 0 ? (
                                <>
                                    {messages
                                        .filter(msg => {
                                            const isMatch = 
                                                (Number(msg.sender_id) === Number(currentUserId) && Number(msg.receiver_id) === Number(selectedUser.id)) ||
                                                (Number(msg.sender_id) === Number(selectedUser.id) && Number(msg.receiver_id) === Number(currentUserId));
                                            if (!isMatch) {
                                                console.log('Filtered out message:', msg);
                                            }
                                            return isMatch;
                                        })
                                        .map((msg, index, filteredMessages) => {
                                            const isOwnMessage = Number(msg.sender_id) === Number(currentUserId);
                                            const showAvatar = index === 0 || Number(filteredMessages[index - 1]?.sender_id) !== Number(msg.sender_id);
                                            const isLastInGroup = index === filteredMessages.length - 1 || Number(filteredMessages[index + 1]?.sender_id) !== Number(msg.sender_id);
                                            
                                            return (
                                                <div
                                                    key={msg.id || index}
                                                    className={`flex items-end space-x-2 ${
                                                        isOwnMessage ? "justify-end" : "justify-start"
                                                    }`}
                                                >
                                                    {!isOwnMessage && (
                                                        <div className="w-8 h-8 flex-shrink-0">
                                                            {showAvatar ? (
                                                                <div className="w-8 h-8 bg-gradient-to-br from-blue-500 to-purple-500 rounded-full flex items-center justify-center">
                                                                    <User className="w-4 h-4 text-white" />
                                                                </div>
                                                            ) : (
                                                                <div className="w-8 h-8" />
                                                            )}
                                                        </div>
                                                    )}
                                                    <div
                                                        className={`max-w-xs lg:max-w-md px-4 py-2 rounded-2xl ${
                                                            isOwnMessage
                                                                ? `bg-gradient-to-r from-blue-500 to-purple-500 text-white ${
                                                                      isLastInGroup ? "rounded-br-md" : ""
                                                                  }`
                                                                : `bg-white border border-gray-200 text-gray-800 ${
                                                                      isLastInGroup ? "rounded-bl-md" : ""
                                                                  }`
                                                        }`}
                                                    >
                                                        <p className="text-sm leading-relaxed break-words">
                                                            {msg.message || msg.content || ''}
                                                        </p>
                                                        {isLastInGroup && (
                                                            <div className={`flex items-center justify-between mt-1 ${
                                                                isOwnMessage ? "text-blue-100" : "text-gray-500"
                                                            }`}>
                                                                <p className="text-xs">
                                                                    {formatTime(msg.created_at || msg.timestamp)}
                                                                </p>
                                                                {isOwnMessage && (
                                                                    <div className="ml-2">
                                                                        {getMessageStatusIcon(msg)}
                                                                    </div>
                                                                )}
                                                            </div>
                                                        )}
                                                    </div>
                                                    {isOwnMessage && (
                                                        <div className="w-8 h-8 flex-shrink-0">
                                                            {showAvatar ? (
                                                                <div className="w-8 h-8 bg-gradient-to-br from-green-500 to-blue-500 rounded-full flex items-center justify-center">
                                                                    <User className="w-4 h-4 text-white" />
                                                                </div>
                                                            ) : (
                                                                <div className="w-8 h-8"></div>
                                                            )}
                                                        </div>
                                                    )}
                                                </div>
                                            );
                                        })}
                                </>
                            ) : (
                                <div className="flex items-center justify-center h-full">
                                    <div className="text-center">
                                        <MessageCircle className="w-16 h-16 text-gray-300 mx-auto mb-4" />
                                        <p className="text-gray-500 text-lg">No messages yet</p>
                                        <p className="text-gray-400">
                                            Start the conversation with {selectedUser.name}!
                                        </p>
                                    </div>
                                </div>
                            )}

                            {typingUsers.size > 0 && (
                                <div className="flex items-center space-x-2">
                                    <div className="w-8 h-8 bg-gradient-to-br from-blue-500 to-purple-500 rounded-full flex items-center justify-center">
                                        <User className="w-4 h-4 text-white"></User>
                                    </div>
                                    <div className="bg-gray-200 rounded-2xl px-4 py-2">
                                        <div className="flex space-x-1">
                                            <div className="w-2 h-2 bg-gray-500 rounded-full animate-bounce" style={{ animationDelay: '0ms' }}></div>
                                            <div className="w-2 h-2 bg-gray-500 rounded-full animate-bounce" style={{ animationDelay: '150ms' }}></div>
                                            <div className="w-2 h-2 bg-gray-500 rounded-full animate-bounce" style={{ animationDelay: '300ms' }}></div>
                                        </div>
                                    </div>
                                </div>
                            )}

                            <div ref={messagesEndRef}></div>
                        </div>

                        <div className="p-4 bg-white border-t border-gray-200">
                            <div className="flex items-center space-x-3">
                                <div className="flex-1 relative">
                                    <input
                                        type="text"
                                        placeholder={`Message ${selectedUser.name}...`}
                                        value={input}
                                        onChange={(e) => {
                                            setInput(e.target.value);
                                            handleTyping();
                                        }}
                                        onKeyDown={(e) => e.key === "Enter" && sendMessage()}
                                        className="w-full px-4 py-3 pr-12 bg-gray-50 border border-gray-200 rounded-full focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent transition-all"
                                        disabled={!isConnected}
                                        aria-label={`Message input for chatting with ${selectedUser.name}`}
                                    />
                                    {!isConnected && (
                                        <div className="absolute right-4 top-1/2 transform -translate-y-1/2">
                                            <WifiOff className="w-5 h-5 text-gray-400" />
                                        </div>
                                    )}
                                </div>
                                <button
                                    onClick={sendMessage}
                                    disabled={!input.trim() || !isConnected}
                                    className="p-3 bg-gradient-to-r from-blue-500 to-purple-500 text-white rounded-full hover:from-blue-600 hover:to-purple-600 disabled:opacity-50 disabled:cursor-not-allowed transition-all duration-200 shadow-lg hover:shadow-xl"
                                    aria-label="Send message"
                                >
                                    <Send className="w-5 h-5" />
                                </button>
                            </div>
                            
                            {!isConnected && (
                                <div className="mt-2 text-center">
                                    <p className="text-xs text-red-500 flex items-center justify-center space-x-1">
                                        <WifiOff className="w-3 h-3" />
                                        <span>Messages will be sent when Reverb connection is restored</span>
                                    </p>
                                </div>
                            )}
                        </div>
                    </>
                ) : (
                    <div className={`flex-1 flex items-center justify-center bg-gradient-to-br from-gray-50 to-white ${!isConnected ? 'mt-10' : ''}`}>
                        <div className="text-center">
                            <div className="w-24 h-24 bg-gradient-to-br from-blue-100 to-purple-100 rounded-full flex items-center justify-center mx-auto mb-6">
                                <MessageCircle className="w-12 h-12 text-blue-500" />
                            </div>
                            <h3 className="text-2xl font-semibold text-gray-800 mb-2">
                                Welcome to ChatApp
                            </h3>
                            <p className="text-gray-600 mb-6">
                                Select a contact to start messaging
                            </p>
                            <div className="text-sm text-gray-500">
                                Choose someone from your contacts list to begin a conversation
                            </div>
                        </div>
                    </div>
                )}
            </div>
        </div>
    );
}