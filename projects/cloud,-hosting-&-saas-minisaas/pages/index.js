import { useState } from 'react';
import { useRouter } from 'next/router';

export default function Home() {
  const router = useRouter();
  const [username, setUsername] = useState('');
  const [password, setPassword] = useState('');

  const handleAuth = async (endpoint) => {
    const res = await fetch('/api/auth/' + endpoint, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ username, password })
    });
    if (res.ok) {
      router.push('/dashboard');
    } else {
      alert('Authentication failed');
    }
  };

  return (
    <div style={{ padding: '2rem', fontFamily: 'sans-serif' }}>
      <h1>Welcome to the AI-Native B2B GenAI SaaS</h1>
      <div style={{ marginBottom: '1rem' }}>
        <input
          placeholder="Username"
          value={username}
          onChange={e => setUsername(e.target.value)}
        /><br/>
        <input
          placeholder="Password"
          type="password"
          value={password}
          onChange={e => setPassword(e.target.value)}
        /><br/>
      </div>
      <button onClick={() => handleAuth('signup')}>Sign Up</button>
      <button onClick={() => handleAuth('login')}>Log In</button>
    </div>
  );
}
