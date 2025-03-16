
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
      "py-2 px-4 rounded-3xl max-w-[80%] mb-2",
      isUser 
        ? "bg-purple-600 text-white ml-auto rounded-tr-none" 
        : "bg-dark-300 text-gray-100 mr-auto rounded-tl-none"
    )}>
      <p className="text-sm md:text-base">{content}</p>
    </div>
  );
};

export default Message;
