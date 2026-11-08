let users = {};

export default function handler(req, res) {
  if (req.method === 'POST') {
    const { username, password } = req.body;
    if (users[username]) {
      res.status(400).json({ error: 'User already exists' });
      return;
    }
    users[username] = { password };
    res.setHeader('Set-Cookie', `user=${encodeURIComponent(username)}; HttpOnly; Path=/`);
    res.status(200).json({ success: true });
  } else {
    res.status(405).json({ error: 'Method not allowed' });
  }
}
