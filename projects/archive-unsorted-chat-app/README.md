# ClearCall VoIP Service

ClearCall is a Voice over IP (VoIP) service that provides secure and high-quality voice and video calls over the internet. This guide will help you set up ClearCall on a Debian 12 system using a screen session.

## Security & Encryption

### What We Encrypt
- User passwords are hashed and salted using bcrypt before being stored in the database.
- Authentication tokens (JWT) are signed and never stored in plain text.
- All communication between client and server should be run over HTTPS in production (not included by default).

### What We Do Not Encrypt
- Messages, files, and channel data are stored in the database in plain text.
- Voice/video call signaling is not end-to-end encrypted.
- File uploads are not encrypted at rest.

If you require end-to-end encryption for messages or calls, you must implement it yourself or use a third-party solution.

## Liability Disclaimer

**We are not responsible for any data loss, security breaches, or misuse of this software.**

This project is provided as-is, without any warranty. Use at your own risk. You are responsible for securing your deployment, including using HTTPS, setting strong passwords, and keeping dependencies up to date.

## Prerequisites

- Debian 12 system
- Node.js and npm installed
- Git installed
- Screen utility installed
- MariaDB server

## How to Run on Debian 12 (with MariaDB)

### 1. Install Dependencies

```bash
sudo apt update && sudo apt upgrade -y
sudo apt install nodejs npm mariadb-server git -y
```

### 2. Start and Secure MariaDB

```bash
sudo systemctl start mariadb
sudo mysql_secure_installation
```

### 3. Create Database and User

```bash
sudo mysql -u root -p

-- In the MariaDB shell:
CREATE DATABASE chatapp_db;
CREATE USER 'chatapp_user'@'localhost' IDENTIFIED BY 'your_password';
GRANT ALL PRIVILEGES ON chatapp_db.* TO 'chatapp_user'@'localhost';
FLUSH PRIVILEGES;
EXIT;
```

### 4. Import Database Schema

```bash
mysql -u chatapp_user -p chatapp_db < server/config/database.sql
```

### 5. Configure Environment Variables

Create a `.env` file in the `server/` directory:

```
PORT=3000
DB_HOST=localhost
DB_USER=chatapp_user
DB_PASSWORD=your_password
DB_NAME=chatapp_db
JWT_SECRET=your_jwt_secret
CLIENT_URL=http://localhost:5173
```

### 6. Install Server Dependencies

```bash
cd server
npm install
```

### 7. Start the Server

```bash
node app.js
```

### 8. Start the Client (Optional: Modern React UI)

```bash
cd client
npm install
npm run dev
```

## Installation Steps

### 1. Update System

```bash
sudo apt update && sudo apt upgrade -y
```

### 2. Install Node.js and npm

```bash
sudo apt install nodejs npm -y
```

### 3. Install Git

```bash
sudo apt install git -y
```

### 4. Install Screen

```bash
sudo apt install screen -y
```

### 5. Clone the Repository

Navigate to the directory where you want to clone the project and run:

```bash
git clone <repository-url>
cd ClearCall
```

### 6. Install Server Dependencies

Navigate to the server directory and install dependencies:

```bash
cd server
npm install express socket.io
```

### 7. Start the Server in a Screen Session

Start a screen session and run the server:

```bash
screen -S clearcall-server
node app.js
```

To detach from the screen session, press `Ctrl + A`, then `D`.

To reattach to the screen session later, use:

```bash
screen -r clearcall-server
```

## Accessing the Client

Open the `client/index.html` file in a web browser to start using ClearCall.

## Troubleshooting

- Ensure all dependencies are installed correctly.
- Check if the server is running by visiting `http://localhost:3000`.
- Use `screen -ls` to list active screen sessions.

## License

This project is licensed under the MIT License.

# Features

- Multi-workspace support (like Discord servers)
- Public and private channels
- Direct messaging (DMs)
- Real-time chat with Socket.IO
- User authentication (JWT)
- User presence/online status
- Message reactions and pinning
- File uploads (attachments)
- Channel and workspace invites
- User roles and permissions (owner, admin, member)
- Threaded replies
- Message editing and deletion
- Basic notifications (stub, extendable)
- Message search (to be implemented)
- Voice/video call signaling (WebRTC-ready)
- Modern React UI (Material-UI)
- Emoji support
- Secure password hashing
- MariaDB backend
- Room-based Calling: Join specific rooms for group calls; signaling messages relayed only to users in the same room.
- User List and Presence: Track and broadcast the list of connected users in each room; notify users when someone joins or leaves.
- Text Chat in Calls: Simple chat feature alongside video/audio in call rooms.
- Screen Sharing: Share your screen using getDisplayMedia (UI controls stubbed).
- Mute/Unmute and Camera On/Off: Buttons to mute/unmute audio and enable/disable video; state changes broadcast to others.
- Recording: Record calls locally using the MediaRecorder API (stubbed, extendable).
- Call Authentication: Basic authentication for joining calls (username/password).
- Lobby/Waiting Room: Users wait in a lobby until the host admits them to the call.
- File Sharing in Calls: Send files to each other during a call (stubbed, extendable).
- Call End/Leave Notifications: Notify all users when someone leaves or ends the call.

# Future Features

- Advanced search and filtering for messages and files
- End-to-end encryption for messages and calls
- Push notifications (mobile/desktop)
- Integration with external services (calendar, bots, etc.)
- Custom emoji and sticker packs
- Advanced moderation tools
- Analytics and usage statistics
- Mobile app (React Native or Flutter)
- UI/UX enhancements and accessibility improvements
- AI-powered message summarization and smart replies
- Scheduled messages and reminders
- Customizable notification settings per channel/user
- Integration with cloud storage (Google Drive, Dropbox, etc.)
- In-app voice message recording and playback
- Video backgrounds and virtual backgrounds for calls
- Polls and surveys in chat
- Custom slash commands and chatbots
- Multi-factor authentication (MFA)
- Federated/multi-instance support
- Export/import workspace data
- Granular permission management (per-channel, per-role)