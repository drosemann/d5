
import React from 'react';

interface PromptSuggestionProps {
  text: string;
  onClick: (prompt: string) => void;
}

const PromptSuggestion: React.FC<PromptSuggestionProps> = ({ text, onClick }) => {
  return (
    <button 
      className="py-2 px-4 border border-purple-500/20 bg-dark-300/80 rounded-full text-sm text-gray-200 hover:bg-dark-200 transition-all duration-300 hover:border-purple-500/40 hover:shadow-md hover:shadow-purple-600/10"
      onClick={() => onClick(text)}
    >
      {text}
    </button>
  );
};

export default PromptSuggestion;
