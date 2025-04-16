const express = require('express');
const auth = require('../middleware/auth');
const pool = require('../db');
const router = express.Router();

router.use(auth);

router.get('/', async (req, res) => {
  const [rows] = await pool.query('SELECT * FROM events WHERE user_id = ?', [req.user.id]);
  res.json(rows);
});

router.post('/', async (req, res) => {
  const { name, date, description } = req.body;
  await pool.query('INSERT INTO events (user_id, name, date, description) VALUES (?, ?, ?, ?)', [
    req.user.id, name, date, description,
  ]);
  res.sendStatus(201);
});

router.delete('/:id', async (req, res) => {
  await pool.query('DELETE FROM events WHERE id = ? AND user_id = ?', [req.params.id, req.user.id]);
  res.sendStatus(204);
});

module.exports = router;
