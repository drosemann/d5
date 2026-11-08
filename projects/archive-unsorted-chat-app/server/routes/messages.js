const express = require('express');
const router = express.Router();
const db = require('../config/database');
const { v4: uuidv4 } = require('uuid');
const auth = require('../middleware/auth');

// Get messages in a channel
router.get('/channel/:channelId', auth, async (req, res) => {
    try {
        const [messages] = await db.execute(
            `SELECT m.*, u.username, u.avatar_url 
             FROM messages m 
             JOIN users u ON m.user_id = u.id 
             WHERE m.channel_id = ? 
             ORDER BY m.created_at DESC 
             LIMIT 50`,
            [req.params.channelId]
        );
        res.json(messages);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});

// Create new message
router.post('/', auth, async (req, res) => {
    try {
        const { content, channelId, parentId } = req.body;
        const messageId = uuidv4();
        
        await db.execute(
            'INSERT INTO messages (id, content, channel_id, user_id, parent_id) VALUES (?, ?, ?, ?, ?)',
            [messageId, content, channelId, req.user.id, parentId]
        );
        
        // Get the created message with user details
        const [messages] = await db.execute(
            `SELECT m.*, u.username, u.avatar_url 
             FROM messages m 
             JOIN users u ON m.user_id = u.id 
             WHERE m.id = ?`,
            [messageId]
        );
        
        res.status(201).json(messages[0]);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});

// Add reaction to message
router.post('/:messageId/reactions', auth, async (req, res) => {
    try {
        const { emoji } = req.body;
        const reactionId = uuidv4();
        
        await db.execute(
            'INSERT INTO reactions (id, message_id, user_id, emoji) VALUES (?, ?, ?, ?)',
            [reactionId, req.params.messageId, req.user.id, emoji]
        );
        
        res.status(201).json({ message: 'Reaction added successfully' });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});

// Pin/unpin message
router.patch('/:messageId/pin', auth, async (req, res) => {
    try {
        const { isPinned } = req.body;
        
        await db.execute(
            'UPDATE messages SET is_pinned = ? WHERE id = ?',
            [isPinned, req.params.messageId]
        );
        
        res.json({ message: `Message ${isPinned ? 'pinned' : 'unpinned'} successfully` });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});

module.exports = router;
