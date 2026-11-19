// Goose-Port-Spiegel von: projects/browser-games-tank-shooter-browser/game.js
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/browser-games-tank-shooter-browser/game.js");
}

// ---- Original-Code (projects/browser-games-tank-shooter-browser/game.js), unveraendert, als Inline-Doku ----
// class TankBlaster {
//     constructor() {
//         this.canvas = document.getElementById('gameCanvas');
//         this.ctx = this.canvas.getContext('2d');
//         this.width = this.canvas.width;
//         this.height = this.canvas.height;
//
//         this.player = {
//             x: this.width / 2,
//             y: this.height - 50,
//             width: 40,
//             height: 40,
//             speed: 5,
//             color: '#e74c3c'
//         };
//
//         this.bullets = [];
//         this.enemies = [];
//         this.score = 0;
//         this.lives = 3;
//         this.gameOver = false;
//
//         this.setupControls();
//     }
//
//     setupControls() {
//         document.addEventListener('keydown', (e) => {
//             switch(e.key) {
//                 case 'ArrowLeft':
//                     this.player.x = Math.max(0, this.player.x - this.player.speed);
//                     break;
//                 case 'ArrowRight':
//                     this.player.x = Math.min(this.width - this.player.width, this.player.x + this.player.speed);
//                     break;
//                 case ' ':
//                     this.shoot();
//                     break;
//             }
//         });
//     }
//
//     shoot() {
//         this.bullets.push({
//             x: this.player.x + this.player.width / 2,
//             y: this.player.y,
//             width: 5,
//             height: 15,
//             speed: 10,
//             color: '#f1c40f'
//         });
//     }
//
//     spawnEnemy() {
//         if (Math.random() < 0.02) {
//             this.enemies.push({
//                 x: Math.random() * (this.width - 30),
//                 y: 0,
//                 width: 30,
//                 height: 30,
//                 speed: Math.random() * 3 + 1,
//                 color: '#2ecc71'
//             });
//         }
//     }
//
//     update() {
//         // Update bullets
//         this.bullets.forEach((bullet, bIndex) => {
//             bullet.y -= bullet.speed;
//             
//             // Remove bullets off screen
//             if (bullet.y < 0) {
//                 this.bullets.splice(bIndex, 1);
//             }
//
//             // Check bullet-enemy collisions
//             this.enemies.forEach((enemy, eIndex) => {
//                 if (this.checkCollision(bullet, enemy)) {
//                     this.bullets.splice(bIndex, 1);
//                     this.enemies.splice(eIndex, 1);
//                     this.score += 10;
//                     document.getElementById('scoreDisplay').textContent = this.score;
//                 }
//             });
//         });
//
//         // Update enemies
//         this.enemies.forEach((enemy, index) => {
//             enemy.y += enemy.speed;
//
//             // Remove enemies off screen or check player collision
//             if (enemy.y > this.height) {
//                 this.enemies.splice(index, 1);
//                 this.lives--;
//                 document.getElementById('livesDisplay').textContent = this.lives;
//             }
//
//             if (this.checkCollision(this.player, enemy)) {
//                 this.lives--;
//                 document.getElementById('livesDisplay').textContent = this.lives;
//                 this.enemies.splice(index, 1);
//             }
//         });
//
//         if (this.lives <= 0) {
//             this.gameOver = true;
//         }
//     }
//
//     checkCollision(rect1, rect2) {
//         return rect1.x < rect2.x + rect2.width &&
//                rect1.x + rect1.width > rect2.x &&
//                rect1.y < rect2.y + rect2.height &&
//                rect1.y + rect1.height > rect2.y;
//     }
//
//     draw() {
//         // Clear canvas
//         this.ctx.clearRect(0, 0, this.width, this.height);
//
//         // Draw player
//         this.ctx.fillStyle = this.player.color;
//         this.ctx.fillRect(this.player.x, this.player.y, this.player.width, this.player.height);
//
//         // Draw bullets
//         this.bullets.forEach(bullet => {
//             this.ctx.fillStyle = bullet.color;
//             this.ctx.fillRect(bullet.x, bullet.y, bullet.width, bullet.height);
//         });
//
//         // Draw enemies
//         this.enemies.forEach(enemy => {
//             this.ctx.fillStyle = enemy.color;
//             this.ctx.fillRect(enemy.x, enemy.y, enemy.width, enemy.height);
//         });
//     }
//
//     gameLoop() {
//         if (!this.gameOver) {
//             this.spawnEnemy();
//             this.update();
//             this.draw();
//             requestAnimationFrame(() => this.gameLoop());
//         } else {
//             this.ctx.fillStyle = 'red';
//             this.ctx.font = '48px Arial';
//             this.ctx.fillText('GAME OVER', this.width/2 - 120, this.height/2);
//         }
//     }
//
//     start() {
//         this.gameLoop();
//     }
// }
//
// // Initialize and start game when page loads
// window.onload = () => {
//     const game = new TankBlaster();
//     game.start();
// };
//
