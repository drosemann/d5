
import React from 'react';
import { Button } from '@/components/ui/button';
import { Moon, Sun } from 'lucide-react';

const Header: React.FC = () => {
  return (
    <header className="fixed top-0 left-0 right-0 flex items-center justify-between py-4 px-6 lg:px-10 bg-dark-400/80 backdrop-blur-md z-10 border-b border-dark-50/10">
      <div className="flex items-center">
        <div className="bg-purple-600 w-6 h-6 rounded-md flex items-center justify-center mr-2">
          <div className="w-3 h-3 bg-white rounded-sm transform rotate-45"></div>
        </div>
        <h1 className="text-xl font-semibold text-white">TalkativeCloud</h1>
      </div>
      
      <div className="flex items-center gap-4">
        <Button variant="outline" size="sm" className="text-white bg-dark-300 border-dark-50/20 hover:bg-dark-200">
          <Moon className="h-4 w-4 mr-2" />
          Dark Mode
        </Button>
        <Button size="sm" className="bg-dark-300 border border-dark-50/20 hover:bg-dark-200">
          <Sun className="h-4 w-4 mr-2" />
          Give us a star
        </Button>
      </div>
    </header>
  );
};

export default Header;
