
import React from 'react';
import Header from '@/components/Header';
import Chat from '@/components/Chat';

const Index: React.FC = () => {
  return (
    <div className="min-h-screen bg-gradient-to-br from-dark-500 to-dark-900">
      <Header />
      <Chat />
    </div>
  );
};

export default Index;
