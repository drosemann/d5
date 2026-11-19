// 2026 Modern JavaScript Standards
// Uses ES6+ features, async/await patterns, and modern DOM APIs

class GameCollection {
    constructor() {
        this.tabs = document.querySelectorAll('.tab');
        this.gameCards = document.querySelectorAll('.game-card');
        this.searchInput = document.getElementById('search');
        this.searchBtn = document.getElementById('search-btn');
        this.gameCategories = document.querySelectorAll('.game-category');
        this.playButtons = document.querySelectorAll('.play-btn');
        
        this.featuredGames = [
            {
                name: "Monster Arena",
                description: "Battle various creatures in a customizable arena setting. Upgrade your character, unlock new abilities, and become the champion!",
                image: "https://hebbkx1anhila5yf.public.blob.vercel-storage.com/image-xNJDB6mWAbJdCybzt9V16t8b4yCXre.png"
            },
            {
                name: "Space Shooter",
                description: "Blast through galaxies, defeat alien ships, and complete thrilling missions. Upgrade your spaceship and discover new worlds!",
                image: "https://hebbkx1anhila5yf.public.blob.vercel-storage.com/image-xNJDB6mWAbJdCybzt9V16t8b4yCXre.png"
            },
            {
                name: "City Planner",
                description: "Design and manage your own thriving city. Balance budgets and happiness while building your empire.",
                image: "https://hebbkx1anhila5yf.public.blob.vercel-storage.com/image-xNJDB6mWAbJdCybzt9V16t8b4yCXre.png"
            }
        ];
        
        this.currentFeaturedIndex = 0;
        this.searchTimeout = null;
        
        this.init();
    }
    
    init() {
        this.attachEventListeners();
        this.startFeaturedGameRotation();
    }
    
    attachEventListeners() {
        // Tab navigation
        this.tabs.forEach(tab => {
            tab.addEventListener('click', (e) => this.handleTabClick(e));
        });
        
        // Search functionality
        this.searchBtn.addEventListener('click', () => this.performSearch());
        this.searchInput.addEventListener('keyup', (e) => {
            if (e.key === 'Enter') this.performSearch();
            // Debounce live search
            clearTimeout(this.searchTimeout);
            this.searchTimeout = setTimeout(() => this.performSearch(), 300);
        });
        
        // Play buttons
        this.playButtons.forEach(button => {
            button.addEventListener('click', (e) => this.handlePlayClick(e));
        });
    }
    
    handleTabClick(event) {
        const tab = event.currentTarget;
        const category = tab.getAttribute('data-category');
        
        // Update ARIA attributes
        this.tabs.forEach(t => {
            t.classList.remove('active');
            t.setAttribute('aria-selected', 'false');
        });
        
        tab.classList.add('active');
        tab.setAttribute('aria-selected', 'true');
        
        // Filter categories
        this.gameCategories.forEach(section => {
            const isTarget = section.id === `${category}-games` || category === 'all';
            section.style.display = isTarget ? 'block' : 'none';
        });
        
        // Filter cards
        this.gameCards.forEach(card => {
            const cardCategory = card.getAttribute('data-category');
            card.style.display = 
                (category === 'all' || cardCategory === category) ? 'flex' : 'none';
        });
    }
    
    performSearch() {
        const searchTerm = this.searchInput.value.toLowerCase().trim();
        let hasResults = false;
        
        if (!searchTerm) {
            this.resetToAll();
            return;
        }
        
        // Show all categories
        this.gameCategories.forEach(section => {
            section.style.display = 'block';
        });
        
        // Filter cards
        this.gameCards.forEach(card => {
            const title = card.querySelector('h3')?.textContent.toLowerCase() || '';
            const description = card.querySelector('p')?.textContent.toLowerCase() || '';
            const matches = title.includes(searchTerm) || description.includes(searchTerm);
            
            card.style.display = matches ? 'flex' : 'none';
            if (matches) hasResults = true;
        });
        
        // Hide empty categories
        this.gameCategories.forEach(section => {
            const visibleCards = Array.from(section.querySelectorAll('.game-card'))
                .some(card => card.style.display !== 'none');
            section.style.display = visibleCards ? 'block' : 'none';
        });
    }
    
    resetToAll() {
        this.tabs.forEach(t => t.classList.remove('active'));
        document.querySelector('[data-category="all"]').classList.add('active');
        
        this.gameCategories.forEach(section => {
            section.style.display = 'block';
        });
        
        this.gameCards.forEach(card => {
            card.style.display = 'flex';
        });
    }
    
    handlePlayClick(event) {
        const button = event.currentTarget;
        const card = button.closest('.game-card') || button.closest('.featured-game-card');
        const gameName = card?.querySelector('h3')?.textContent || 'Unknown Game';
        
        // Haptic feedback (if supported)
        if (navigator.vibrate) {
            navigator.vibrate(50);
        }
        
        // Show feedback (could be replaced with modal)
        console.log(`[v0] Game started: ${gameName}`);
        this.showNotification(`Starting ${gameName}...`);
    }
    
    showNotification(message) {
        // Create simple toast notification
        const notification = document.createElement('div');
        notification.textContent = message;
        notification.style.cssText = `
            position: fixed;
            bottom: 20px;
            right: 20px;
            background: var(--color-primary);
            color: white;
            padding: 12px 24px;
            border-radius: 8px;
            font-weight: 500;
            animation: slideIn 0.3s ease-out;
            z-index: 9999;
        `;
        
        document.body.appendChild(notification);
        
        setTimeout(() => {
            notification.style.animation = 'fadeOut 0.3s ease-in';
            setTimeout(() => notification.remove(), 300);
        }, 2000);
    }
    
    async updateFeaturedGame() {
        const featuredImage = document.querySelector('.featured-image img');
        const featuredTitle = document.querySelector('.featured-details h3');
        const featuredDescription = document.querySelector('.featured-description');
        
        if (!featuredImage || !featuredTitle || !featuredDescription) return;
        
        // Fade out
        featuredImage.style.opacity = '0';
        featuredTitle.style.opacity = '0';
        featuredDescription.style.opacity = '0';
        
        // Wait for fade out
        await new Promise(resolve => setTimeout(resolve, 300));
        
        // Update content
        const game = this.featuredGames[this.currentFeaturedIndex];
        featuredImage.src = game.image;
        featuredImage.alt = `${game.name} gameplay`;
        featuredTitle.textContent = game.name;
        featuredDescription.textContent = game.description;
        
        // Fade in
        featuredImage.style.opacity = '1';
        featuredTitle.style.opacity = '1';
        featuredDescription.style.opacity = '1';
        
        this.currentFeaturedIndex = (this.currentFeaturedIndex + 1) % this.featuredGames.length;
    }
    
    startFeaturedGameRotation() {
        // Update every 10 seconds
        setInterval(() => this.updateFeaturedGame(), 10000);
    }
}

// Initialize when DOM is ready
document.addEventListener('DOMContentLoaded', () => {
    new GameCollection();
});
