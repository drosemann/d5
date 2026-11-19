class ColorCascade {
    constructor() {
        this.grid = document.getElementById('game-grid');
        this.scoreDisplay = document.getElementById('score');
        this.timerDisplay = document.getElementById('timer');
        this.startBtn = document.getElementById('start-btn');
        
        this.colors = [
            '#FF6B6B', '#4ECDC4', '#45B7D1', 
            '#FDCB6E', '#6C5CE7', '#FF8A5B'
        ];
        
        this.score = 0;
        this.timeLeft = 60;
        this.timer = null;
        
        this.startBtn.addEventListener('click', () => this.startGame());
    }
    
    createGrid() {
        this.grid.innerHTML = '';
        for (let i = 0; i < 25; i++) {
            const block = document.createElement('div');
            block.classList.add('color-block');
            block.style.backgroundColor = this.getRandomColor();
            block.addEventListener('click', () => this.handleBlockClick(block));
            this.grid.appendChild(block);
        }
    }
    
    getRandomColor() {
        return this.colors[Math.floor(Math.random() * this.colors.length)];
    }
    
    handleBlockClick(block) {
        const neighborColors = this.findNeighborColors(block);
        if (neighborColors.length >= 2) {
            this.removeMatchingColors(block, neighborColors);
            this.score += neighborColors.length + 1;
            this.scoreDisplay.textContent = this.score;
            this.refillGrid();
        }
    }
    
    findNeighborColors(block) {
        const blocks = Array.from(this.grid.children);
        const blockIndex = blocks.indexOf(block);
        const neighborIndices = [
            blockIndex - 1, blockIndex + 1,
            blockIndex - 5, blockIndex + 5
        ];
        
        return neighborIndices
            .filter(index => 
                index >= 0 && 
                index < blocks.length && 
                blocks[index].style.backgroundColor === block.style.backgroundColor
            )
            .map(index => blocks[index]);
    }
    
    removeMatchingColors(mainBlock, neighbors) {
        mainBlock.style.backgroundColor = this.getRandomColor();
        neighbors.forEach(neighbor => {
            neighbor.style.backgroundColor = this.getRandomColor();
        });
    }
    
    refillGrid() {
        const blocks = Array.from(this.grid.children);
        blocks.forEach(block => {
            if (!block.style.backgroundColor) {
                block.style.backgroundColor = this.getRandomColor();
            }
        });
    }
    
    startGame() {
        this.score = 0;
        this.timeLeft = 60;
        this.scoreDisplay.textContent = this.score;
        this.timerDisplay.textContent = this.timeLeft;
        
        this.createGrid();
        
        this.timer = setInterval(() => {
            this.timeLeft--;
            this.timerDisplay.textContent = this.timeLeft;
            
            if (this.timeLeft <= 0) {
                this.endGame();
            }
        }, 1000);
        
        this.startBtn.disabled = true;
    }
    
    endGame() {
        clearInterval(this.timer);
        alert(`Game Over! Your score: ${this.score}`);
        this.startBtn.disabled = false;
    }
}

document.addEventListener('DOMContentLoaded', () => {
    new ColorCascade();
});
