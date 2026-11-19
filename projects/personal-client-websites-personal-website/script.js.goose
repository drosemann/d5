// Goose-Port-Spiegel von: projects/personal-client-websites-personal-website/script.js
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/personal-client-websites-personal-website/script.js");
}

// ---- Original-Code (projects/personal-client-websites-personal-website/script.js), unveraendert, als Inline-Doku ----
// document.addEventListener('DOMContentLoaded', () => {
//     // Smooth scrolling for navigation links
//     document.querySelectorAll('a[href^="#"]').forEach(anchor => {
//         anchor.addEventListener('click', function (e) {
//             e.preventDefault();
//             
//             document.querySelector(this.getAttribute('href')).scrollIntoView({
//                 behavior: 'smooth'
//             });
//         });
//     });
//
//     // Contact form submission handler
//     const contactForm = document.getElementById('contact-form');
//     if (contactForm) {
//         contactForm.addEventListener('submit', function(e) {
//             e.preventDefault();
//             
//             // Basic form validation
//             const name = this.querySelector('input[name="name"]').value.trim();
//             const email = this.querySelector('input[name="email"]').value.trim();
//             const message = this.querySelector('textarea[name="message"]').value.trim();
//
//             if (!name || !email || !message) {
//                 alert('Please fill out all fields');
//                 return;
//             }
//
//             // Email validation regex
//             const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
//             if (!emailRegex.test(email)) {
//                 alert('Please enter a valid email address');
//                 return;
//             }
//
//             // Simulated form submission (replace with actual backend logic)
//             console.log('Form submitted:', { name, email, message });
//             alert('Thank you for your message! I will get back to you soon.');
//             
//             // Reset form
//             this.reset();
//         });
//     }
//
//     // Animated scroll reveal for sections
//     const revealOnScroll = () => {
//         const reveals = document.querySelectorAll('.about, .projects, .contact');
//         
//         reveals.forEach(reveal => {
//             const windowHeight = window.innerHeight;
//             const revealTop = reveal.getBoundingClientRect().top;
//             const revealPoint = 150;
//
//             if (revealTop < windowHeight - revealPoint) {
//                 reveal.classList.add('active');
//             } else {
//                 reveal.classList.remove('active');
//             }
//         });
//     };
//
//     window.addEventListener('scroll', revealOnScroll);
//     revealOnScroll(); // Initial call
//
//     // Optional: Add subtle hover effects to project cards
//     const projectCards = document.querySelectorAll('.project-card');
//     projectCards.forEach(card => {
//         card.addEventListener('mouseenter', () => {
//             card.style.transform = 'scale(1.05)';
//             card.style.transition = 'transform 0.3s ease';
//         });
//
//         card.addEventListener('mouseleave', () => {
//             card.style.transform = 'scale(1)';
//         });
//     });
// });
//
