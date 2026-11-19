// Goose-Port-Spiegel von: projects/ai-&-llm-projects-ai-assistant-html,-css,-javascript,-python-(flask)-for-openai-api/src/static/js/main.js
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/ai-&-llm-projects-ai-assistant-html,-css,-javascript,-python-(flask)-for-openai-api/src/static/js/main.js");
}

// ---- Original-Code (projects/ai-&-llm-projects-ai-assistant-html,-css,-javascript,-python-(flask)-for-openai-api/src/static/js/main.js), unveraendert, als Inline-Doku ----
// class ChatInterface {
//     constructor() {
//         this.chatHistory = document.getElementById('chat-history');
//         this.userInput = document.getElementById('user-input');
//         this.sendButton = document.getElementById('send-button');
//         
//         this.sendButton.addEventListener('click', () => this.sendMessage());
//         this.userInput.addEventListener('keypress', (e) => {
//             if (e.key === 'Enter' && !e.shiftKey) {
//                 e.preventDefault();
//                 this.sendMessage();
//             }
//         });
//     }
//
//     async sendMessage() {
//         const message = this.userInput.value.trim();
//         if (!message) return;
//
//         // Nachricht des Benutzers anzeigen
//         this.addMessage(message, 'user-message');
//         this.userInput.value = '';
//
//         try {
//             const response = await fetch('/api/chat', {
//                 method: 'POST',
//                 headers: {
//                     'Content-Type': 'application/json',
//                 },
//                 body: JSON.stringify({ message })
//             });
//
//             const data = await response.json();
//             
//             // Antwort der KI anzeigen
//             this.addMessage(data.response, 'ai-message');
//         } catch (error) {
//             console.error('Error:', error);
//             this.addMessage('Ein Fehler ist aufgetreten. Bitte versuchen Sie es später erneut.', 'ai-message error');
//         }
//     }
//
//     addMessage(text, className) {
//         const messageDiv = document.createElement('div');
//         messageDiv.className = `message ${className}`;
//         messageDiv.textContent = text;
//         this.chatHistory.appendChild(messageDiv);
//         this.chatHistory.scrollTop = this.chatHistory.scrollHeight;
//     }
// }
//
// // Chat-Interface initialisieren
// document.addEventListener('DOMContentLoaded', () => {
//     new ChatInterface();
// }); 
