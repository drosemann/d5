
import React from 'react';
import { cn } from '@/lib/utils';

export interface MessageProps {
  content: string;
  role: 'user' | 'assistant';
}

const Message: React.FC<MessageProps> = ({ content, role }) => {
  const isUser = role === 'user';

  return (
    <div className={cn(
      "py-3 px-5 rounded-2xl max-w-[80%] mb-3 shadow-sm",
      isUser 
        ? "bg-gradient-to-r from-purple-600 to-purple-700 text-white ml-auto rounded-tr-sm" 
        : "bg-dark-300/80 text-gray-100 mr-auto rounded-tl-sm border border-white/5"
    )}>
      <p className="text-sm md:text-base leading-relaxed">{content}</p>
    </div>
  );
};

export default Message;
