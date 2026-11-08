// Simple local chat app with username, timestamps, and localStorage
const chatBox = document.getElementById('chat-box');
const chatForm = document.getElementById('chat-form');
const messageInput = document.getElementById('message');
const usernameInput = document.getElementById('username');

function getUsername() {
    return usernameInput.value.trim() || 'Anonymous';
}

function addMessage(msg, user, time) {
    const msgDiv = document.createElement('div');
    msgDiv.className = 'message';
    msgDiv.innerHTML = `<div class="meta">${user} @ ${time}</div>${msg}`;
    chatBox.appendChild(msgDiv);
    chatBox.scrollTop = chatBox.scrollHeight;
}

function saveMessage(msg, user, time) {
    const messages = JSON.parse(localStorage.getItem('chat-messages') || '[]');
    messages.push({ msg, user, time });
    localStorage.setItem('chat-messages', JSON.stringify(messages));
}

function loadMessages() {
    chatBox.innerHTML = '';
    const messages = JSON.parse(localStorage.getItem('chat-messages') || '[]');
    messages.forEach(({ msg, user, time }) => addMessage(msg, user, time));
}

chatForm.addEventListener('submit', e => {
    e.preventDefault();
    const msg = messageInput.value.trim();
    if (!msg) return;
    const user = getUsername();
    const time = new Date().toLocaleTimeString();
    addMessage(msg, user, time);
    saveMessage(msg, user, time);
    messageInput.value = '';
});

usernameInput.addEventListener('change', () => {
    localStorage.setItem('chat-username', usernameInput.value.trim());
});

window.addEventListener('DOMContentLoaded', () => {
    usernameInput.value = localStorage.getItem('chat-username') || '';
    loadMessages();
});

// Extra feature: Clear chat
const clearBtn = document.createElement('button');
clearBtn.textContent = 'Clear Chat';
clearBtn.style.margin = '10px auto';
clearBtn.onclick = () => {
    localStorage.removeItem('chat-messages');
    loadMessages();
};
document.querySelector('.chat-container').appendChild(clearBtn);
