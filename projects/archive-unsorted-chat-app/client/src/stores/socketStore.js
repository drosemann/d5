import { create } from 'zustand';
import io from 'socket.io-client';

const useSocketStore = create((set, get) => ({
  socket: null,
  connected: false,
  
  initSocket: (token) => {
    const socket = io('http://localhost:3000', {
      auth: {
        token
      }
    });
    
    socket.on('connect', () => {
      set({ connected: true });
    });
    
    socket.on('disconnect', () => {
      set({ connected: false });
    });
    
    set({ socket });
  },
  
  disconnectSocket: () => {
    const { socket } = get();
    if (socket) {
      socket.disconnect();
      set({ socket: null, connected: false });
    }
  },
  
  joinRoom: (roomId) => {
    const { socket } = get();
    if (socket) {
      socket.emit('join_room', roomId);
    }
  },
  
  leaveRoom: (roomId) => {
    const { socket } = get();
    if (socket) {
      socket.emit('leave_room', roomId);
    }
  },
}));
