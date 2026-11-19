// Goose-Port-Spiegel von: projects/utilities-&-desktop-tools-audio_visualizer/script.js
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/utilities-&-desktop-tools-audio_visualizer/script.js");
}

// ---- Original-Code (projects/utilities-&-desktop-tools-audio_visualizer/script.js), unveraendert, als Inline-Doku ----
// if (document.getElementById("start-button")) {
//     document.getElementById("start-button").addEventListener("click", startVisualization);
// }
//
// // Define audioElement if you want to use a media element source
// // const audioElement = document.getElementById('your-audio-element-id'); // Uncomment and set correct ID if needed
//
// // Remove duplicate and conflicting declarations. Initialization happens in startVisualization().
//
// const canvas = document.getElementById('visualizer');
// const ctx = canvas.getContext('2d');
//
// // Set canvas size
// canvas.width = window.innerWidth;
// canvas.height = window.innerHeight / 2;
//
// // Update canvas size on window resize
// window.addEventListener('resize', () => {
//     canvas.width = window.innerWidth;
//     canvas.height = window.innerHeight / 2;
// });
//     canvas.height = window.innerHeight / 2;
//
// resizeCanvas();
// window.addEventListener('resize', resizeCanvas);
//
// let audioContext;
// let analyser;
// let source;
// let animationId;
//
// function startVisualization() {
//     // Initialize audio context
//     audioContext = new (window.AudioContext || window.webkitAudioContext)();
//     analyser = audioContext.createAnalyser();
//     
//     // Configure analyser
//     analyser.fftSize = 2048;
//     const bufferLength = analyser.frequencyBinCount;
//     const dataArray = new Uint8Array(bufferLength);
//     
//     // Get audio input from microphone
//     navigator.mediaDevices.getUserMedia({ audio: true })
//         .then(stream => {
//             source = audioContext.createMediaStreamSource(stream);
//             source.connect(analyser);
//             
//             // Start drawing
//             draw();
//         })
//         .catch(error => console.error('Error accessing microphone:', error));
// }
//
// function draw() {
//     const bufferLength = analyser.frequencyBinCount;
//     const dataArray = new Uint8Array(bufferLength);
//     
//     // Clear canvas
//     ctx.fillStyle = 'rgb(0, 0, 0)';
//     ctx.fillRect(0, 0, canvas.width, canvas.height);
//     
//     // Get frequency data
//     analyser.getByteFrequencyData(dataArray);
//     
//     // Set up bar width and spacing
//     const barWidth = (canvas.width / bufferLength) * 2.5;
//     let barHeight;
//     let x = 0;
//     
//     // Draw bars
//     for(let i = 0; i < bufferLength; i++) {
//         barHeight = dataArray[i] * 1.5;
//         
//         // Create gradient color based on frequency
//         const hue = (i / bufferLength) * 360;
//         ctx.fillStyle = `hsl(${hue}, 100%, 50%)`;
//         
//         ctx.fillRect(x, canvas.height - barHeight, barWidth, barHeight);
//         x += barWidth + 1;
//     }
//     
//     animationId = requestAnimationFrame(draw);
// }
//
// // Add event listener to start button
// if (document.getElementById("start-button")) {
//     document.getElementById("start-button").addEventListener("click", startVisualization);
// }
