
import React, { useState } from 'react';
import { Send } from 'lucide-react';

interface MessageInputProps {
  onSendMessage: (message: string) => void;
}

const MessageInput: React.FC<MessageInputProps> = ({ onSendMessage }) => {
  const [message, setMessage] = useState('');

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    if (message.trim()) {
      onSendMessage(message.trim());
      setMessage('');
    }
  };

  return (
    <form onSubmit={handleSubmit} className="relative">
      <input
        type="text"
        value={message}
        onChange={(e) => setMessage(e.target.value)}
        placeholder="Type a message and press Enter to send..."
        className="chat-input pr-12 shadow-md shadow-dark-900/20 focus:border-purple-500 transition-all duration-300"
      />
      <button 
        type="submit" 
        className="absolute right-3 top-1/2 transform -translate-y-1/2 w-10 h-10 flex items-center justify-center bg-gradient-to-r from-purple-600 to-purple-700 rounded-full text-white hover:from-purple-700 hover:to-purple-800 transition-colors shadow-md shadow-purple-900/20"
      >
        <Send size={18} />
      </button>
    </form>
  );
};

export default MessageInput;
