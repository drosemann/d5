import { create } from 'zustand';
import axios from 'axios';

const useWorkspaceStore = create((set, get) => ({
  workspaces: [],
  currentWorkspace: null,
  channels: [],
  currentChannel: null,
  
  fetchWorkspaces: async () => {
    try {
      const response = await axios.get('/api/workspaces');
      set({ workspaces: response.data });
    } catch (error) {
      console.error('Failed to fetch workspaces:', error);
    }
  },
  
  setCurrentWorkspace: (workspace) => {
    set({ currentWorkspace: workspace });
  },
  
  fetchChannels: async (workspaceId) => {
    try {
      const response = await axios.get(`/api/channels/workspace/${workspaceId}`);
      set({ channels: response.data });
    } catch (error) {
      console.error('Failed to fetch channels:', error);
    }
  },
  
  setCurrentChannel: (channel) => {
    set({ currentChannel: channel });
  },
  
  createWorkspace: async (name, description) => {
    try {
      const response = await axios.post('/api/workspaces', { name, description });
      const workspaces = get().workspaces;
      set({ workspaces: [...workspaces, response.data] });
      return true;
    } catch (error) {
      console.error('Failed to create workspace:', error);
      return false;
    }
  },
  
  createChannel: async (name, description, workspaceId, isPrivate = false) => {
    try {
      const response = await axios.post('/api/channels', {
        name,
        description,
        workspaceId,
        isPrivate
      });
      const channels = get().channels;
      set({ channels: [...channels, response.data] });
      return true;
    } catch (error) {
      console.error('Failed to create channel:', error);
      return false;
    }
  },
}));
