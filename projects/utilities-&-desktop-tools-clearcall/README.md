# ClearCall VoIP Service

ClearCall is a Voice over IP (VoIP) service that provides secure and high-quality voice and video calls over the internet. This guide will help you set up ClearCall on a Debian 12 system using a screen session.

## Prerequisites

- Debian 12 system
- Node.js and npm installed
- Git installed
- Screen utility installed

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
