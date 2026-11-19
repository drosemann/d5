// Goose-Port-Spiegel von: projects/archive-unsorted-chat-app/server/auth.js
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/archive-unsorted-chat-app/server/auth.js");
}

// ---- Original-Code (projects/archive-unsorted-chat-app/server/auth.js), unveraendert, als Inline-Doku ----
// // server/auth.js
//
// // user clicks button sends registreation/login request to server
// // server checks if user exists in database
// // if user exists, server sends back user data and token
// // if user does not exist, server sends back error message
// const express = require('express');
// const jwt = require('jsonwebtoken');
// const bcrypt = require('bcrypt');
// const router = express.Router();
// const User = require('./models/User'); // Assuming you have a User model defined
//
// // Registration endpoint
// router.post('/register', async (req, res) => {
//     const { username, password } = req.body;
//
//     // request database to check if username and password are provided
//     if (!username || !password) {
//         return res.status(400).json({ message: 'Username and password are required' });
//     }
//     // Validate username and password
//     const usernameRegex = /^[a-zA-Z0-9_]{3,20}$/; // Example regex for username validation
//     const passwordRegex = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,20}$/; // Example regex for password validation
//     if (!usernameRegex.test(username) || !passwordRegex.test(password)) {
//         return res.status(400).json({ message: 'Invalid username or password format' });
//     }
//
//     // Check if user already exists
//     const existingUser = await User.findOne({ username });
//     if (existingUser) {
//         return res.status(400).json({ message: 'User already exists' });
//     }
//
//     // Hash password and create user
//     const hashedPassword = await bcrypt.hash(password, 10);
//     const user = new User({ username, password: hashedPassword });
//     await user.save();
//
//     // Create JWT token
//     const token = jwt.sign({ id: user._id }, 'your_jwt_secret');
//     res.status(201).json({ user: { id: user._id, username: user.username }, token });
// });
//
// // Login endpoint
// router.post('/login', async (req, res) => {
//     const { username, password } = req.body;
//
//     // Check if user exists
//     const user = await User.findOne({ username });
//     if (!user) {
//         return res.status(400).json({ message: 'Invalid credentials' });
//     }
//
//     // Check password
//     const isMatch = await bcrypt.compare(password, user.password);
//     if (!isMatch) {
//         return res.status(400).json({ message: 'Invalid credentials' });
//     }
//
//     // Create JWT token
//     const token = jwt.sign({ id: user._id }, 'your_jwt_secret');
//     res.status(200).json({ user: { id: user._id, username: user.username }, token });
// });
//
// module.exports = router;
