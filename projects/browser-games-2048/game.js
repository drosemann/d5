class Game2048 {
    constructor(boardSize = 4) {
        this.boardSize = boardSize;
        this.board = [];
        this.score = 0;
        this.gameBoard = document.getElementById('game-board');
        this.scoreDisplay = document.getElementById('score');
        this.initializeBoard();
        this.setupEventListeners();
        this.spawnTile();
        this.spawnTile();
        this.renderBoard();
    }

    initializeBoard() {
        // Create an empty board
        this.board = Array(this.boardSize).fill().map(() => 
            Array(this.boardSize).fill(0)
        );
    }

    setupEventListeners() {
        document.addEventListener('keydown', (e) => {
            switch(e.key) {
                case 'ArrowUp': this.move('up'); break;
                case 'ArrowDown': this.move('down'); break;
                case 'ArrowLeft': this.move('left'); break;
                case 'ArrowRight': this.move('right'); break;
            }
        });
    }

    spawnTile() {
        const emptyCells = [];
        for (let r = 0; r < this.boardSize; r++) {
            for (let c = 0; c < this.boardSize; c++) {
                if (this.board[r][c] === 0) {
                    emptyCells.push({r, c});
                }
            }
        }

        if (emptyCells.length > 0) {
            const {r, c} = emptyCells[Math.floor(Math.random() * emptyCells.length)];
            // 90% chance of 2, 10% chance of 4
            this.board[r][c] = Math.random() < 0.9 ? 2 : 4;
        }
    }

    renderBoard() {
        // Clear existing board
        this.gameBoard.innerHTML = '';

        // Create tiles
        for (let r = 0; r < this.boardSize; r++) {
            for (let c = 0; c < this.boardSize; c++) {
                const tileValue = this.board[r][c];
                const tileElement = document.createElement('div');
                tileElement.classList.add('tile');
                
                if (tileValue !== 0) {
                    tileElement.textContent = tileValue;
                    tileElement.classList.add(`tile-${tileValue}`);
                }

                this.gameBoard.appendChild(tileElement);
            }
        }

        // Update score
        this.scoreDisplay.textContent = this.score;
    }

    move(direction) {
        let moved = false;

        // Rotate board based on direction to simplify logic
        const rotateBoard = (board) => {
            return board[0].map((val, index) => board.map(row => row[index]).reverse());
        };

        const compress = (row) => {
            // Remove zeros
            const filteredRow = row.filter(val => val !== 0);
            
            // Merge tiles
            for (let i = 0; i < filteredRow.length - 1; i++) {
                if (filteredRow[i] === filteredRow[i+1]) {
                    filteredRow[i] *= 2;
                    this.score += filteredRow[i];
                    filteredRow.splice(i+1, 1);
                }
            }

            // Pad with zeros
            while (filteredRow.length < this.boardSize) {
                filteredRow.push(0);
            }

            return filteredRow;
        };

        // Rotate board to handle different directions
        switch(direction) {
            case 'left':
                this.board = this.board.map(compress);
                moved = true;
                break;
            case 'right':
                this.board = this.board.map(row => compress(row.reverse()).reverse());
                moved = true;
                break;
            case 'up':
                this.board = rotateBoard(rotateBoard(rotateBoard(
                    rotateBoard(this.board).map(compress)
                )));
                moved = true;
                break;
            case 'down':
                this.board = rotateBoard(
                    rotateBoard(rotateBoard(
                        rotateBoard(this.board).map(row => compress(row.reverse()).reverse())
                    ))
                );
                moved = true;
                break;
        }

        // Spawn new tile if board changed
        if (moved) {
            this.spawnTile();
            this.renderBoard();
            this.checkGameStatus();
        }
    }

    checkGameStatus() {
        // Check for win condition
        for (let r = 0; r < this.boardSize; r++) {
            for (let c = 0; c < this.boardSize; c++) {
                if (this.board[r][c] === 2048) {
                    alert('Congratulations! You won!');
                    return;
                }
            }
        }

        // Check for lose condition
        const isBoardFull = this.board.every(row => row.every(cell => cell !== 0));
        const canMerge = this.checkIfMergePossible();

        if (isBoardFull && !canMerge) {
            alert('Game Over! No more moves possible.');
        }
    }

    checkIfMergePossible() {
        // Check if any adjacent tiles can be merged
        for (let r = 0; r < this.boardSize; r++) {
            for (let c = 0; c < this.boardSize; c++) {
                // Check right
                if (c < this.boardSize - 1 && 
                    this.board[r][c] === this.board[r][c+1]) {
                    return true;
                }
                // Check down
                if (r < this.boardSize - 1 && 
                    this.board[r][c] === this.board[r+1][c]) {
                    return true;
                }
            }
        }
        return false;
    }
}

// Initialize the game when the page loads
document.addEventListener('DOMContentLoaded', () => {
    new Game2048();
});
