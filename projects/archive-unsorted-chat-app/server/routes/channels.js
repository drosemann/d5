const express = require('express');
const router = express.Router();
const db = require('../config/database');
const { v4: uuidv4 } = require('uuid');
const auth = require('../middleware/auth');

// Get all channels in a workspace
router.get('/workspace/:workspaceId', auth, async (req, res) => {
    try {
        const [channels] = await db.execute(
            'SELECT * FROM channels WHERE workspace_id = ?',
            [req.params.workspaceId]
        );
        res.json(channels);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});

// Create new channel
router.post('/', auth, async (req, res) => {
    try {
        const { name, description, workspaceId, isPrivate } = req.body;
        const channelId = uuidv4();
        
        await db.execute(
            'INSERT INTO channels (id, name, description, workspace_id, is_private, created_by) VALUES (?, ?, ?, ?, ?, ?)',
            [channelId, name, description, workspaceId, isPrivate, req.user.id]
        );
        
        res.status(201).json({ message: 'Channel created successfully', channelId });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});

// Get channel details
router.get('/:channelId', auth, async (req, res) => {
    try {
        const [channels] = await db.execute(
            'SELECT * FROM channels WHERE id = ?',
            [req.params.channelId]
        );
        
        if (channels.length === 0) {
            return res.status(404).json({ message: 'Channel not found' });
        }
        
        res.json(channels[0]);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});

module.exports = router;
