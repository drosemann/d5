
import React from 'react';

interface PromptSuggestionProps {
  text: string;
  onClick: (prompt: string) => void;
}

const PromptSuggestion: React.FC<PromptSuggestionProps> = ({ text, onClick }) => {
  return (
    <button 
      className="py-2 px-4 border border-dark-50/20 bg-dark-300 rounded-full text-sm text-gray-300 hover:bg-dark-200 transition-colors"
      onClick={() => onClick(text)}
    >
      {text}
    </button>
  );
};

export default PromptSuggestion;
