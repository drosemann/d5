const express = require('express');
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const pool = require('../db');
const router = express.Router();

router.post('/register', async (req, res) => {
  const { email, password } = req.body;
  const hashed = await bcrypt.hash(password, 10);

  try {
    const [rows] = await pool.query('INSERT INTO users (email, password) VALUES (?, ?)', [email, hashed]);
    res.status(201).json({ id: rows.insertId });
  } catch (err) {
    res.status(400).json({ error: 'Email already exists' });
  }
});

router.post('/login', async (req, res) => {
  const { email, password } = req.body;
  const [users] = await pool.query('SELECT * FROM users WHERE email = ?', [email]);

  if (users.length === 0) return res.status(404).json({ error: 'User not found' });

  const valid = await bcrypt.compare(password, users[0].password);
  if (!valid) return res.status(401).json({ error: 'Invalid password' });

  const token = jwt.sign({ id: users[0].id, email }, process.env.JWT_SECRET, { expiresIn: '1d' });
  res.json({ token });
});

module.exports = router;
