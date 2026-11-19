// Goose-Port-Spiegel von: projects/github-repos-forum-for-nerds-blog,-cms-&-community-platforms-blog/public/js/script.js
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/github-repos-forum-for-nerds-blog,-cms-&-community-platforms-blog/public/js/script.js");
}

// ---- Original-Code (projects/github-repos-forum-for-nerds-blog,-cms-&-community-platforms-blog/public/js/script.js), unveraendert, als Inline-Doku ----
// document.addEventListener('DOMContentLoaded', async function() {
//     // DOM Elements
//     const articlesContainer = document.getElementById('articles-container');
//
//     // Functions
//     function createArticleCard(article) {
//         return `
//             <article class="article-card">
//                 <img src="${article.image}" alt="${article.title}" onerror="this.src='https://via.placeholder.com/800x400?text=No+Image'">
//                 <div class="article-card-content">
//                     <h3>${article.title}</h3>
//                     <p>${article.content}</p>
//                     <div class="article-meta">
//                         <span>${new Date(article.date).toLocaleDateString()}</span>
//                     </div>
//                 </div>
//             </article>
//         `;
//     }
//
//     async function loadArticles() {
//         try {
//             // Fetch articles directly (server now returns article content)
//             const response = await fetch('/content/articles/');
//             if (!response.ok) {
//                 throw new Error(`HTTP error! status: ${response.status}`);
//             }
//             const articles = await response.json();
//             
//             if (articles && articles.length > 0) {
//                 // Sort articles by date in descending order (newest first)
//                 const sortedArticles = articles.sort((a, b) => 
//                     new Date(b.date) - new Date(a.date)
//                 );
//                 
//                 // Display the articles
//                 articlesContainer.innerHTML = sortedArticles
//                     .map(article => createArticleCard(article))
//                     .join('');
//             } else {
//                 articlesContainer.innerHTML = '<p>No articles found. Check back later!</p>';
//             }
//         } catch (error) {
//             console.error('Error loading articles:', error);
//             articlesContainer.innerHTML = '<p>Error loading articles. Please try again later.</p>';
//         }
//     }
//
//     // Initial load
//     loadArticles();
// });
//
