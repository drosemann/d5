
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
        className="chat-input pr-12"
      />
      <button 
        type="submit" 
        className="absolute right-3 top-1/2 transform -translate-y-1/2 w-8 h-8 flex items-center justify-center bg-purple-600 rounded-full text-white hover:bg-purple-700"
      >
        <Send size={16} />
      </button>
    </form>
  );
};

export default MessageInput;
