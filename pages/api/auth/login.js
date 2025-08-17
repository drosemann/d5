let users = {};

export default function handler(req, res) {
  if (req.method === 'POST') {
    const { username, password } = req.body;
    if (!users[username] || users[username].password !== password) {
      res.status(401).json({ error: 'Invalid credentials' });
      return;
    }
    res.setHeader('Set-Cookie', `user=${encodeURIComponent(username)}; HttpOnly; Path=/`);
    res.status(200).json({ success: true });
  } else {
    res.status(405).json({ error: 'Method not allowed' });
  }
}
