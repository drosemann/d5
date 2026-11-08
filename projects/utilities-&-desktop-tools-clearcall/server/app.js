// Basic server setup using Express
const express = require('express');
const app = express();
const port = 3000;
const http = require('http');
const socketIo = require('socket.io');

const server = http.createServer(app);
const io = socketIo(server);

// Handle WebRTC signaling
io.on('connection', (socket) => {
  console.log('A user connected');

  socket.on('disconnect', () => {
    console.log('User disconnected');
  });

  socket.on('offer', (offer) => {
    socket.broadcast.emit('offer', offer);
  });

  socket.on('answer', (answer) => {
    socket.broadcast.emit('answer', answer);
  });

  socket.on('candidate', (candidate) => {
    socket.broadcast.emit('candidate', candidate);
  });
});

app.get('/', (req, res) => {
  res.send('Welcome to ClearCall VoIP Service!');
});

server.listen(port, () => {
  console.log(`Server running at http://localhost:${port}`);
});
