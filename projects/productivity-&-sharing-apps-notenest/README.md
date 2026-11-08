# NoteNest

A secure personal note-taking application built with Node.js and MariaDB.

## Features

- Secure note storage with encryption
- RESTful API endpoints
- MariaDB database integration
- NGINX-compatible
- Environment variable configuration

## Prerequisites

1. Node.js installed on your system
2. MariaDB server installed and running
3. Text editor (VS Code recommended)

## Installation

1. Clone this repository
2. Copy `.env.example` to `.env` and update the values:
   ```
   PORT=3000
   DB_HOST=localhost
   DB_USER=your_db_user
   DB_PASSWORD=your_db_password
   DB_NAME=notenest_db
   SECRET_KEY=your_secure_key
   ```

3. Create the MariaDB database and tables:
   ```sql
   CREATE DATABASE notenest_db;
   USE notenest_db;
   
   CREATE TABLE notes (
       id INT PRIMARY KEY AUTO_INCREMENT,
       user_id INT NOT NULL,
       title VARCHAR(255) NOT NULL,
       content TEXT NOT NULL,
       created_at DATETIME NOT NULL,
       updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
   );
   ```

4. Start the server:
   ```
   node src/server.js
   ```

## API Endpoints

### Create a Note
```
POST /api/notes
Headers: Authorization: Bearer your_token
Body: {
    "title": "Note Title",
    "content": "Note Content"
}
```

### Get a Note
```
GET /api/notes/:id
Headers: Authorization: Bearer your_token
```

## Security Features

- All notes are encrypted using AES-256-CBC
- Authentication required for all API endpoints
- Environment variables for sensitive configuration
- CORS headers configured for security

## NGINX Configuration

Example NGINX configuration:

```nginx
server {
    listen 80;
    server_name your_domain.com;

    location / {
        proxy_pass http://localhost:3000;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_cache_bypass $http_upgrade;
    }
}
```