// Goose-Port-Spiegel von: projects/github-repos-forum-for-nerds/Blog, CMS & Community Platforms/blog html, css, javascript and php for backend/js/script.js
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/github-repos-forum-for-nerds/Blog, CMS & Community Platforms/blog html, css, javascript and php for backend/js/script.js");
}

// ---- Original-Code (projects/github-repos-forum-for-nerds/Blog, CMS & Community Platforms/blog html, css, javascript and php for backend/js/script.js), unveraendert, als Inline-Doku ----
// document.addEventListener('DOMContentLoaded', function() {
//     // Beispiel-Blogbeiträge
//     const posts = [
//         {
//             id: 1,
//             title: 'Mein erster Blogbeitrag',
//             excerpt: 'Dies ist eine kurze Beschreibung des ersten Blogbeitrags...',
//             image: 'https://picsum.photos/id/1/400/300',
//             date: '2024-03-20',
//             category: 'Lifestyle'
//         },
//         {
//             id: 2,
//             title: 'Web Development Tips',
//             excerpt: 'Nützliche Tipps für moderne Webentwicklung...',
//             image: 'https://picsum.photos/id/2/400/300',
//             date: '2024-03-19',
//             category: 'Technologie'
//         },
//         // Weitere Beiträge hier hinzufügen
//     ];
//
//     // Kategorien
//     const categories = ['Alle', 'Lifestyle', 'Technologie', 'Reisen', 'Food'];
//
//     // Funktionen
//     function createPostCard(post) {
//         return `
//             <article class="post-card">
//                 <img src="${post.image}" alt="${post.title}" class="post-image">
//                 <div class="post-content">
//                     <h3 class="post-title">${post.title}</h3>
//                     <p class="post-excerpt">${post.excerpt}</p>
//                     <div class="post-meta">
//                         <span>${post.date}</span> | 
//                         <span>${post.category}</span>
//                     </div>
//                 </div>
//             </article>
//         `;
//     }
//
//     function displayPosts(postsToShow = posts) {
//         const container = document.getElementById('post-container');
//         container.innerHTML = postsToShow.map(post => createPostCard(post)).join('');
//     }
//
//     function createCategoryList() {
//         const categoryList = document.getElementById('category-list');
//         categoryList.innerHTML = categories.map(category => 
//             `<li><a href="#" data-category="${category}">${category}</a></li>`
//         ).join('');
//
//         // Event-Listener für Kategorie-Filter
//         categoryList.addEventListener('click', (e) => {
//             e.preventDefault();
//             if (e.target.tagName === 'A') {
//                 const category = e.target.dataset.category;
//                 filterPosts(category);
//             }
//         });
//     }
//
//     function filterPosts(category) {
//         if (category === 'Alle') {
//             displayPosts();
//         } else {
//             const filteredPosts = posts.filter(post => post.category === category);
//             displayPosts(filteredPosts);
//         }
//     }
//
//     // Suchfunktion
//     const searchInput = document.getElementById('search');
//     searchInput.addEventListener('input', (e) => {
//         const searchTerm = e.target.value.toLowerCase();
//         const filteredPosts = posts.filter(post => 
//             post.title.toLowerCase().includes(searchTerm) || 
//             post.excerpt.toLowerCase().includes(searchTerm)
//         );
//         displayPosts(filteredPosts);
//     });
//
//     // Initialisierung
//     displayPosts();
//     createCategoryList();
// }); 
