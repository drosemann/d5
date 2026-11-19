const blogPosts = [];

// Funktion zum Laden von Blog-Posts aus HTML-Dateien
async function loadBlogPosts() {
    try {
        // Liste aller verfügbaren Artikel (ohne die zu löschenden)
        const posts = [
            {
                id: 1,
                title: 'Was ist ein Server? Einfach erklärt',
                date: '11. Oktober 2025',
                excerpt: 'Umfassende Erklärung was ein Server ist, wie er funktioniert und warum er für das Internet unverzichtbar ist.',
                image: '',
                file: 'posts/was-ist-ein-server-einfach-erklaert.html'
            },
            {
                id: 2,
                title: 'Unterschied zwischen HTTP und HTTPS',
                date: '11. Oktober 2025',
                excerpt: 'Warum HTTPS sicherer als HTTP ist und wie die Verschlüsselung funktioniert.',
                image: '',
                file: 'posts/unterschied-zwischen-http-und-https.html'
            },
            {
                id: 3,
                title: 'Docker einfach erklärt',
                date: '11. Oktober 2025',
                excerpt: 'Was ist Containerisierung und warum revolutioniert Docker die Software-Entwicklung?',
                image: '',
                file: 'posts/docker-einfach-erklaert.html'
            },
            {
                id: 4,
                title: 'Linux vs Windows Server – welcher ist besser?',
                date: '11. Oktober 2025',
                excerpt: 'Objektiver Vergleich zwischen Linux und Windows Server für verschiedene Anwendungsfälle.',
                image: '',
                file: 'posts/linux-vs-windows-server-welcher-ist-besser.html'
            },
            {
                id: 5,
                title: 'Was ist eine Firewall wirklich?',
                date: '11. Oktober 2025',
                excerpt: 'Wie Firewalls funktionieren und warum sie die erste Verteidigungslinie deines Servers sind.',
                image: '',
                file: 'posts/was-ist-eine-firewall-wirklich.html'
            }
        ];
        return posts;
        
    } catch (error) {
        console.error('Fehler beim Laden der Blog-Posts:', error);
        return [];
    }
}

// Function to create blog post HTML
function createBlogPostHTML(post) {
    return `
        <article class="blog-card">
            <div class="blog-content">
                <div class="blog-date">${post.date}</div>
                <h2 class="blog-title">${post.title}</h2>
                <p class="blog-excerpt">${post.excerpt}</p>
                <a href="${post.file}" class="read-more">Weiterlesen →</a>
            </div>
        </article>
    `;
}

// Function to display blog posts
function displayBlogPosts(posts) {
    const blogList = document.getElementById('blog-list');
    if (!blogList) return;
    
    if (posts.length === 0) {
        blogList.innerHTML = '<p class="no-results">Keine Beiträge gefunden.</p>';
        return;
    }
    
    blogList.innerHTML = posts.map(post => createBlogPostHTML(post)).join('');
}

// Search functionality
function setupSearch() {
    const searchInput = document.getElementById('searchInput');
    if (!searchInput) return;
    
    searchInput.addEventListener('input', (e) => {
        const searchTerm = e.target.value.toLowerCase();
        const filteredPosts = blogPosts.filter(post => 
            post.title.toLowerCase().includes(searchTerm) || 
            post.excerpt.toLowerCase().includes(searchTerm)
        );
        displayBlogPosts(filteredPosts);
    });
}

// Initialize the blog
async function init() {
    const posts = await loadBlogPosts();
    blogPosts.push(...posts); // Füge die geladenen Posts hinzu
    displayBlogPosts(blogPosts);
    setupSearch();
}

// Wait for the DOM to be fully loaded
document.addEventListener('DOMContentLoaded', init);
