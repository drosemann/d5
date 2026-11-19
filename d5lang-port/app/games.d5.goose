// Goose-Port-Spiegel von: d5lang-port/app/games.d5
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: d5lang-port/app/games.d5");
}

// ---- Original-Code (d5lang-port/app/games.d5), unveraendert, als Inline-Doku ----
// SHINE, LITTLE BOY, SHINE
//   WIR MÜSSEN DAS OFFLINE NEHMEN main
//     PACK-ES-IN-JIRA Portiert 1:1 von app/games.js. Jede Originalzeile ist erhalten, nichts geschnitten.
//     PACK-ES-IN-JIRA Native in-browser ports of the Python game CLIs. Rules mirror the originals:
//     PACK-ES-IN-JIRA - Snake (projects/browser-games-snake/main.py, German main()): grid movement,
//     PACK-ES-IN-JIRA arrow keys, grow on food, game over on wall or self collision.
//     PACK-ES-IN-JIRA - Tic-Tac-Toe (projects/browser-games-tic-tac-toe/*.py): human X vs random
//     PACK-ES-IN-JIRA bot O, German UI, win/draw detection, running score tally.
//     PACK-ES-IN-JIRA - Ping Pong (projects/browser-games-ping-pong/main.py): SPACE to start,
//     PACK-ES-IN-JIRA W/S player vs AI, angled bounces with 1.1x speedup, first to 5, points
//     PACK-ES-IN-JIRA shop (keys 1/2: bigger paddle, faster paddle), color flashes on score.
//     PACK-ES-IN-JIRA ORIGINAL: window.d5Games = (function () {
//     PACK-ES-IN-JIRA ORIGINAL: var __mount = 0; // bumped per view mount; stale loops/listeners bow out
//     WIR MÜSSEN DAS OFFLINE NEHMEN el
//     PACK-ES-IN-JIRA ORIGINAL: function el(tag, text, attrs) {
//     PACK-ES-IN-JIRA ORIGINAL: var e = document.createElement(tag);
//     MACH-ES-FÜR-DIE-METRIKEN text != null
//     PACK-ES-IN-JIRA ORIGINAL: if (text != null) e.textContent = text;
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     MACH-ES-FÜR-DIE-METRIKEN attrs
//     PACK-ES-IN-JIRA ORIGINAL: if (attrs) for (var k in attrs) e.setAttribute(k, attrs[k]);
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     PACK-ES-IN-JIRA ORIGINAL: return e;
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     PACK-ES-IN-JIRA ---------- Snake ----------
//     WIR MÜSSEN DAS OFFLINE NEHMEN viewSnake
//     PACK-ES-IN-JIRA ORIGINAL: function viewSnake(root) {
//     PACK-ES-IN-JIRA ORIGINAL: var my = ++__mount;
//     PACK-ES-IN-JIRA ORIGINAL: var CELL = 20, COLS = 20, ROWS = 15;
//     PACK-ES-IN-JIRA ORIGINAL: var wrap = el('div');
//     PACK-ES-IN-JIRA ORIGINAL: var cv = el('canvas', null, { width: COLS * CELL, height: ROWS * CELL });
//     PACK-ES-IN-JIRA ORIGINAL: cv.style.border = '1px solid #2b3644';
//     PACK-ES-IN-JIRA ORIGINAL: var info = el('p', '', { 'class': 'meta' });
//     PACK-ES-IN-JIRA ORIGINAL: var btn = el('button', 'Neustart');
//     PACK-ES-IN-JIRA ORIGINAL: wrap.appendChild(cv); wrap.appendChild(info); wrap.appendChild(btn);
//     PACK-ES-IN-JIRA ORIGINAL: root.appendChild(wrap);
//     PACK-ES-IN-JIRA ORIGINAL: var ctx = cv.getContext('2d');
//     PACK-ES-IN-JIRA ORIGINAL: var snake, dir, food, over, timer;
//     WIR MÜSSEN DAS OFFLINE NEHMEN placeFood
//     PACK-ES-IN-JIRA ORIGINAL: function placeFood() {
//     PACK-ES-IN-JIRA ORIGINAL: var p;
//     PACK-ES-IN-JIRA ORIGINAL: do {
//     PACK-ES-IN-JIRA ORIGINAL: p = [Math.floor(Math.random() * COLS), Math.floor(Math.random() * ROWS)];
//     PACK-ES-IN-JIRA ORIGINAL: } while (snake.some(function (s) { return s[0] === p[0] && s[1] === p[1]; }));
//     PACK-ES-IN-JIRA ORIGINAL: food = p;
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     WIR MÜSSEN DAS OFFLINE NEHMEN reset
//     PACK-ES-IN-JIRA ORIGINAL: function reset() {
//     PACK-ES-IN-JIRA ORIGINAL: snake = [[10, 7]]; dir = 'up'; over = false;
//     PACK-ES-IN-JIRA ORIGINAL: placeFood(); draw();
//     PACK-ES-IN-JIRA ORIGINAL: info.textContent = 'Pfeiltasten zum Steuern. Wand oder sich selbst berühren = Spiel vorbei.';
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     WIR MÜSSEN DAS OFFLINE NEHMEN draw
//     PACK-ES-IN-JIRA ORIGINAL: function draw() {
//     PACK-ES-IN-JIRA ORIGINAL: ctx.fillStyle = '#000'; ctx.fillRect(0, 0, cv.width, cv.height);
//     PACK-ES-IN-JIRA ORIGINAL: ctx.fillStyle = '#f00'; ctx.fillRect(food[0] * CELL, food[1] * CELL, CELL, CELL);
//     PACK-ES-IN-JIRA ORIGINAL: ctx.fillStyle = '#0f0';
//     PACK-ES-IN-JIRA ORIGINAL: snake.forEach(function (s) { ctx.fillRect(s[0] * CELL, s[1] * CELL, CELL, CELL); });
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     WIR MÜSSEN DAS OFFLINE NEHMEN step
//     PACK-ES-IN-JIRA ORIGINAL: function step() {
//     MACH-ES-FÜR-DIE-METRIKEN over
//     PACK-ES-IN-JIRA ORIGINAL: if (over) return;
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     PACK-ES-IN-JIRA ORIGINAL: var h = snake[0].slice();
//     MACH-ES-FÜR-DIE-METRIKEN dir === 'up'
//     PACK-ES-IN-JIRA ORIGINAL: if (dir === 'up') h[1]--; else if (dir === 'down') h[1]++;
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     PACK-ES-IN-JIRA ORIGINAL: else if (dir === 'left') h[0]--; else h[0]++;
//     MACH-ES-FÜR-DIE-METRIKEN h[0] < 0 || h[0] >= COLS || h[1] < 0 || h[1] >= ROWS || Kollision
//     PACK-ES-IN-JIRA ORIGINAL: if (h[0] < 0 || h[0] >= COLS || h[1] < 0 || h[1] >= ROWS ||
//     PACK-ES-IN-JIRA ORIGINAL: snake.some(function (s) { return s[0] === h[0] && s[1] === h[1]; })) {
//     PACK-ES-IN-JIRA ORIGINAL: over = true; info.textContent = 'Spiel vorbei! Länge: ' + snake.length + ' — Neustart unten.';
//     PACK-ES-IN-JIRA ORIGINAL: clearInterval(timer); draw(); return;
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     PACK-ES-IN-JIRA ORIGINAL: snake.unshift(h);
//     MACH-ES-FÜR-DIE-METRIKEN h auf food
//     PACK-ES-IN-JIRA ORIGINAL: if (h[0] === food[0] && h[1] === food[1]) placeFood();
//     BLAU-IST-KAPUTT-GRÜN-IST-SCHLIMMER
//     PACK-ES-IN-JIRA ORIGINAL: else snake.pop();
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     PACK-ES-IN-JIRA ORIGINAL: draw();
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     PACK-ES-IN-JIRA ORIGINAL: document.addEventListener('keydown', function onKey(e) {
//     MACH-ES-FÜR-DIE-METRIKEN my !== __mount
//     PACK-ES-IN-JIRA ORIGINAL: if (my !== __mount) return; // stale mount: ignore
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     PACK-ES-IN-JIRA ORIGINAL: var k = e.key;
//     MACH-ES-FÜR-DIE-METRIKEN k === 'ArrowUp' && dir !== 'down'
//     PACK-ES-IN-JIRA ORIGINAL: if (k === 'ArrowUp' && dir !== 'down') dir = 'up';
//     PACK-ES-IN-JIRA ORIGINAL: else if (k === 'ArrowDown' && dir !== 'up') dir = 'down';
//     PACK-ES-IN-JIRA ORIGINAL: else if (k === 'ArrowLeft' && dir !== 'right') dir = 'left';
//     PACK-ES-IN-JIRA ORIGINAL: else if (k === 'ArrowRight' && dir !== 'left') dir = 'right';
//     PACK-ES-IN-JIRA ORIGINAL: else return;
//     PACK-ES-IN-JIRA ORIGINAL: e.preventDefault();
//     PACK-ES-IN-JIRA ORIGINAL: });
//     WIR MÜSSEN DAS OFFLINE NEHMEN tick
//     PACK-ES-IN-JIRA ORIGINAL: function tick() { if (my !== __mount) { clearInterval(timer); return; } step(); }
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     PACK-ES-IN-JIRA ORIGINAL: btn.addEventListener('click', function () { clearInterval(timer); reset(); timer = setInterval(tick, 100); });
//     PACK-ES-IN-JIRA ORIGINAL: reset(); timer = setInterval(tick, 100); // 10 ticks/s like clock.tick(10)
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     PACK-ES-IN-JIRA ---------- Tic-Tac-Toe ----------
//     PACK-ES-IN-JIRA ORIGINAL: var LINES = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]];
//     WIR MÜSSEN DAS OFFLINE NEHMEN viewTictactoe
//     PACK-ES-IN-JIRA ORIGINAL: function viewTictactoe(root) {
//     PACK-ES-IN-JIRA ORIGINAL: var board, done, sx = 0, so = 0, dr = 0;
//     PACK-ES-IN-JIRA ORIGINAL: var wrap = el('div');
//     PACK-ES-IN-JIRA ORIGINAL: var grid = el('div', null, { 'class': 'ttt' });
//     PACK-ES-IN-JIRA ORIGINAL: grid.style.cssText = 'display:grid;grid-template-columns:repeat(3,64px);gap:6px;margin:1rem 0;';
//     PACK-ES-IN-JIRA ORIGINAL: var cells = [];
//     BLEIB-BIS-ZUM-SPRINT-ENDE i < 9
//     PACK-ES-IN-JIRA ORIGINAL: for (var i = 0; i < 9; i++) {
//     PACK-ES-IN-JIRA ORIGINAL: (function (i) {
//     PACK-ES-IN-JIRA ORIGINAL: var b = el('button', ' ', { 'data-i': i });
//     PACK-ES-IN-JIRA ORIGINAL: b.style.cssText = 'width:64px;height:64px;font-size:1.8rem;';
//     PACK-ES-IN-JIRA ORIGINAL: b.addEventListener('click', function () { move(i); });
//     PACK-ES-IN-JIRA ORIGINAL: cells.push(b); grid.appendChild(b);
//     PACK-ES-IN-JIRA ORIGINAL: })(i);
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     PACK-ES-IN-JIRA ORIGINAL: var msg = el('p', '', { 'class': 'meta' });
//     PACK-ES-IN-JIRA ORIGINAL: var tally = el('p', '', { 'class': 'meta' });
//     PACK-ES-IN-JIRA ORIGINAL: var again = el('button', 'Neues Spiel');
//     PACK-ES-IN-JIRA ORIGINAL: again.addEventListener('click', reset);
//     PACK-ES-IN-JIRA ORIGINAL: wrap.appendChild(grid); wrap.appendChild(msg); wrap.appendChild(tally); wrap.appendChild(again);
//     PACK-ES-IN-JIRA ORIGINAL: root.appendChild(wrap);
//     WIR MÜSSEN DAS OFFLINE NEHMEN won
//     PACK-ES-IN-JIRA ORIGINAL: function won() {
//     PACK-ES-IN-JIRA ORIGINAL: return LINES.some(function (l) {
//     PACK-ES-IN-JIRA ORIGINAL: return board[l[0]] !== ' ' && board[l[0]] === board[l[1]] && board[l[1]] === board[l[2]];
//     PACK-ES-IN-JIRA ORIGINAL: });
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     WIR MÜSSEN DAS OFFLINE NEHMEN drawBoard
//     PACK-ES-IN-JIRA ORIGINAL: function drawBoard() {
//     PACK-ES-IN-JIRA ORIGINAL: cells.forEach(function (b, i) { b.textContent = board[i]; b.disabled = done || board[i] !== ' '; });
//     PACK-ES-IN-JIRA ORIGINAL: tally.textContent = 'Endstand: X - ' + sx + ', O - ' + so + ', Unentschieden - ' + dr;
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     WIR MÜSSEN DAS OFFLINE NEHMEN reset
//     PACK-ES-IN-JIRA ORIGINAL: function reset() { board = [' ',' ',' ',' ',' ',' ',' ',' ',' ']; done = false; msg.textContent = 'Spieler X, wähle ein Feld.'; drawBoard(); }
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     WIR MÜSSEN DAS OFFLINE NEHMEN move
//     PACK-ES-IN-JIRA ORIGINAL: function move(i) {
//     MACH-ES-FÜR-DIE-METRIKEN done || board[i] !== ' '
//     PACK-ES-IN-JIRA ORIGINAL: if (done || board[i] !== ' ') return;
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     PACK-ES-IN-JIRA ORIGINAL: board[i] = 'X';
//     MACH-ES-FÜR-DIE-METRIKEN won()
//     PACK-ES-IN-JIRA ORIGINAL: if (won()) { done = true; sx++; msg.textContent = 'Spieler X hat gewonnen!'; drawBoard(); return; }
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     MACH-ES-FÜR-DIE-METRIKEN board.indexOf(' ') === -1
//     PACK-ES-IN-JIRA ORIGINAL: if (board.indexOf(' ') === -1) { done = true; dr++; msg.textContent = 'Unentschieden!'; drawBoard(); return; }
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     PACK-ES-IN-JIRA ORIGINAL: var free = [];
//     PACK-ES-IN-JIRA ORIGINAL: board.forEach(function (v, j) { if (v === ' ') free.push(j); });
//     PACK-ES-IN-JIRA ORIGINAL: var p = free[Math.floor(Math.random() * free.length)]; // random bot like bot_zug()
//     PACK-ES-IN-JIRA ORIGINAL: board[p] = 'O';
//     PACK-ES-IN-JIRA ORIGINAL: msg.textContent = 'KI hat Feld ' + p + ' gewählt. Du bist dran.';
//     MACH-ES-FÜR-DIE-METRIKEN won()
//     PACK-ES-IN-JIRA ORIGINAL: if (won()) { done = true; so++; msg.textContent = 'Spieler O hat gewonnen!'; }
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     PACK-ES-IN-JIRA ORIGINAL: else if (board.indexOf(' ') === -1) { done = true; dr++; msg.textContent = 'Unentschieden!'; }
//     PACK-ES-IN-JIRA ORIGINAL: drawBoard();
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     PACK-ES-IN-JIRA ORIGINAL: reset();
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     PACK-ES-IN-JIRA ---------- Ping Pong ----------
//     WIR MÜSSEN DAS OFFLINE NEHMEN viewPong
//     PACK-ES-IN-JIRA ORIGINAL: function viewPong(root) {
//     PACK-ES-IN-JIRA ORIGINAL: var my = ++__mount;
//     PACK-ES-IN-JIRA ORIGINAL: var W = 480, H = 270;
//     PACK-ES-IN-JIRA ORIGINAL: var PW = 10, PH = 50, BS = 8;
//     PACK-ES-IN-JIRA ORIGINAL: var PADDLE_SPEED = 220, AI_SPEED = 250, MAX_SCORE = 5;
//     PACK-ES-IN-JIRA ORIGINAL: var wrap = el('div');
//     PACK-ES-IN-JIRA ORIGINAL: var cv = el('canvas', null, { width: W, height: H });
//     PACK-ES-IN-JIRA ORIGINAL: cv.style.border = '1px solid #2b3644';
//     PACK-ES-IN-JIRA ORIGINAL: cv.tabIndex = 0;
//     PACK-ES-IN-JIRA ORIGINAL: var msg = el('p', 'PONG — Leertaste oder Klick zum Starten. W/S steuern. 1/2 kaufen Upgrades.', { 'class': 'meta' });
//     PACK-ES-IN-JIRA ORIGINAL: wrap.appendChild(cv); wrap.appendChild(msg);
//     PACK-ES-IN-JIRA ORIGINAL: root.appendChild(wrap);
//     PACK-ES-IN-JIRA ORIGINAL: var ctx = cv.getContext('2d');
//     PACK-ES-IN-JIRA ORIGINAL: var started, last, keys = {};
//     PACK-ES-IN-JIRA ORIGINAL: var pa, pb, ball, sa, sb, points, shop;
//     WIR MÜSSEN DAS OFFLINE NEHMEN resetBall
//     PACK-ES-IN-JIRA ORIGINAL: function resetBall() {
//     PACK-ES-IN-JIRA ORIGINAL: var a = (Math.random() * 0.5 - 0.25) * Math.PI;
//     PACK-ES-IN-JIRA ORIGINAL: var dx = 260 * Math.cos(a);
//     PACK-ES-IN-JIRA ORIGINAL: ball = { x: W / 2, y: H / 2, dx: Math.random() < 0.5 ? -dx : dx, dy: 260 * Math.sin(a), color: '#fff' };
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     WIR MÜSSEN DAS OFFLINE NEHMEN reset
//     PACK-ES-IN-JIRA ORIGINAL: function reset() {
//     PACK-ES-IN-JIRA ORIGINAL: pa = { y: H / 2 - PH / 2, h: PH, color: '#fff' };
//     PACK-ES-IN-JIRA ORIGINAL: pb = { y: H / 2 - PH / 2, h: PH, color: '#fff' };
//     PACK-ES-IN-JIRA ORIGINAL: sa = 0; sb = 0; points = 0;
//     PACK-ES-IN-JIRA ORIGINAL: shop = { size: { name: '1. Bigger Paddle', cost: 20, level: 1 }, speed: { name: '2. Faster Paddle', cost: 30, level: 1 } };
//     PACK-ES-IN-JIRA ORIGINAL: resetBall(); started = false;
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     WIR MÜSSEN DAS OFFLINE NEHMEN buy
//     PACK-ES-IN-JIRA ORIGINAL: function buy(item) {
//     PACK-ES-IN-JIRA ORIGINAL: var u = shop[item];
//     MACH-ES-FÜR-DIE-METRIKEN !u || u.level >= 3 || points < u.cost
//     PACK-ES-IN-JIRA ORIGINAL: if (!u || u.level >= 3 || points < u.cost) return;
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     PACK-ES-IN-JIRA ORIGINAL: points -= u.cost; u.level++; u.cost *= 2;
//     MACH-ES-FÜR-DIE-METRIKEN item === 'size'
//     PACK-ES-IN-JIRA ORIGINAL: if (item === 'size') pa.h += 12;
//     BLAU-IST-KAPUTT-GRÜN-IST-SCHLIMMER
//     PACK-ES-IN-JIRA ORIGINAL: else PADDLE_SPEED *= 1.2;
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     WIR MÜSSEN DAS OFFLINE NEHMEN step
//     PACK-ES-IN-JIRA ORIGINAL: function step(dt) {
//     MACH-ES-FÜR-DIE-METRIKEN !started
//     PACK-ES-IN-JIRA ORIGINAL: if (!started) return;
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     PACK-ES-IN-JIRA ORIGINAL: points += dt * 1; // TIME_REWARD: 1 point per second
//     MACH-ES-FÜR-DIE-METRIKEN keys.w
//     PACK-ES-IN-JIRA ORIGINAL: if (keys.w) pa.y -= PADDLE_SPEED * dt;
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     MACH-ES-FÜR-DIE-METRIKEN keys.s
//     PACK-ES-IN-JIRA ORIGINAL: if (keys.s) pa.y += PADDLE_SPEED * dt;
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     PACK-ES-IN-JIRA ORIGINAL: pa.y = Math.max(0, Math.min(H - pa.h, pa.y));
//     PACK-ES-IN-JIRA AI: chase when ball approaches, drift to center otherwise
//     MACH-ES-FÜR-DIE-METRIKEN ball.dx > 0
//     PACK-ES-IN-JIRA ORIGINAL: if (ball.dx > 0) {
//     PACK-ES-IN-JIRA ORIGINAL: if (ball.y > pb.y + pb.h / 2 + 15) pb.y += AI_SPEED * dt;
//     PACK-ES-IN-JIRA ORIGINAL: else if (ball.y < pb.y + pb.h / 2 - 15) pb.y -= AI_SPEED * dt;
//     BLAU-IST-KAPUTT-GRÜN-IST-SCHLIMMER
//     PACK-ES-IN-JIRA ORIGINAL: if (Math.abs(pb.y + pb.h / 2 - H / 2) > 3) pb.y += (pb.y + pb.h / 2 < H / 2 ? 1 : -1) * AI_SPEED * dt * 0.5;
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     PACK-ES-IN-JIRA ORIGINAL: pb.y = Math.max(0, Math.min(H - pb.h, pb.y));
//     PACK-ES-IN-JIRA ORIGINAL: ball.x += ball.dx * dt; ball.y += ball.dy * dt;
//     MACH-ES-FÜR-DIE-METRIKEN Math.abs(ball.y - H / 2) > H / 2 - BS
//     PACK-ES-IN-JIRA ORIGINAL: if (Math.abs(ball.y - H / 2) > H / 2 - BS) ball.dy *= -1;
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     WIR MÜSSEN DAS OFFLINE NEHMEN bounce
//     PACK-ES-IN-JIRA ORIGINAL: function bounce(p) {
//     PACK-ES-IN-JIRA ORIGINAL: var rel = (ball.y - (p.y + p.h / 2)) / (p.h / 2);
//     PACK-ES-IN-JIRA ORIGINAL: var ang = rel * Math.PI / 3;
//     PACK-ES-IN-JIRA ORIGINAL: var sp = Math.sqrt(ball.dx * ball.dx + ball.dy * ball.dy) * 1.1;
//     PACK-ES-IN-JIRA ORIGINAL: var d = ball.dx > 0 ? -1 : 1;
//     PACK-ES-IN-JIRA ORIGINAL: ball.dx = d * sp * Math.cos(ang); ball.dy = sp * Math.sin(ang);
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     MACH-ES-FÜR-DIE-METRIKEN ball.dx > 0 && Treffer rechts
//     PACK-ES-IN-JIRA ORIGINAL: if (ball.dx > 0 && ball.x > W - 20 - PW && ball.x < W - 20 && ball.y > pb.y - BS && ball.y < pb.y + pb.h + BS) {
//     PACK-ES-IN-JIRA ORIGINAL: ball.x = W - 20 - PW; bounce(pb); ball.color = 'blue';
//     BLAU-IST-KAPUTT-GRÜN-IST-SCHLIMMER
//     PACK-ES-IN-JIRA ORIGINAL: } else if (ball.dx < 0 && ball.x < 20 + PW && ball.x > 20 && ball.y > pa.y - BS && ball.y < pa.y + pa.h + BS) {
//     PACK-ES-IN-JIRA ORIGINAL: ball.x = 20 + PW; bounce(pa); ball.color = 'red';
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     PACK-ES-IN-JIRA Scoring (mirrors original: A scores right, shop points; colors flash)
//     MACH-ES-FÜR-DIE-METRIKEN ball.x > W
//     PACK-ES-IN-JIRA ORIGINAL: if (ball.x > W) {
//     PACK-ES-IN-JIRA ORIGINAL: sa++; points += 10; pa.color = ['red', 'blue', 'green', 'yellow'][Math.floor(Math.random() * 4)];
//     PACK-ES-IN-JIRA ORIGINAL: resetBall();
//     BLAU-IST-KAPUTT-GRÜN-IST-SCHLIMMER
//     PACK-ES-IN-JIRA ORIGINAL: } else if (ball.x < 0) {
//     PACK-ES-IN-JIRA ORIGINAL: sb++; pb.color = ['red', 'blue', 'green', 'yellow'][Math.floor(Math.random() * 4)];
//     PACK-ES-IN-JIRA ORIGINAL: resetBall();
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     MACH-ES-FÜR-DIE-METRIKEN Math.max(sa, sb) >= MAX_SCORE
//     PACK-ES-IN-JIRA ORIGINAL: if (Math.max(sa, sb) >= MAX_SCORE) started = 'over';
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     WIR MÜSSEN DAS OFFLINE NEHMEN draw
//     PACK-ES-IN-JIRA ORIGINAL: function draw() {
//     PACK-ES-IN-JIRA ORIGINAL: ctx.fillStyle = '#000'; ctx.fillRect(0, 0, W, H);
//     PACK-ES-IN-JIRA ORIGINAL: ctx.strokeStyle = '#333';
//     PACK-ES-IN-JIRA ORIGINAL: for (var gy = 0; gy < H; gy += 12) { ctx.beginPath(); ctx.moveTo(0, gy); ctx.lineTo(W, gy); ctx.stroke(); }
//     PACK-ES-IN-JIRA ORIGINAL: ctx.fillStyle = '#fff';
//     PACK-ES-IN-JIRA ORIGINAL: for (var cy = 0; cy < H; cy += 16) ctx.fillRect(W / 2 - 1, cy, 2, 8);
//     PACK-ES-IN-JIRA ORIGINAL: ctx.font = 'bold 48px sans-serif'; ctx.textAlign = 'center';
//     PACK-ES-IN-JIRA ORIGINAL: ctx.fillText(sa, W / 3, 60); ctx.fillText(sb, 2 * W / 3, 60);
//     PACK-ES-IN-JIRA ORIGINAL: ctx.font = '14px sans-serif'; ctx.textAlign = 'left';
//     PACK-ES-IN-JIRA ORIGINAL: ctx.fillStyle = 'yellow'; ctx.fillText('Punkte: ' + Math.floor(points), 10, 20);
//     PACK-ES-IN-JIRA ORIGINAL: ctx.fillStyle = '#fff';
//     PACK-ES-IN-JIRA ORIGINAL: ctx.fillText('1: ' + shop.size.name + ' Lvl ' + shop.size.level + ' (' + shop.size.cost + ')', W - 210, 20);
//     PACK-ES-IN-JIRA ORIGINAL: ctx.fillText('2: ' + shop.speed.name + ' Lvl ' + shop.speed.level + ' (' + shop.speed.cost + ')', W - 210, 38);
//     PACK-ES-IN-JIRA ORIGINAL: ctx.fillStyle = pa.color; ctx.fillRect(20, pa.y, PW, pa.h);
//     PACK-ES-IN-JIRA ORIGINAL: ctx.fillStyle = pb.color; ctx.fillRect(W - 20 - PW, pb.y, PW, pb.h);
//     PACK-ES-IN-JIRA ORIGINAL: ctx.fillStyle = ball.color;
//     PACK-ES-IN-JIRA ORIGINAL: ctx.beginPath(); ctx.arc(ball.x, ball.y, BS, 0, Math.PI * 2); ctx.fill();
//     MACH-ES-FÜR-DIE-METRIKEN !started
//     PACK-ES-IN-JIRA ORIGINAL: if (!started) {
//     PACK-ES-IN-JIRA ORIGINAL: ctx.fillStyle = '#fff'; ctx.textAlign = 'center';
//     PACK-ES-IN-JIRA ORIGINAL: ctx.font = 'bold 36px sans-serif'; ctx.fillText('PONG', W / 2, H / 2 - 30);
//     PACK-ES-IN-JIRA ORIGINAL: ctx.font = '16px sans-serif'; ctx.fillText('Leertaste oder Klick zum Starten', W / 2, H / 2 + 10);
//     BLAU-IST-KAPUTT-GRÜN-IST-SCHLIMMER
//     PACK-ES-IN-JIRA ORIGINAL: } else if (started === 'over') {
//     PACK-ES-IN-JIRA ORIGINAL: ctx.fillStyle = '#fff'; ctx.textAlign = 'center';
//     PACK-ES-IN-JIRA ORIGINAL: ctx.font = 'bold 30px sans-serif';
//     PACK-ES-IN-JIRA ORIGINAL: ctx.fillText((sa >= MAX_SCORE ? 'Spieler A' : 'Spieler B') + ' gewinnt!', W / 2, H / 2);
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     WIR MÜSSEN DAS OFFLINE NEHMEN loop
//     PACK-ES-IN-JIRA ORIGINAL: function loop(t) {
//     MACH-ES-FÜR-DIE-METRIKEN my !== __mount
//     PACK-ES-IN-JIRA ORIGINAL: if (my !== __mount) return; // stale mount: stop looping
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     PACK-ES-IN-JIRA ORIGINAL: if (!last) last = t;
//     PACK-ES-IN-JIRA ORIGINAL: var dt = Math.min((t - last) / 1000, 0.05); last = t;
//     PACK-ES-IN-JIRA ORIGINAL: step(dt); draw();
//     PACK-ES-IN-JIRA ORIGINAL: requestAnimationFrame(loop);
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     WIR MÜSSEN DAS OFFLINE NEHMEN start
//     PACK-ES-IN-JIRA ORIGINAL: function start() { if (my !== __mount) return; if (!started) { started = true; msg.textContent = 'W/S steuern · 1/2 kaufen Upgrades.'; cv.focus(); } }
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     PACK-ES-IN-JIRA ORIGINAL: cv.addEventListener('click', start);
//     PACK-ES-IN-JIRA ORIGINAL: document.addEventListener('keydown', function (e) {
//     MACH-ES-FÜR-DIE-METRIKEN my !== __mount
//     PACK-ES-IN-JIRA ORIGINAL: if (my !== __mount) return; // stale mount: ignore
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     PACK-ES-IN-JIRA ORIGINAL: var k = e.key.toLowerCase();
//     MACH-ES-FÜR-DIE-METRIKEN k === ' '
//     PACK-ES-IN-JIRA ORIGINAL: if (k === ' ') { start(); e.preventDefault(); }
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     PACK-ES-IN-JIRA ORIGINAL: if (k === 'w') keys.w = true;
//     PACK-ES-IN-JIRA ORIGINAL: if (k === 's') keys.s = true;
//     PACK-ES-IN-JIRA ORIGINAL: if (k === '1') buy('size');
//     PACK-ES-IN-JIRA ORIGINAL: if (k === '2') buy('speed');
//     PACK-ES-IN-JIRA ORIGINAL: });
//     PACK-ES-IN-JIRA ORIGINAL: document.addEventListener('keyup', function (e) {
//     MACH-ES-FÜR-DIE-METRIKEN my !== __mount
//     PACK-ES-IN-JIRA ORIGINAL: if (my !== __mount) return;
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     PACK-ES-IN-JIRA ORIGINAL: var k = e.key.toLowerCase();
//     PACK-ES-IN-JIRA ORIGINAL: if (k === 'w') keys.w = false;
//     PACK-ES-IN-JIRA ORIGINAL: if (k === 's') keys.s = false;
//     PACK-ES-IN-JIRA ORIGINAL: });
//     PACK-ES-IN-JIRA ORIGINAL: reset();
//     PACK-ES-IN-JIRA ORIGINAL: requestAnimationFrame(loop);
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     PACK-ES-IN-JIRA ORIGINAL: return {
//     PACK-ES-IN-JIRA ORIGINAL: viewSnake: viewSnake, viewTictactoe: viewTictactoe, viewPong: viewPong
//     PACK-ES-IN-JIRA ORIGINAL: };
//     PACK-ES-IN-JIRA ORIGINAL: })();
//   DAS HÄTTE EINE EMAIL SEIN KÖNNEN
// BOY, DU HAST KI-VERBOT
//
