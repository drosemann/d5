const canvas = document.getElementById('gameCanvas');
const ctx = canvas.getContext('2d');
canvas.width = 800;
canvas.height = 600;

const player = {
    width: 50,
    height: 50,
    x: canvas.width / 2 - 25,
    y: canvas.height - 100,
    speed: 10,
    dx: 0,
    dy: 0
};

const bullet = {
    width: 10,
    height: 10,
    x: 0,
    y: 0,
    speed: 20,
    active: false
};

const enemies = [];
const enemySize = 50;
let score = 0;

function drawPlayer() {
    ctx.fillStyle = 'red';
    ctx.fillRect(player.x, player.y, player.width, player.height);
}

function drawBullet() {
    if (bullet.active) {
        ctx.fillStyle = 'red';
        ctx.fillRect(bullet.x, bullet.y, bullet.width, bullet.height);
    }
}

function drawEnemies() {
    ctx.fillStyle = 'blue';
    enemies.forEach(enemy => {
        ctx.fillRect(enemy.x, enemy.y, enemySize, enemySize);
    });
}

function update() {
    ctx.clearRect(0, 0, canvas.width, canvas.height);

    player.x += player.dx;
    player.y += player.dy;

    if (bullet.active) {
        bullet.y -= bullet.speed;
        if (bullet.y < 0) {
            bullet.active = false;
        }
    }

    enemies.forEach((enemy, index) => {
        enemy.y += 5;
        if (enemy.y > canvas.height) {
            enemies.splice(index, 1);
            score++;
        }
    });

    if (Math.random() < 0.02) {
        const x = Math.random() * (canvas.width - enemySize);
        enemies.push({ x, y: 0 });
    }

    drawPlayer();
    drawBullet();
    drawEnemies();

    requestAnimationFrame(update);
}

function movePlayer(e) {
    if (e.key === 'ArrowLeft') {
        player.dx = -player.speed;
    } else if (e.key === 'ArrowRight') {
        player.dx = player.speed;
    } else if (e.key === 'ArrowUp') {
        player.dy = -player.speed;
    } else if (e.key === 'ArrowDown') {
        player.dy = player.speed;
    } else if (e.key === ' ') {
        if (!bullet.active) {
            bullet.x = player.x + player.width / 2 - bullet.width / 2;
            bullet.y = player.y;
            bullet.active = true;
        }
    }
}

function stopPlayer(e) {
    if (['ArrowLeft', 'ArrowRight'].includes(e.key)) {
        player.dx = 0;
    }
    if (['ArrowUp', 'ArrowDown'].includes(e.key)) {
        player.dy = 0;
    }
}

document.addEventListener('keydown', movePlayer);
document.addEventListener('keyup', stopPlayer);

update();
