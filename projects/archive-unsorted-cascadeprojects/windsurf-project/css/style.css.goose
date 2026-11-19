// Goose-Port-Spiegel von: projects/archive-unsorted-cascadeprojects/windsurf-project/css/style.css
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/archive-unsorted-cascadeprojects/windsurf-project/css/style.css");
}

// ---- Original-Code (projects/archive-unsorted-cascadeprojects/windsurf-project/css/style.css), unveraendert, als Inline-Doku ----
// /* Base Styles */
// :root {
//     --primary-color: #6366f1;
//     --secondary-color: #8b5cf6;
//     --accent-color: #06b6d4;
//     --background-color: #f8fafc;
//     --surface-color: #ffffff;
//     --text-color: #1e293b;
//     --text-muted: #64748b;
//     --border-color: #e2e8f0;
//     --shadow-sm: 0 1px 2px 0 rgb(0 0 0 / 0.05);
//     --shadow-md: 0 4px 6px -1px rgb(0 0 0 / 0.1), 0 2px 4px -2px rgb(0 0 0 / 0.1);
//     --shadow-lg: 0 10px 15px -3px rgb(0 0 0 / 0.1), 0 4px 6px -4px rgb(0 0 0 / 0.1);
//     --shadow-xl: 0 20px 25px -5px rgb(0 0 0 / 0.1), 0 8px 10px -6px rgb(0 0 0 / 0.1);
//     --radius-sm: 0.375rem;
//     --radius-md: 0.5rem;
//     --radius-lg: 0.75rem;
//     --radius-xl: 1rem;
//     --spacing: 2rem;
// }
//
// * {
//     margin: 0;
//     padding: 0;
//     box-sizing: border-box;
// }
//
// body {
//     font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, sans-serif;
//     line-height: 1.6;
//     color: var(--text-color);
//     background: linear-gradient(135deg, var(--background-color) 0%, #e2e8f0 100%);
//     min-height: 100vh;
// }
//
// .container {
//     width: 90%;
//     max-width: 1200px;
//     margin: 0 auto;
//     padding: 0 15px;
// }
//
// /* Header */
// header {
//     background: linear-gradient(135deg, var(--primary-color) 0%, var(--secondary-color) 100%);
//     color: white;
//     padding: 2rem 0;
//     margin-bottom: 2rem;
//     box-shadow: var(--shadow-lg);
//     position: relative;
//     overflow: hidden;
// }
//
// header::before {
//     content: '';
//     position: absolute;
//     top: 0;
//     left: 0;
//     right: 0;
//     bottom: 0;
//     background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1000 100" fill="%23ffffff" opacity="0.1"><polygon points="0,0 1000,100 1000,0"/></svg>');
//     background-repeat: no-repeat;
//     background-position: bottom;
//     background-size: 100% 100%;
// }
//
// header .container {
//     position: relative;
//     z-index: 1;
// }
//
// header h1 {
//     text-align: center;
//     margin-bottom: 1.5rem;
//     font-size: 2.5rem;
//     font-weight: 700;
//     text-shadow: 0 2px 4px rgba(0,0,0,0.3);
//     letter-spacing: -0.025em;
// }
//
// /* Search */
// .search-container {
//     max-width: 600px;
//     margin: 0 auto;
// }
//
// #searchInput {
//     width: 100%;
//     padding: 1rem 1.25rem;
//     border: 2px solid transparent;
//     border-radius: var(--radius-lg);
//     font-size: 1rem;
//     background: rgba(255, 255, 255, 0.9);
//     backdrop-filter: blur(10px);
//     transition: all 0.3s ease;
//     box-shadow: var(--shadow-sm);
// }
//
// #searchInput:focus {
//     outline: none;
//     border-color: rgba(255, 255, 255, 0.8);
//     background: white;
//     box-shadow: var(--shadow-md);
//     transform: translateY(-2px);
// }
//
// /* Blog Grid */
// .blog-grid {
//     display: grid;
//     grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
//     gap: 2rem;
//     margin: 2rem 0;
// }
//
// .blog-card {
//     background: var(--surface-color);
//     border-radius: var(--radius-xl);
//     overflow: hidden;
//     box-shadow: var(--shadow-md);
//     transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
//     border: 1px solid var(--border-color);
//     position: relative;
// }
//
// .blog-card::before {
//     content: '';
//     position: absolute;
//     top: 0;
//     left: 0;
//     right: 0;
//     bottom: 0;
//     background: linear-gradient(135deg, transparent 0%, rgba(99, 102, 241, 0.02) 50%, transparent 100%);
//     pointer-events: none;
// }
//
// .blog-card:hover {
//     transform: translateY(-8px) scale(1.02);
//     box-shadow: var(--shadow-xl);
//     border-color: rgba(99, 102, 241, 0.2);
// }
//
// .blog-image {
//     display: none;
// }
//
// .blog-content {
//     padding: 2rem;
//     position: relative;
//     z-index: 1;
// }
//
// .blog-date {
//     color: var(--text-muted);
//     font-size: 0.875rem;
//     margin-bottom: 0.75rem;
//     font-weight: 500;
//     text-transform: uppercase;
//     letter-spacing: 0.05em;
// }
//
// .blog-title {
//     font-size: 1.5rem;
//     margin-bottom: 1rem;
//     color: var(--text-color);
//     font-weight: 600;
//     line-height: 1.3;
//     transition: color 0.3s ease;
// }
//
// .blog-card:hover .blog-title {
//     color: var(--primary-color);
// }
//
// .blog-excerpt {
//     color: var(--text-muted);
//     margin-bottom: 1.5rem;
//     display: -webkit-box;
//     -webkit-line-clamp: 3;
//     line-clamp: 3;
//     -webkit-box-orient: vertical;
//     box-orient: vertical;
//     overflow: hidden;
//     line-height: 1.6;
// }
//
// .read-more {
//     display: inline-flex;
//     align-items: center;
//     color: var(--primary-color);
//     text-decoration: none;
//     font-weight: 600;
//     font-size: 0.875rem;
//     transition: all 0.3s ease;
//     gap: 0.5rem;
//     padding: 0.5rem 1rem;
//     border-radius: var(--radius-md);
//     border: 2px solid transparent;
//     position: relative;
//     z-index: 1;
// }
//
// .read-more::after {
//     content: '→';
//     transition: transform 0.3s ease;
//     font-size: 1.1em;
// }
//
// .read-more:hover {
//     color: var(--surface-color);
//     background: linear-gradient(135deg, var(--primary-color) 0%, var(--secondary-color) 100%);
//     transform: translateX(4px);
//     border-color: var(--primary-color);
// }
//
// .read-more:hover::after {
//     transform: translateX(2px);
// }
//
// /* Footer */
// footer {
//     background: linear-gradient(135deg, var(--primary-color) 0%, var(--secondary-color) 100%);
//     color: white;
//     text-align: center;
//     padding: 3rem 0 2rem;
//     margin-top: 4rem;
//     position: relative;
//     overflow: hidden;
// }
//
// footer::before {
//     content: '';
//     position: absolute;
//     top: 0;
//     left: 0;
//     right: 0;
//     height: 4px;
//     background: linear-gradient(90deg, transparent 0%, rgba(255, 255, 255, 0.3) 50%, transparent 100%);
// }
//
// footer p {
//     margin: 0;
//     font-size: 0.875rem;
//     opacity: 0.9;
//     font-weight: 500;
// }
//
// /* Responsive */
// @media (max-width: 768px) {
//     .blog-grid {
//         grid-template-columns: 1fr;
//         gap: 1.5rem;
//     }
//     
//     .container {
//         width: 95%;
//         padding: 0 1rem;
//     }
//     
//     header h1 {
//         font-size: 2rem;
//     }
//     
//     .blog-content {
//         padding: 1.5rem;
//     }
//     
//     .blog-title {
//         font-size: 1.25rem;
//     }
// }
//
// @media (max-width: 480px) {
//     header {
//         padding: 1.5rem 0;
//     }
//     
//     header h1 {
//         font-size: 1.75rem;
//     }
//     
//     .search-container {
//         margin: 0 1rem;
//     }
//     
//     .blog-card {
//         margin: 0 0.5rem;
//     }
// }
//
// /* Animation for loading */
// @keyframes fadeInUp {
//     from {
//         opacity: 0;
//         transform: translateY(30px);
//     }
//     to {
//         opacity: 1;
//         transform: translateY(0);
//     }
// }
//
// .blog-card {
//     animation: fadeInUp 0.6s ease-out;
// }
//
// .blog-card:nth-child(2) {
//     animation-delay: 0.1s;
// }
//
// .blog-card:nth-child(3) {
//     animation-delay: 0.2s;
// }
//
// .blog-card:nth-child(4) {
//     animation-delay: 0.3s;
// }
//
// /* Smooth scrolling */
// html {
//     scroll-behavior: smooth;
// }
//
// /* Focus styles for accessibility */
// #searchInput:focus,
// .read-more:focus {
//     outline: 2px solid var(--accent-color);
//     outline-offset: 2px;
// }
//
// /* No results message */
// .no-results {
//     text-align: center;
//     padding: 3rem;
//     color: var(--text-muted);
//     font-size: 1.125rem;
//     background: var(--surface-color);
//     border-radius: var(--radius-lg);
//     box-shadow: var(--shadow-sm);
//     margin: 2rem auto;
//     max-width: 400px;
// }
//
