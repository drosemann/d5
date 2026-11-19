// Goose-Port-Spiegel von: projects/github-repos-forum-for-nerds/Blog, CMS & Community Platforms/modern-blog-website/style.css
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/github-repos-forum-for-nerds/Blog, CMS & Community Platforms/modern-blog-website/style.css");
}

// ---- Original-Code (projects/github-repos-forum-for-nerds/Blog, CMS & Community Platforms/modern-blog-website/style.css), unveraendert, als Inline-Doku ----
// /* ============================================================================
//    2026 MODERN BLOG - CSS STANDARDS
//    ============================================================================ */
//
// /* Design Tokens */
// :root {
//     --color-primary: #1a1a1a;
//     --color-secondary: #ffffff;
//     --color-accent: #e8e8e8;
//     --color-text: #2d2d2d;
//     --color-text-light: #666666;
//     --color-border: #e0e0e0;
//     --color-hover: #f5f5f5;
//
//     --spacing-xs: 0.5rem;
//     --spacing-sm: 1rem;
//     --spacing-md: 1.5rem;
//     --spacing-lg: 2rem;
//     --spacing-xl: 3rem;
//     --spacing-2xl: 4rem;
//
//     --font-sans: -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Roboto', 'Oxygen',
//         'Ubuntu', 'Cantarell', 'Fira Sans', 'Droid Sans', 'Helvetica Neue',
//         sans-serif;
//     --font-serif: 'Georgia', 'Times New Roman', serif;
//
//     --font-size-xs: 0.875rem;
//     --font-size-sm: 1rem;
//     --font-size-base: 1.125rem;
//     --font-size-lg: 1.5rem;
//     --font-size-xl: 2rem;
//     --font-size-2xl: 2.5rem;
//     --font-size-3xl: 3rem;
//
//     --line-height-tight: 1.3;
//     --line-height-normal: 1.5;
//     --line-height-relaxed: 1.8;
//
//     --radius-sm: 0.375rem;
//     --radius-md: 0.5rem;
//     --radius-lg: 0.75rem;
//
//     --shadow-sm: 0 1px 2px 0 rgba(0, 0, 0, 0.05);
//     --shadow-md: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
//     --shadow-lg: 0 10px 15px -3px rgba(0, 0, 0, 0.1);
//
//     --transition-fast: 150ms ease-out;
//     --transition-base: 300ms ease-out;
//     --transition-slow: 500ms ease-out;
// }
//
// /* ============================================================================
//    RESET & BASE STYLES
//    ============================================================================ */
//
// * {
//     margin: 0;
//     padding: 0;
//     box-sizing: border-box;
// }
//
// html {
//     scroll-behavior: smooth;
//     -webkit-font-smoothing: antialiased;
//     -moz-osx-font-smoothing: grayscale;
// }
//
// body {
//     font-family: var(--font-sans);
//     font-size: var(--font-size-base);
//     line-height: var(--line-height-relaxed);
//     color: var(--color-text);
//     background-color: var(--color-secondary);
//     overflow-x: hidden;
// }
//
// /* ============================================================================
//    TYPOGRAPHY
//    ============================================================================ */
//
// h1, h2, h3, h4, h5, h6 {
//     font-weight: 600;
//     line-height: var(--line-height-tight);
//     margin-bottom: var(--spacing-md);
//     letter-spacing: -0.02em;
// }
//
// h1 {
//     font-size: var(--font-size-3xl);
// }
//
// h2 {
//     font-size: var(--font-size-2xl);
//     margin-top: var(--spacing-2xl);
// }
//
// h3 {
//     font-size: var(--font-size-xl);
// }
//
// h4 {
//     font-size: var(--font-size-lg);
// }
//
// p {
//     margin-bottom: var(--spacing-md);
// }
//
// a {
//     color: var(--color-primary);
//     text-decoration: none;
//     transition: color var(--transition-fast);
// }
//
// a:hover {
//     color: var(--color-text-light);
// }
//
// code {
//     background-color: var(--color-accent);
//     padding: 0.2em 0.4em;
//     border-radius: var(--radius-sm);
//     font-family: 'Courier New', monospace;
//     font-size: 0.9em;
// }
//
// ul, ol {
//     margin-left: var(--spacing-md);
//     margin-bottom: var(--spacing-md);
// }
//
// ul li, ol li {
//     margin-bottom: var(--spacing-sm);
// }
//
// /* ============================================================================
//    CONTAINER & LAYOUT
//    ============================================================================ */
//
// .container {
//     max-width: 1200px;
//     margin: 0 auto;
//     padding: 0 var(--spacing-md);
// }
//
// main {
//     min-height: 100vh;
// }
//
// /* ============================================================================
//    NAVIGATION
//    ============================================================================ */
//
// .navbar {
//     background-color: var(--color-secondary);
//     border-bottom: 1px solid var(--color-border);
//     position: sticky;
//     top: 0;
//     z-index: 100;
//     box-shadow: var(--shadow-sm);
// }
//
// .nav-wrapper {
//     display: flex;
//     justify-content: space-between;
//     align-items: center;
//     padding: var(--spacing-md) 0;
// }
//
// .logo {
//     font-size: var(--font-size-lg);
//     font-weight: 700;
//     letter-spacing: -0.05em;
//     text-transform: uppercase;
//     transition: opacity var(--transition-fast);
// }
//
// .logo:hover {
//     opacity: 0.8;
// }
//
// .nav-menu {
//     display: flex;
//     list-style: none;
//     gap: var(--spacing-xl);
// }
//
// .nav-menu a {
//     font-weight: 500;
//     font-size: var(--font-size-sm);
//     text-transform: capitalize;
//     position: relative;
// }
//
// .nav-menu a::after {
//     content: '';
//     position: absolute;
//     bottom: -4px;
//     left: 0;
//     width: 0;
//     height: 2px;
//     background-color: var(--color-primary);
//     transition: width var(--transition-fast);
// }
//
// .nav-menu a:hover::after {
//     width: 100%;
// }
//
// .menu-toggle {
//     display: none;
//     flex-direction: column;
//     background: none;
//     border: none;
//     cursor: pointer;
//     padding: var(--spacing-sm);
//     gap: 6px;
// }
//
// .menu-toggle span {
//     width: 24px;
//     height: 2px;
//     background-color: var(--color-primary);
//     border-radius: 2px;
//     transition: all var(--transition-base);
// }
//
// @media (max-width: 768px) {
//     .menu-toggle {
//         display: flex;
//     }
//
//     .nav-menu {
//         position: absolute;
//         top: 100%;
//         left: 0;
//         right: 0;
//         flex-direction: column;
//         gap: 0;
//         background-color: var(--color-secondary);
//         border-bottom: 1px solid var(--color-border);
//         max-height: 0;
//         overflow: hidden;
//         transition: max-height var(--transition-base);
//     }
//
//     .nav-menu.active {
//         max-height: 400px;
//     }
//
//     .nav-menu li {
//         border-bottom: 1px solid var(--color-border);
//     }
//
//     .nav-menu a {
//         display: block;
//         padding: var(--spacing-md);
//     }
//
//     .nav-menu a::after {
//         display: none;
//     }
// }
//
// /* ============================================================================
//    HERO SECTION
//    ============================================================================ */
//
// .hero {
//     padding: var(--spacing-2xl) 0;
//     background: linear-gradient(135deg, var(--color-secondary) 0%, var(--color-hover) 100%);
// }
//
// .hero-content {
//     max-width: 700px;
//     margin: 0 auto;
//     text-align: center;
// }
//
// .hero-content h1 {
//     margin-bottom: var(--spacing-lg);
//     font-size: var(--font-size-3xl);
// }
//
// .hero-content > p {
//     font-size: var(--font-size-base);
//     color: var(--color-text-light);
//     margin-bottom: var(--spacing-xl);
//     line-height: var(--line-height-relaxed);
// }
//
// .newsletter {
//     display: flex;
//     gap: var(--spacing-sm);
//     max-width: 500px;
//     margin: 0 auto;
// }
//
// .newsletter input {
//     flex: 1;
//     padding: var(--spacing-sm) var(--spacing-md);
//     border: 1px solid var(--color-border);
//     border-radius: var(--radius-md);
//     font-size: var(--font-size-base);
//     transition: border-color var(--transition-fast);
// }
//
// .newsletter input:focus {
//     outline: none;
//     border-color: var(--color-primary);
// }
//
// .newsletter button {
//     padding: var(--spacing-sm) var(--spacing-lg);
//     background-color: var(--color-primary);
//     color: var(--color-secondary);
//     border: none;
//     border-radius: var(--radius-md);
//     font-weight: 600;
//     cursor: pointer;
//     transition: background-color var(--transition-fast);
// }
//
// .newsletter button:hover {
//     background-color: var(--color-text-light);
// }
//
// /* ============================================================================
//    FEATURED ARTICLE
//    ============================================================================ */
//
// .featured {
//     padding: var(--spacing-2xl) 0;
// }
//
// .featured-article {
//     display: grid;
//     grid-template-columns: 1fr 1fr;
//     gap: var(--spacing-2xl);
//     align-items: center;
// }
//
// .featured-image {
//     aspect-ratio: 16 / 9;
//     background-color: var(--color-accent);
//     border-radius: var(--radius-lg);
//     display: flex;
//     align-items: center;
//     justify-content: center;
//     color: var(--color-text-light);
//     overflow: hidden;
//     box-shadow: var(--shadow-md);
// }
//
// .featured-content .category {
//     display: inline-block;
//     font-size: var(--font-size-xs);
//     font-weight: 700;
//     text-transform: uppercase;
//     letter-spacing: 0.1em;
//     color: var(--color-primary);
//     margin-bottom: var(--spacing-md);
// }
//
// .featured-content h2 {
//     font-size: var(--font-size-2xl);
//     margin-bottom: var(--spacing-md);
// }
//
// .featured-content p {
//     color: var(--color-text-light);
//     margin-bottom: var(--spacing-lg);
//     line-height: var(--line-height-relaxed);
// }
//
// .read-more {
//     display: inline-block;
//     font-weight: 600;
//     padding: var(--spacing-sm) var(--spacing-md);
//     border: 1px solid var(--color-primary);
//     border-radius: var(--radius-md);
//     transition: all var(--transition-fast);
//     margin-bottom: var(--spacing-lg);
// }
//
// .read-more:hover {
//     background-color: var(--color-primary);
//     color: var(--color-secondary);
// }
//
// .article-meta {
//     display: flex;
//     gap: var(--spacing-md);
//     color: var(--color-text-light);
//     font-size: var(--font-size-xs);
// }
//
// @media (max-width: 768px) {
//     .featured-article {
//         grid-template-columns: 1fr;
//         gap: var(--spacing-lg);
//     }
//
//     .featured-content h2 {
//         font-size: var(--font-size-xl);
//     }
// }
//
// /* ============================================================================
//    ARTICLES GRID & FILTERS
//    ============================================================================ */
//
// .articles {
//     padding: var(--spacing-2xl) 0;
//     background-color: var(--color-hover);
// }
//
// .section-header {
//     text-align: center;
//     margin-bottom: var(--spacing-2xl);
// }
//
// .section-header h2 {
//     font-size: var(--font-size-2xl);
// }
//
// .section-header p {
//     color: var(--color-text-light);
//     font-size: var(--font-size-base);
// }
//
// .filters {
//     display: flex;
//     justify-content: center;
//     gap: var(--spacing-md);
//     margin-bottom: var(--spacing-2xl);
//     flex-wrap: wrap;
// }
//
// .filter-btn {
//     padding: var(--spacing-sm) var(--spacing-lg);
//     border: 1px solid var(--color-border);
//     background-color: var(--color-secondary);
//     border-radius: var(--radius-md);
//     cursor: pointer;
//     font-weight: 500;
//     transition: all var(--transition-fast);
// }
//
// .filter-btn:hover,
// .filter-btn.active {
//     background-color: var(--color-primary);
//     color: var(--color-secondary);
//     border-color: var(--color-primary);
// }
//
// .articles-grid {
//     display: grid;
//     grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
//     gap: var(--spacing-lg);
// }
//
// .article-card {
//     background-color: var(--color-secondary);
//     border-radius: var(--radius-lg);
//     overflow: hidden;
//     box-shadow: var(--shadow-sm);
//     transition: all var(--transition-base);
//     cursor: pointer;
// }
//
// .article-card:hover {
//     box-shadow: var(--shadow-lg);
//     transform: translateY(-4px);
// }
//
// .article-card-image {
//     width: 100%;
//     aspect-ratio: 16 / 9;
//     background-color: var(--color-accent);
//     display: flex;
//     align-items: center;
//     justify-content: center;
//     color: var(--color-text-light);
//     overflow: hidden;
// }
//
// .article-card-content {
//     padding: var(--spacing-lg);
// }
//
// .article-card .category {
//     display: inline-block;
//     font-size: var(--font-size-xs);
//     font-weight: 700;
//     text-transform: uppercase;
//     letter-spacing: 0.1em;
//     color: var(--color-primary);
//     margin-bottom: var(--spacing-sm);
// }
//
// .article-card h3 {
//     font-size: var(--font-size-lg);
//     margin-bottom: var(--spacing-sm);
// }
//
// .article-card p {
//     color: var(--color-text-light);
//     font-size: var(--font-size-sm);
//     margin-bottom: var(--spacing-md);
// }
//
// .article-card .article-meta {
//     font-size: var(--font-size-xs);
// }
//
// @media (max-width: 768px) {
//     .articles-grid {
//         grid-template-columns: 1fr;
//     }
// }
//
// /* ============================================================================
//    ARTICLE PAGE
//    ============================================================================ */
//
// .article-page {
//     padding: var(--spacing-2xl) 0;
// }
//
// .article-header {
//     max-width: 800px;
//     margin: 0 auto var(--spacing-2xl);
//     text-align: center;
// }
//
// .article-header h1 {
//     font-size: var(--font-size-3xl);
//     margin-bottom: var(--spacing-lg);
// }
//
// .article-image {
//     max-width: 900px;
//     margin: 0 auto var(--spacing-2xl);
//     aspect-ratio: 16 / 9;
//     background-color: var(--color-accent);
//     border-radius: var(--radius-lg);
//     overflow: hidden;
//     display: flex;
//     align-items: center;
//     justify-content: center;
//     color: var(--color-text-light);
//     box-shadow: var(--shadow-md);
// }
//
// .article-content {
//     max-width: 800px;
//     margin: 0 auto;
// }
//
// .article-content p {
//     margin-bottom: var(--spacing-lg);
//     text-align: justify;
// }
//
// .article-content h2 {
//     font-size: var(--font-size-xl);
//     margin-top: var(--spacing-2xl);
// }
//
// .article-content ul {
//     margin-bottom: var(--spacing-lg);
// }
//
// .article-content ul li {
//     margin-bottom: var(--spacing-sm);
// }
//
// .article-footer {
//     margin-top: var(--spacing-2xl);
//     padding-top: var(--spacing-lg);
//     border-top: 1px solid var(--color-border);
// }
//
// .article-tags {
//     display: flex;
//     gap: var(--spacing-sm);
//     flex-wrap: wrap;
// }
//
// .tag {
//     display: inline-block;
//     background-color: var(--color-hover);
//     padding: var(--spacing-sm) var(--spacing-md);
//     border-radius: var(--radius-md);
//     font-size: var(--font-size-xs);
//     font-weight: 500;
// }
//
// /* ============================================================================
//    RELATED ARTICLES & COMMENTS
//    ============================================================================ */
//
// .related-articles,
// .comments-section {
//     margin-top: var(--spacing-2xl);
//     padding: var(--spacing-2xl) 0;
//     border-top: 1px solid var(--color-border);
// }
//
// .related-articles h2,
// .comments-section h2 {
//     margin-bottom: var(--spacing-lg);
// }
//
// .comment-form {
//     background-color: var(--color-hover);
//     padding: var(--spacing-lg);
//     border-radius: var(--radius-lg);
//     margin-bottom: var(--spacing-2xl);
// }
//
// .form-group {
//     margin-bottom: var(--spacing-md);
// }
//
// .form-group label {
//     display: block;
//     margin-bottom: var(--spacing-sm);
//     font-weight: 500;
// }
//
// .form-group input,
// .form-group textarea {
//     width: 100%;
//     padding: var(--spacing-sm) var(--spacing-md);
//     border: 1px solid var(--color-border);
//     border-radius: var(--radius-md);
//     font-family: var(--font-sans);
//     font-size: var(--font-size-base);
//     transition: border-color var(--transition-fast);
// }
//
// .form-group input:focus,
// .form-group textarea:focus {
//     outline: none;
//     border-color: var(--color-primary);
// }
//
// .comment-form button {
//     padding: var(--spacing-sm) var(--spacing-lg);
//     background-color: var(--color-primary);
//     color: var(--color-secondary);
//     border: none;
//     border-radius: var(--radius-md);
//     font-weight: 600;
//     cursor: pointer;
//     transition: background-color var(--transition-fast);
// }
//
// .comment-form button:hover {
//     background-color: var(--color-text-light);
// }
//
// .comments-list {
//     display: flex;
//     flex-direction: column;
//     gap: var(--spacing-lg);
// }
//
// .comment {
//     padding: var(--spacing-lg);
//     background-color: var(--color-hover);
//     border-radius: var(--radius-md);
//     border-left: 3px solid var(--color-primary);
// }
//
// .comment-author {
//     font-weight: 600;
//     margin-bottom: var(--spacing-sm);
// }
//
// .comment-date {
//     font-size: var(--font-size-xs);
//     color: var(--color-text-light);
//     margin-bottom: var(--spacing-sm);
// }
//
// .comment-text {
//     color: var(--color-text);
// }
//
// /* ============================================================================
//    NEWSLETTER SECTION
//    ============================================================================ */
//
// .newsletter-section {
//     background-color: var(--color-hover);
//     padding: var(--spacing-2xl) 0;
//     text-align: center;
//     margin: var(--spacing-2xl) 0;
// }
//
// .newsletter-section h2 {
//     font-size: var(--font-size-2xl);
//     margin-bottom: var(--spacing-md);
// }
//
// .newsletter-section p {
//     color: var(--color-text-light);
//     margin-bottom: var(--spacing-lg);
// }
//
// .newsletter-form {
//     display: flex;
//     gap: var(--spacing-sm);
//     max-width: 500px;
//     margin: 0 auto;
// }
//
// .newsletter-form input {
//     flex: 1;
//     padding: var(--spacing-sm) var(--spacing-md);
//     border: 1px solid var(--color-border);
//     border-radius: var(--radius-md);
//     font-size: var(--font-size-base);
// }
//
// .newsletter-form input:focus {
//     outline: none;
//     border-color: var(--color-primary);
// }
//
// .newsletter-form button {
//     padding: var(--spacing-sm) var(--spacing-lg);
//     background-color: var(--color-primary);
//     color: var(--color-secondary);
//     border: none;
//     border-radius: var(--radius-md);
//     font-weight: 600;
//     cursor: pointer;
//     transition: background-color var(--transition-fast);
// }
//
// .newsletter-form button:hover {
//     background-color: var(--color-text-light);
// }
//
// /* ============================================================================
//    FOOTER
//    ============================================================================ */
//
// .footer {
//     background-color: var(--color-primary);
//     color: var(--color-secondary);
//     padding: var(--spacing-2xl) 0 var(--spacing-lg);
//     margin-top: var(--spacing-2xl);
// }
//
// .footer-content {
//     display: grid;
//     grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
//     gap: var(--spacing-xl);
//     margin-bottom: var(--spacing-xl);
// }
//
// .footer-section h3,
// .footer-section h4 {
//     margin-bottom: var(--spacing-md);
// }
//
// .footer-section p {
//     color: rgba(255, 255, 255, 0.8);
// }
//
// .footer-section ul {
//     list-style: none;
//     margin: 0;
// }
//
// .footer-section ul li {
//     margin-bottom: var(--spacing-sm);
// }
//
// .footer-section a {
//     color: rgba(255, 255, 255, 0.8);
// }
//
// .footer-section a:hover {
//     color: var(--color-secondary);
// }
//
// .footer-bottom {
//     text-align: center;
//     padding-top: var(--spacing-lg);
//     border-top: 1px solid rgba(255, 255, 255, 0.1);
//     color: rgba(255, 255, 255, 0.6);
//     font-size: var(--font-size-xs);
// }
//
// /* ============================================================================
//    ACCESSIBILITY & FOCUS STATES
//    ============================================================================ */
//
// button:focus-visible,
// a:focus-visible,
// input:focus-visible,
// textarea:focus-visible {
//     outline: 2px solid var(--color-primary);
//     outline-offset: 2px;
// }
//
// .sr-only {
//     position: absolute;
//     width: 1px;
//     height: 1px;
//     padding: 0;
//     margin: -1px;
//     overflow: hidden;
//     clip: rect(0, 0, 0, 0);
//     white-space: nowrap;
//     border-width: 0;
// }
//
// /* ============================================================================
//    RESPONSIVE UTILITIES
//    ============================================================================ */
//
// @media (max-width: 768px) {
//     :root {
//         --font-size-3xl: 2rem;
//         --font-size-2xl: 1.75rem;
//         --font-size-xl: 1.25rem;
//         --spacing-2xl: 2.5rem;
//         --spacing-xl: 1.5rem;
//     }
//
//     .hero {
//         padding: var(--spacing-xl) 0;
//     }
//
//     .featured {
//         padding: var(--spacing-xl) 0;
//     }
//
//     .articles {
//         padding: var(--spacing-xl) 0;
//     }
//
//     .newsletter {
//         flex-direction: column;
//     }
//
//     .newsletter input,
//     .newsletter button {
//         width: 100%;
//     }
// }
//
// @media (prefers-reduced-motion: reduce) {
//     * {
//         animation-duration: 0.01ms !important;
//         animation-iteration-count: 1 !important;
//         transition-duration: 0.01ms !important;
//         scroll-behavior: auto !important;
//     }
// }
//
// /* Print Styles */
// @media print {
//     .navbar,
//     .newsletter-section,
//     .comments-section,
//     .footer {
//         display: none;
//     }
//
//     .article-content {
//         max-width: 100%;
//     }
// }
//
