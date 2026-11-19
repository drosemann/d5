// Goose-Port-Spiegel von: projects/archive-unsorted-guestbook-html-css-javascript/js/main.js
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/archive-unsorted-guestbook-html-css-javascript/js/main.js");
}

// ---- Original-Code (projects/archive-unsorted-guestbook-html-css-javascript/js/main.js), unveraendert, als Inline-Doku ----
// document.addEventListener('DOMContentLoaded', function() {
//     const form = document.getElementById('guestbookForm');
//     const entriesContainer = document.getElementById('entriesContainer');
//
//     // Load existing entries when page loads
//     loadEntries();
//
//     // Handle form submission
//     form.addEventListener('submit', async function(e) {
//         e.preventDefault();
//         
//         const formData = {
//             name: document.getElementById('name').value.trim(),
//             email: document.getElementById('email').value.trim(),
//             message: document.getElementById('message').value.trim()
//         };
//
//         const submitButton = form.querySelector('button[type="submit"]');
//
//         submitButton.disabled = true;
//         submitButton.textContent = 'Sending...';
//
//         try {
//             validateInput(formData);
//             const response = await fetch('php/save_entry.php', {
//                 method: 'POST',
//                 headers: {
//                     'Content-Type': 'application/json'
//                 },
//                 body: JSON.stringify(formData)
//             });
//
//             const result = await response.json();
//             
//             if (result.success) {
//                 // Clear form
//                 form.reset();
//                 // Reload entries
//                 loadEntries();
//             } else {
//                 showNotification('Error saving your message. Please try again.');
//             }
//         } catch (error) {
//             console.error('Error:', error);
//             showNotification(error.message || 'Error saving your message. Please try again.');
//         } finally {
//             submitButton.disabled = false;
//             submitButton.textContent = 'Submit';
//         }
//     });
//
//     // Format buttons functionality
//     const formatButtons = document.querySelectorAll('.format-btn');
//     formatButtons.forEach(button => {
//         button.addEventListener('click', function() {
//             const messageInput = document.getElementById('message');
//             const buttonText = this.textContent;
//             
//             switch(buttonText) {
//                 case '😊 Emoji':
//                     // You could implement an emoji picker here
//                     messageInput.value += '😊';
//                     break;
//                 case 'B':
//                     wrapText(messageInput, '[b]', '[/b]');
//                     break;
//                 case 'I':
//                     wrapText(messageInput, '[i]', '[/i]');
//                     break;
//                 case 'U':
//                     wrapText(messageInput, '[u]', '[/u]');
//                     break;
//                 case '🔗':
//                     wrapText(messageInput, '[url]', '[/url]');
//                     break;
//                 case '📷':
//                     wrapText(messageInput, '[img]', '[/img]');
//                     break;
//             }
//         });
//     });
//
//     // Helper function to load entries
//     async function loadEntries() {
//         try {
//             const response = await fetch('php/get_entries.php');
//             const entries = await response.json();
//             
//             entriesContainer.innerHTML = entries.map(entry => `
//                 <div class="entry">
//                     <div class="entry-header">
//                         <h3>${escapeHtml(entry.name)}</h3>
//                         <span class="date">${new Date(entry.created_at).toLocaleDateString()}</span>
//                     </div>
//                     <p>${formatMessage(escapeHtml(entry.message))}</p>
//                 </div>
//             `).join('');
//         } catch (error) {
//             console.error('Error loading entries:', error);
//             entriesContainer.innerHTML = '<p>Error loading entries. Please try again later.</p>';
//         }
//     }
//
//     // Helper function to wrap selected text with formatting tags
//     function wrapText(input, openTag, closeTag) {
//         const start = input.selectionStart;
//         const end = input.selectionEnd;
//         const selectedText = input.value.substring(start, end);
//         const newText = openTag + selectedText + closeTag;
//         
//         input.value = input.value.substring(0, start) + newText + input.value.substring(end);
//         input.focus();
//     }
//
//     // Helper function to escape HTML to prevent XSS
//     function escapeHtml(unsafe) {
//         return unsafe
//             .replace(/&/g, "&amp;")
//             .replace(/</g, "&lt;")
//             .replace(/>/g, "&gt;")
//             .replace(/"/g, "&quot;")
//             .replace(/'/g, "&#039;");
//     }
//
//     // Helper function to format message (convert BBCode-style tags to HTML)
//     function formatMessage(message) {
//         return message
//             .replace(/\[b\](.*?)\[\/b\]/g, '<strong>$1</strong>')
//             .replace(/\[i\](.*?)\[\/i\]/g, '<em>$1</em>')
//             .replace(/\[u\](.*?)\[\/u\]/g, '<u>$1</u>')
//             .replace(/\[url\](.*?)\[\/url\]/g, '<a href="$1" target="_blank">$1</a>')
//             .replace(/\[img\](.*?)\[\/img\]/g, '<img src="$1" alt="User posted image" class="user-image">');
//     }
//
//     // Add periodic refresh
//     setInterval(loadEntries, 30000); // Refresh every 30 seconds
//
//     // Or implement WebSocket for real-time updates
//     const ws = new WebSocket('ws://your-server/websocket');
//     ws.onmessage = function(event) {
//         const newEntry = JSON.parse(event.data);
//         addNewEntry(newEntry);
//     };
//
//     // Add mood selector to form
//     const moodSelector = `
//         <select id="mood">
//             <option value="happy">😊 Happy</option>
//             <option value="sad">😢 Sad</option>
//             <option value="excited">🎉 Excited</option>
//             <option value="tired">😴 Tired</option>
//         </select>
//     `;
//
//     // Add weather info to each entry
//     async function getWeather(location) {
//         const API_KEY = 'your_weather_api_key';
//         const response = await fetch(`https://api.weatherapi.com/v1/current.json?key=${API_KEY}&q=${location}`);
//         return response.json();
//     }
//
//     // Add voice recording functionality
//     let mediaRecorder;
//     let audioChunks = [];
//
//     function startRecording() {
//         navigator.mediaDevices.getUserMedia({ audio: true })
//             .then(stream => {
//                 mediaRecorder = new MediaRecorder(stream);
//                 mediaRecorder.start();
//                 
//                 mediaRecorder.addEventListener("dataavailable", event => {
//                     audioChunks.push(event.data);
//                 });
//             });
//     }
//
//     // Add quick message templates
//     const messageTemplates = {
//         greeting: "Hi everyone! Just wanted to say...",
//         birthday: "Happy birthday! Wishing you...",
//         thanks: "Thank you so much for...",
//         custom: [] // User-saved templates
//     };
//
//     // Add simple drawing capability
//     const canvas = document.createElement('canvas');
//     const ctx = canvas.getContext('2d');
//
//     function initDrawing() {
//         let isDrawing = false;
//         canvas.addEventListener('mousedown', startDrawing);
//         canvas.addEventListener('mousemove', draw);
//         canvas.addEventListener('mouseup', stopDrawing);
//     }
//
//     // Show visitor locations on a map
//     function initVisitorMap() {
//         const map = new google.maps.Map(document.getElementById('visitor-map'));
//         fetch('get_visitor_locations.php')
//             .then(response => response.json())
//             .then(locations => {
//                 locations.forEach(location => {
//                     new google.maps.Marker({
//                         position: { lat: location.lat, lng: location.lng },
//                         map: map
//                     });
//                 });
//             });
//     }
//
//     // Add before form submission
//     function validateInput(formData) {
//         if (formData.message.length < 10 || formData.message.length > 1000) {
//             throw new Error('Message must be between 10 and 1000 characters');
//         }
//         if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(formData.email)) {
//             throw new Error('Invalid email format');
//         }
//     }
//
//     // Replace generic error alerts with a toast/notification system
//     function showNotification(message, type = 'error') {
//         const notification = document.createElement('div');
//         notification.className = `notification ${type}`;
//         notification.textContent = message;
//         document.body.appendChild(notification);
//         setTimeout(() => notification.remove(), 5000);
//     }
//
//     // Use it instead of alert():
//     showNotification('Error saving your message. Please try again.');
//
//     // Debounce the loadEntries function
//     function debounce(func, wait) {
//         let timeout;
//         return function executedFunction(...args) {
//             const later = () => {
//                 clearTimeout(timeout);
//                 func(...args);
//             };
//             clearTimeout(timeout);
//             timeout = setTimeout(later, wait);
//         };
//     }
//
//     const debouncedLoadEntries = debounce(loadEntries, 250);
// }); 
