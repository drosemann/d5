
import React from 'react';
import Header from '@/components/Header';
import Chat from '@/components/Chat';

const Index: React.FC = () => {
  return (
    <div className="min-h-screen bg-dark">
      <Header />
      <Chat />
    </div>
  );
};

export default Index;
