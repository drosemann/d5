// npm install socket.io

// file: server/api/media/stub.js
// Mute Button (stub)

// websocket.io server stub for media control
import express from 'express';
import { Server } from 'socket.io';
import rateLimit from 'express-rate-limit';
import cors from 'cors';
import helmet from 'helmet';
import dotenv from 'dotenv';

const io = new Server(server);
const app = express();

app.use(express.json()); // for parsing application/json
app.use(express.urlencoded({ extended: true })); // for parsing application/x-www-form-urlencoded

dotenv.config();
app.use(helmet());
app.use(cors({
    origin: process.env.CORS_ORIGIN,
    methods: ['GET', 'POST'],
    allowedHeaders: ['Content-Type', 'Authorization'],
}));    

export default function (app) {
    const server = app.listen(3000);
    const io = new Server(server);

    // integrate with websockets
    io.on('connection', (socket) => {
        console.log('A user connected');

        socket.on('mute', (data) => {
            console.log('Mute event received:', data);
            // Handle mute event
        });

        socket.on('media', (data) => {
            console.log('Media event received:', data);
            // Handle media event
        });
    });


    // Mute Button (stub)
    app.post('/api/mute', (req, res) => {
        io.emit('mute', { muted: req.body.muted });
        res.json({ message: 'Mute state changed (stub)' });
    });
    // Media server (stub)
    app.post('/api/media', (req, res) => {
        // rewrite with actual media server logic
        res.json({ message: 'Media state changed (stub)' });
    });
}