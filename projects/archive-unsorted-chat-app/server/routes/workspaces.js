const express = require('express');
const router = express.Router();
const db = require('../config/database');
const { v4: uuidv4 } = require('uuid');
const auth = require('../middleware/auth');

// Get workspaces for user
router.get('/', auth, async (req, res) => {
    try {
        const [workspaces] = await db.execute(
            `SELECT w.* FROM workspaces w 
             JOIN workspace_members wm ON w.id = wm.workspace_id 
             WHERE wm.user_id = ?`,
            [req.user.id]
        );
        res.json(workspaces);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});

// Create new workspace
router.post('/', auth, async (req, res) => {
    try {
        const { name, description } = req.body;
        const workspaceId = uuidv4();
        
        // Create workspace
        await db.execute(
            'INSERT INTO workspaces (id, name, description, owner_id) VALUES (?, ?, ?, ?)',
            [workspaceId, name, description, req.user.id]
        );
        
        // Add creator as owner
        await db.execute(
            'INSERT INTO workspace_members (workspace_id, user_id, role) VALUES (?, ?, ?)',
            [workspaceId, req.user.id, 'owner']
        );
        
        // Create default channels
        const generalChannelId = uuidv4();
        await db.execute(
            'INSERT INTO channels (id, name, description, workspace_id, created_by) VALUES (?, ?, ?, ?, ?)',
            [generalChannelId, 'general', 'General discussion', workspaceId, req.user.id]
        );
        
        res.status(201).json({ message: 'Workspace created successfully', workspaceId });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});

// Add member to workspace
router.post('/:workspaceId/members', auth, async (req, res) => {
    try {
        const { userId, role } = req.body;
        
        await db.execute(
            'INSERT INTO workspace_members (workspace_id, user_id, role) VALUES (?, ?, ?)',
            [req.params.workspaceId, userId, role || 'member']
        );
        
        res.status(201).json({ message: 'Member added successfully' });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});

module.exports = router;
