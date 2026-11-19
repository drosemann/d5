// Native in-browser ports of the Python game CLIs. Rules mirror the originals:
// - Snake (projects/browser-games-snake/main.py, German main()): grid movement,
//   arrow keys, grow on food, game over on wall or self collision.
// - Tic-Tac-Toe (projects/browser-games-tic-tac-toe/*.py): human X vs random
//   bot O, German UI, win/draw detection, running score tally.
// - Ping Pong (projects/browser-games-ping-pong/main.py): SPACE to start,
//   W/S player vs AI, angled bounces with 1.1x speedup, first to 5, points
//   shop (keys 1/2: bigger paddle, faster paddle), color flashes on score.
window.d5Games = (function () {
  var __mount = 0; // bumped per view mount; stale loops/listeners bow out
  function el(tag, text, attrs) {
    var e = document.createElement(tag);
    if (text != null) e.textContent = text;
    if (attrs) for (var k in attrs) e.setAttribute(k, attrs[k]);
    return e;
  }

  // ---------- Snake ----------
  function viewSnake(root) {
    var my = ++__mount;
    var CELL = 20, COLS = 20, ROWS = 15;
    var wrap = el('div');
    var cv = el('canvas', null, { width: COLS * CELL, height: ROWS * CELL });
    cv.style.border = '1px solid #2b3644';
    var info = el('p', '', { 'class': 'meta' });
    var btn = el('button', 'Neustart');
    wrap.appendChild(cv); wrap.appendChild(info); wrap.appendChild(btn);
    root.appendChild(wrap);
    var ctx = cv.getContext('2d');
    var snake, dir, food, over, timer;
    function placeFood() {
      var p;
      do {
        p = [Math.floor(Math.random() * COLS), Math.floor(Math.random() * ROWS)];
      } while (snake.some(function (s) { return s[0] === p[0] && s[1] === p[1]; }));
      food = p;
    }
    function reset() {
      snake = [[10, 7]]; dir = 'up'; over = false;
      placeFood(); draw();
      info.textContent = 'Pfeiltasten zum Steuern. Wand oder sich selbst berühren = Spiel vorbei.';
    }
    function draw() {
      ctx.fillStyle = '#000'; ctx.fillRect(0, 0, cv.width, cv.height);
      ctx.fillStyle = '#f00'; ctx.fillRect(food[0] * CELL, food[1] * CELL, CELL, CELL);
      ctx.fillStyle = '#0f0';
      snake.forEach(function (s) { ctx.fillRect(s[0] * CELL, s[1] * CELL, CELL, CELL); });
    }
    function step() {
      if (over) return;
      var h = snake[0].slice();
      if (dir === 'up') h[1]--; else if (dir === 'down') h[1]++;
      else if (dir === 'left') h[0]--; else h[0]++;
      if (h[0] < 0 || h[0] >= COLS || h[1] < 0 || h[1] >= ROWS ||
          snake.some(function (s) { return s[0] === h[0] && s[1] === h[1]; })) {
        over = true; info.textContent = 'Spiel vorbei! Länge: ' + snake.length + ' — Neustart unten.';
        clearInterval(timer); draw(); return;
      }
      snake.unshift(h);
      if (h[0] === food[0] && h[1] === food[1]) placeFood();
      else snake.pop();
      draw();
    }
    document.addEventListener('keydown', function onKey(e) {
      if (my !== __mount) return; // stale mount: ignore
      var k = e.key;
      if (k === 'ArrowUp' && dir !== 'down') dir = 'up';
      else if (k === 'ArrowDown' && dir !== 'up') dir = 'down';
      else if (k === 'ArrowLeft' && dir !== 'right') dir = 'left';
      else if (k === 'ArrowRight' && dir !== 'left') dir = 'right';
      else return;
      e.preventDefault();
    });
    function tick() { if (my !== __mount) { clearInterval(timer); return; } step(); }
    btn.addEventListener('click', function () { clearInterval(timer); reset(); timer = setInterval(tick, 100); });
    reset(); timer = setInterval(tick, 100); // 10 ticks/s like clock.tick(10)
  }

  // ---------- Tic-Tac-Toe ----------
  var LINES = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]];
  function viewTictactoe(root) {
    var board, done, sx = 0, so = 0, dr = 0;
    var wrap = el('div');
    var grid = el('div', null, { 'class': 'ttt' });
    grid.style.cssText = 'display:grid;grid-template-columns:repeat(3,64px);gap:6px;margin:1rem 0;';
    var cells = [];
    for (var i = 0; i < 9; i++) {
      (function (i) {
        var b = el('button', ' ', { 'data-i': i });
        b.style.cssText = 'width:64px;height:64px;font-size:1.8rem;';
        b.addEventListener('click', function () { move(i); });
        cells.push(b); grid.appendChild(b);
      })(i);
    }
    var msg = el('p', '', { 'class': 'meta' });
    var tally = el('p', '', { 'class': 'meta' });
    var again = el('button', 'Neues Spiel');
    again.addEventListener('click', reset);
    wrap.appendChild(grid); wrap.appendChild(msg); wrap.appendChild(tally); wrap.appendChild(again);
    root.appendChild(wrap);
    function won() {
      return LINES.some(function (l) {
        return board[l[0]] !== ' ' && board[l[0]] === board[l[1]] && board[l[1]] === board[l[2]];
      });
    }
    function drawBoard() {
      cells.forEach(function (b, i) { b.textContent = board[i]; b.disabled = done || board[i] !== ' '; });
      tally.textContent = 'Endstand: X - ' + sx + ', O - ' + so + ', Unentschieden - ' + dr;
    }
    function reset() { board = [' ',' ',' ',' ',' ',' ',' ',' ',' ']; done = false; msg.textContent = 'Spieler X, wähle ein Feld.'; drawBoard(); }
    function move(i) {
      if (done || board[i] !== ' ') return;
      board[i] = 'X';
      if (won()) { done = true; sx++; msg.textContent = 'Spieler X hat gewonnen!'; drawBoard(); return; }
      if (board.indexOf(' ') === -1) { done = true; dr++; msg.textContent = 'Unentschieden!'; drawBoard(); return; }
      var free = [];
      board.forEach(function (v, j) { if (v === ' ') free.push(j); });
      var p = free[Math.floor(Math.random() * free.length)]; // random bot like bot_zug()
      board[p] = 'O';
      msg.textContent = 'KI hat Feld ' + p + ' gewählt. Du bist dran.';
      if (won()) { done = true; so++; msg.textContent = 'Spieler O hat gewonnen!'; }
      else if (board.indexOf(' ') === -1) { done = true; dr++; msg.textContent = 'Unentschieden!'; }
      drawBoard();
    }
    reset();
  }

  // ---------- Ping Pong ----------
  function viewPong(root) {
    var my = ++__mount;
    var W = 480, H = 270;
    var PW = 10, PH = 50, BS = 8;
    var PADDLE_SPEED = 220, AI_SPEED = 250, MAX_SCORE = 5;
    var wrap = el('div');
    var cv = el('canvas', null, { width: W, height: H });
    cv.style.border = '1px solid #2b3644';
    cv.tabIndex = 0;
    var msg = el('p', 'PONG — Leertaste oder Klick zum Starten. W/S steuern. 1/2 kaufen Upgrades.', { 'class': 'meta' });
    wrap.appendChild(cv); wrap.appendChild(msg);
    root.appendChild(wrap);
    var ctx = cv.getContext('2d');
    var started, last, keys = {};
    var pa, pb, ball, sa, sb, points, shop;
    function resetBall() {
      var a = (Math.random() * 0.5 - 0.25) * Math.PI;
      var dx = 260 * Math.cos(a);
      ball = { x: W / 2, y: H / 2, dx: Math.random() < 0.5 ? -dx : dx, dy: 260 * Math.sin(a), color: '#fff' };
    }
    function reset() {
      pa = { y: H / 2 - PH / 2, h: PH, color: '#fff' };
      pb = { y: H / 2 - PH / 2, h: PH, color: '#fff' };
      sa = 0; sb = 0; points = 0;
      shop = { size: { name: '1. Bigger Paddle', cost: 20, level: 1 }, speed: { name: '2. Faster Paddle', cost: 30, level: 1 } };
      resetBall(); started = false;
    }
    function buy(item) {
      var u = shop[item];
      if (!u || u.level >= 3 || points < u.cost) return;
      points -= u.cost; u.level++; u.cost *= 2;
      if (item === 'size') pa.h += 12;
      else PADDLE_SPEED *= 1.2;
    }
    function step(dt) {
      if (!started) return;
      points += dt * 1; // TIME_REWARD: 1 point per second
      if (keys.w) pa.y -= PADDLE_SPEED * dt;
      if (keys.s) pa.y += PADDLE_SPEED * dt;
      pa.y = Math.max(0, Math.min(H - pa.h, pa.y));
      // AI: chase when ball approaches, drift to center otherwise
      if (ball.dx > 0) {
        if (ball.y > pb.y + pb.h / 2 + 15) pb.y += AI_SPEED * dt;
        else if (ball.y < pb.y + pb.h / 2 - 15) pb.y -= AI_SPEED * dt;
      } else {
        if (Math.abs(pb.y + pb.h / 2 - H / 2) > 3) pb.y += (pb.y + pb.h / 2 < H / 2 ? 1 : -1) * AI_SPEED * dt * 0.5;
      }
      pb.y = Math.max(0, Math.min(H - pb.h, pb.y));
      ball.x += ball.dx * dt; ball.y += ball.dy * dt;
      if (Math.abs(ball.y - H / 2) > H / 2 - BS) ball.dy *= -1;
      function bounce(p) {
        var rel = (ball.y - (p.y + p.h / 2)) / (p.h / 2);
        var ang = rel * Math.PI / 3;
        var sp = Math.sqrt(ball.dx * ball.dx + ball.dy * ball.dy) * 1.1;
        var d = ball.dx > 0 ? -1 : 1;
        ball.dx = d * sp * Math.cos(ang); ball.dy = sp * Math.sin(ang);
      }
      if (ball.dx > 0 && ball.x > W - 20 - PW && ball.x < W - 20 && ball.y > pb.y - BS && ball.y < pb.y + pb.h + BS) {
        ball.x = W - 20 - PW; bounce(pb); ball.color = 'blue';
      } else if (ball.dx < 0 && ball.x < 20 + PW && ball.x > 20 && ball.y > pa.y - BS && ball.y < pa.y + pa.h + BS) {
        ball.x = 20 + PW; bounce(pa); ball.color = 'red';
      }
      // Scoring (mirrors original: A scores right, shop points; colors flash)
      if (ball.x > W) {
        sa++; points += 10; pa.color = ['red', 'blue', 'green', 'yellow'][Math.floor(Math.random() * 4)];
        resetBall();
      } else if (ball.x < 0) {
        sb++; pb.color = ['red', 'blue', 'green', 'yellow'][Math.floor(Math.random() * 4)];
        resetBall();
      }
      if (Math.max(sa, sb) >= MAX_SCORE) started = 'over';
    }
    function draw() {
      ctx.fillStyle = '#000'; ctx.fillRect(0, 0, W, H);
      ctx.strokeStyle = '#333';
      for (var gy = 0; gy < H; gy += 12) { ctx.beginPath(); ctx.moveTo(0, gy); ctx.lineTo(W, gy); ctx.stroke(); }
      ctx.fillStyle = '#fff';
      for (var cy = 0; cy < H; cy += 16) ctx.fillRect(W / 2 - 1, cy, 2, 8);
      ctx.font = 'bold 48px sans-serif'; ctx.textAlign = 'center';
      ctx.fillText(sa, W / 3, 60); ctx.fillText(sb, 2 * W / 3, 60);
      ctx.font = '14px sans-serif'; ctx.textAlign = 'left';
      ctx.fillStyle = 'yellow'; ctx.fillText('Punkte: ' + Math.floor(points), 10, 20);
      ctx.fillStyle = '#fff';
      ctx.fillText('1: ' + shop.size.name + ' Lvl ' + shop.size.level + ' (' + shop.size.cost + ')', W - 210, 20);
      ctx.fillText('2: ' + shop.speed.name + ' Lvl ' + shop.speed.level + ' (' + shop.speed.cost + ')', W - 210, 38);
      ctx.fillStyle = pa.color; ctx.fillRect(20, pa.y, PW, pa.h);
      ctx.fillStyle = pb.color; ctx.fillRect(W - 20 - PW, pb.y, PW, pb.h);
      ctx.fillStyle = ball.color;
      ctx.beginPath(); ctx.arc(ball.x, ball.y, BS, 0, Math.PI * 2); ctx.fill();
      if (!started) {
        ctx.fillStyle = '#fff'; ctx.textAlign = 'center';
        ctx.font = 'bold 36px sans-serif'; ctx.fillText('PONG', W / 2, H / 2 - 30);
        ctx.font = '16px sans-serif'; ctx.fillText('Leertaste oder Klick zum Starten', W / 2, H / 2 + 10);
      } else if (started === 'over') {
        ctx.fillStyle = '#fff'; ctx.textAlign = 'center';
        ctx.font = 'bold 30px sans-serif';
        ctx.fillText((sa >= MAX_SCORE ? 'Spieler A' : 'Spieler B') + ' gewinnt!', W / 2, H / 2);
      }
    }
    function loop(t) {
      if (my !== __mount) return; // stale mount: stop looping
      if (!last) last = t;
      var dt = Math.min((t - last) / 1000, 0.05); last = t;
      step(dt); draw();
      requestAnimationFrame(loop);
    }
    function start() { if (my !== __mount) return; if (!started) { started = true; msg.textContent = 'W/S steuern · 1/2 kaufen Upgrades.'; cv.focus(); } }
    cv.addEventListener('click', start);
    document.addEventListener('keydown', function (e) {
      if (my !== __mount) return; // stale mount: ignore
      var k = e.key.toLowerCase();
      if (k === ' ') { start(); e.preventDefault(); }
      if (k === 'w') keys.w = true;
      if (k === 's') keys.s = true;
      if (k === '1') buy('size');
      if (k === '2') buy('speed');
    });
    document.addEventListener('keyup', function (e) {
      if (my !== __mount) return;
      var k = e.key.toLowerCase();
      if (k === 'w') keys.w = false;
      if (k === 's') keys.s = false;
    });
    reset();
    requestAnimationFrame(loop);
  }

  // ---------- Hangman (projects/browser-games-hangmen/main.py) ----------
  // German CLI: random word from list, 7 versuche, guessed letters shown as _.
  var HANGMAN_WORDS = ['python', 'programmieren', 'computer', 'spiel', 'hallo'];
  function viewHangman(root) {
    var word, guessed, tries, done;
    var wrap = el('div');
    var masked = el('p', '', { 'class': 'meta' });
    masked.style.cssText = 'font-size:1.6rem;letter-spacing:0.4rem;font-family:monospace;';
    var msg = el('p', '', { 'class': 'meta' });
    var row = el('div');
    row.style.cssText = 'display:flex;gap:6px;flex-wrap:wrap;margin:0.5rem 0;';
    var input = el('input', null, { type: 'text', maxlength: '1', placeholder: 'Buchstabe' });
    input.style.cssText = 'width:120px;';
    var btn = el('button', 'Raten');
    var again = el('button', 'Neues Spiel');
    wrap.appendChild(masked); wrap.appendChild(msg); wrap.appendChild(row);
    row.appendChild(input); row.appendChild(btn); row.appendChild(again);
    root.appendChild(wrap);
    function reset() {
      word = HANGMAN_WORDS[Math.floor(Math.random() * HANGMAN_WORDS.length)];
      guessed = []; tries = 7; done = false;
      draw('Rate einen Buchstaben. 7 Versuche.');
    }
    function draw(m) {
      var s = '';
      for (var i = 0; i < word.length; i++) s += (guessed.indexOf(word[i]) >= 0 ? word[i] : '_');
      masked.textContent = s.split('').join(' ');
      msg.textContent = m + (done ? ' Das Wort war: ' + word : ' Noch ' + tries + ' Versuche.');
      input.disabled = done; btn.disabled = done;
    }
    function guess() {
      if (done) return;
      var g = (input.value || '').toLowerCase();
      input.value = '';
      if (!/^[a-zäöü]$/.test(g)) { draw('Bitte genau einen Buchstaben eingeben.'); return; }
      if (guessed.indexOf(g) >= 0) { draw('Diesen Buchstaben hast du bereits geraten.'); return; }
      if (word.indexOf(g) >= 0) {
        guessed.push(g);
        var won = true;
        for (var i = 0; i < word.length; i++) if (guessed.indexOf(word[i]) < 0) won = false;
        if (won) { done = true; draw('Gewonnen!'); } else draw('Richtig geraten!');
      } else {
        tries--;
        if (tries <= 0) { done = true; draw('Verloren!'); } else draw('Falsch geraten!');
      }
    }
    btn.addEventListener('click', guess);
    input.addEventListener('keydown', function (e) { if (e.key === 'Enter') guess(); });
    again.addEventListener('click', reset);
    reset();
  }

  // ---------- Guess the number (projects/browser-games-guess-the-number/main.py) ----------
  // Zielzahl 1-100, max 10 Versuche, Zu niedrig/hoch, Rating <=5 Sehr gut.
  function viewGuess(root) {
    var target, tries, done;
    var wrap = el('div', null, { 'class': 'tool-form' });
    var msg = el('p', '', { 'class': 'meta' });
    var hist = el('pre', '', { 'class': 'result' });
    var input = el('input', null, { type: 'number', placeholder: '1-100' });
    var btn = el('button', 'Raten');
    var again = el('button', 'Neu');
    wrap.appendChild(input); wrap.appendChild(btn); wrap.appendChild(again);
    wrap.appendChild(msg); wrap.appendChild(hist);
    root.appendChild(wrap);
    var log = [];
    function reset() {
      target = 1 + Math.floor(Math.random() * 100); tries = 0; done = false; log = [];
      msg.textContent = 'Rate eine Zahl zwischen 1 und 100. 10 Versuche.';
      hist.textContent = ''; input.disabled = false; btn.disabled = false;
    }
    function rating() {
      if (tries <= 5) return 'Sehr gut!';
      return 'Gut!';
    }
    function guess() {
      if (done) return;
      var g = parseInt(input.value, 10);
      if (!(g >= 1 && g <= 100)) { msg.textContent = 'Bitte eine Zahl von 1 bis 100 eingeben.'; return; }
      tries++;
      if (g < target) { log.push(g + ' — Zu niedrig!'); msg.textContent = 'Zu niedrig! Versuch ' + tries + '/10.'; }
      else if (g > target) { log.push(g + ' — Zu hoch!'); msg.textContent = 'Zu hoch! Versuch ' + tries + '/10.'; }
      else {
        log.push(g + ' — Richtig!');
        msg.textContent = 'Richtig geraten! Die Zahl war ' + target + '. ' + tries + ' Versuche. ' + rating();
        done = true;
      }
      if (!done && tries >= 10) {
        msg.textContent = 'Keine Versuche mehr. Die Zahl war ' + target + '. Gut!';
        done = true;
      }
      if (done) { input.disabled = true; btn.disabled = true; }
      hist.textContent = log.join('\n');
    }
    btn.addEventListener('click', guess);
    input.addEventListener('keydown', function (e) { if (e.key === 'Enter') guess(); });
    again.addEventListener('click', reset);
    reset();
  }

  // ---------- 2048 (projects/browser-games-2048/game.js) ----------
  // 4x4 board, arrows to slide, 90% 2 / 10% 4 spawn, merge once per move, win at 2048.
  function view2048(root) {
    var my = ++__mount;
    var N = 4, board, score, over;
    var wrap = el('div');
    var top = el('p', '', { 'class': 'meta' });
    var grid = el('div');
    grid.style.cssText = 'display:grid;grid-template-columns:repeat(4,64px);gap:6px;margin:1rem 0;';
    var cells = [];
    for (var i = 0; i < 16; i++) {
      var c = el('div', ' ', { 'class': 'tile' });
      c.style.cssText = 'width:64px;height:64px;display:flex;align-items:center;justify-content:center;border:1px solid #2b3644;font-weight:bold;';
      cells.push(c); grid.appendChild(c);
    }
    var btn = el('button', 'Neustart');
    wrap.appendChild(top); wrap.appendChild(grid); wrap.appendChild(btn);
    root.appendChild(wrap);
    function spawn() {
      var empty = [];
      for (var r = 0; r < N; r++) for (var q = 0; q < N; q++) if (!board[r][q]) empty.push([r, q]);
      if (!empty.length) return;
      var p = empty[Math.floor(Math.random() * empty.length)];
      board[p[0]][p[1]] = Math.random() < 0.9 ? 2 : 4;
    }
    function compress(row) {
      var f = row.filter(function (v) { return v !== 0; });
      for (var i = 0; i < f.length - 1; i++) {
        if (f[i] === f[i + 1]) { f[i] *= 2; score += f[i]; f.splice(i + 1, 1); }
      }
      while (f.length < N) f.push(0);
      return f;
    }
    function same(a, b) {
      for (var r = 0; r < N; r++) for (var q = 0; q < N; q++) if (a[r][q] !== b[r][q]) return false;
      return true;
    }
    function transpose(b) {
      return b[0].map(function (_, i) { return b.map(function (row) { return row[i]; }); });
    }
    function rev(b) { return b.map(function (row) { return row.slice().reverse(); }); }
    function move(dir) {
      if (over) return;
      var before = board.map(function (row) { return row.slice(); });
      if (dir === 'left') board = board.map(compress);
      else if (dir === 'right') board = rev(rev(board).map(compress));
      else if (dir === 'up') board = transpose(transpose(board).reverse().map(compress)).reverse();
      else if (dir === 'down') board = transpose(rev(transpose(board)).map(compress));
      else return;
      if (!same(before, board)) spawn();
      draw();
      status();
    }
    function canMerge() {
      for (var r = 0; r < N; r++) for (var q = 0; q < N; q++) {
        if (q < N - 1 && board[r][q] === board[r][q + 1] && board[r][q]) return true;
        if (r < N - 1 && board[r][q] === board[r + 1][q] && board[r][q]) return true;
      }
      return false;
    }
    function status() {
      for (var r = 0; r < N; r++) for (var q = 0; q < N; q++) {
        if (board[r][q] === 2048) { top.textContent = 'Gewonnen! Score: ' + score; over = true; return; }
      }
      var full = board.every(function (row) { return row.every(function (v) { return v !== 0; }); });
      if (full && !canMerge()) { top.textContent = 'Game Over! Score: ' + score; over = true; return; }
      top.textContent = 'Score: ' + score + ' — Pfeiltasten zum Schieben.';
    }
    function draw() {
      for (var r = 0; r < N; r++) for (var q = 0; q < N; q++) {
        var v = board[r][q];
        cells[r * N + q].textContent = v || '';
      }
    }
    function reset() {
      board = []; score = 0; over = false;
      for (var r = 0; r < N; r++) { board.push([0, 0, 0, 0]); }
      spawn(); spawn(); draw(); status();
    }
    btn.addEventListener('click', reset);
    document.addEventListener('keydown', function (e) {
      if (my !== __mount) return;
      if (e.key === 'ArrowLeft') { move('left'); e.preventDefault(); }
      else if (e.key === 'ArrowRight') { move('right'); e.preventDefault(); }
      else if (e.key === 'ArrowUp') { move('up'); e.preventDefault(); }
      else if (e.key === 'ArrowDown') { move('down'); e.preventDefault(); }
    });
    reset();
  }

  // ---------- TankBlaster (projects/browser-games-tank-shooter-browser/game.js) ----------
  // Player tank slides left/right at the bottom, SPACE shoots; enemies fall from
  // the top with random speed. Bullet hit = +10. Enemy reaching the bottom or
  // hitting the player costs a life. 3 lives, then GAME OVER.
  function viewTank(root) {
    var my = ++__mount;
    var W = 480, H = 360;
    var wrap = el('div');
    var top = el('p', '', { 'class': 'meta' });
    var cv = el('canvas', null, { width: W, height: H });
    cv.style.border = '1px solid #2b3644';
    cv.tabIndex = 0;
    var row = el('div');
    row.style.cssText = 'display:flex;gap:6px;margin:0.5rem 0;';
    var startBtn = el('button', 'Start');
    var restartBtn = el('button', 'Neustart');
    row.appendChild(startBtn); row.appendChild(restartBtn);
    wrap.appendChild(top); wrap.appendChild(cv); wrap.appendChild(row);
    root.appendChild(wrap);
    var ctx = cv.getContext('2d');
    var player, bullets, enemies, score, lives, over, started, last;
    function reset() {
      player = { x: W / 2 - 20, y: H - 50, w: 40, h: 40, speed: 240, color: '#e74c3c' };
      bullets = []; enemies = []; score = 0; lives = 3; over = false; started = false;
      draw(); status('Pfeiltasten links/rechts fahren, Leertaste schießt. Start drücken.');
    }
    function status(m) { top.textContent = 'Score: ' + score + ' · Leben: ' + lives + ' — ' + m; }
    function shoot() {
      if (!started || over) return;
      bullets.push({ x: player.x + player.w / 2 - 2, y: player.y, w: 5, h: 15, speed: 480 });
    }
    function spawnEnemy() {
      if (Math.random() < 0.02) {
        enemies.push({ x: Math.random() * (W - 30), y: 0, w: 30, h: 30, speed: 60 + Math.random() * 140 });
      }
    }
    function hit(a, b) {
      return a.x < b.x + b.w && a.x + a.w > b.x && a.y < b.y + b.h && a.y + a.h > b.y;
    }
    function step(dt) {
      if (!started || over) return;
      if (keys.left) player.x = Math.max(0, player.x - player.speed * dt);
      if (keys.right) player.x = Math.min(W - player.w, player.x + player.speed * dt);
      spawnEnemy();
      var i, j;
      for (i = bullets.length - 1; i >= 0; i--) {
        bullets[i].y -= bullets[i].speed * dt;
        if (bullets[i].y + bullets[i].h < 0) bullets.splice(i, 1);
      }
      for (i = bullets.length - 1; i >= 0; i--) {
        for (j = enemies.length - 1; j >= 0; j--) {
          if (hit(bullets[i], enemies[j])) {
            bullets.splice(i, 1); enemies.splice(j, 1); score += 10;
            break;
          }
        }
      }
      for (i = enemies.length - 1; i >= 0; i--) {
        enemies[i].y += enemies[i].speed * dt;
        if (enemies[i].y > H) {
          enemies.splice(i, 1); lives--;
        } else if (hit(player, enemies[i])) {
          enemies.splice(i, 1); lives--;
        }
      }
      if (lives <= 0) { over = true; status('GAME OVER — Neustart unten.'); return; }
      status('Weiter so!');
    }
    function draw() {
      ctx.fillStyle = '#000'; ctx.fillRect(0, 0, W, H);
      ctx.fillStyle = player.color; ctx.fillRect(player.x, player.y, player.w, player.h);
      ctx.fillStyle = '#f1c40f';
      bullets.forEach(function (b) { ctx.fillRect(b.x, b.y, b.w, b.h); });
      ctx.fillStyle = '#2ecc71';
      enemies.forEach(function (e) { ctx.fillRect(e.x, e.y, e.w, e.h); });
      if (!started) {
        ctx.fillStyle = '#fff'; ctx.textAlign = 'center';
        ctx.font = 'bold 30px sans-serif'; ctx.fillText('TANK BLASTER', W / 2, H / 2 - 10);
        ctx.font = '15px sans-serif'; ctx.fillText('Start drücken, dann fahren + schießen', W / 2, H / 2 + 18);
      } else if (over) {
        ctx.fillStyle = 'red'; ctx.textAlign = 'center';
        ctx.font = 'bold 40px sans-serif'; ctx.fillText('GAME OVER', W / 2, H / 2);
      }
    }
    var keys = { left: false, right: false };
    document.addEventListener('keydown', function (e) {
      if (my !== __mount) return;
      if (e.key === 'ArrowLeft') { keys.left = true; e.preventDefault(); }
      else if (e.key === 'ArrowRight') { keys.right = true; e.preventDefault(); }
      else if (e.key === ' ') { shoot(); e.preventDefault(); }
    });
    document.addEventListener('keyup', function (e) {
      if (my !== __mount) return;
      if (e.key === 'ArrowLeft') keys.left = false;
      else if (e.key === 'ArrowRight') keys.right = false;
    });
    function loop(t) {
      if (my !== __mount) return;
      if (!last) last = t;
      var dt = Math.min((t - last) / 1000, 0.05); last = t;
      step(dt); draw();
      requestAnimationFrame(loop);
    }
    startBtn.addEventListener('click', function () { started = true; cv.focus(); status('Los gehts!'); });
    restartBtn.addEventListener('click', reset);
    reset();
    requestAnimationFrame(loop);
  }

  // ---------- Tamagotchi (projects/browser-games-tamagotchi-game) ----------
  // Native in-browser port of the Express/Mongoose backend: same stat model
  // (hunger/happiness/health 0-100, avatar egg, isSleeping) and same actions
  // (feed +15 hunger, play +20 happiness, sleep toggle). Mongo replaced with
  // localStorage; the 60s server tick becomes a 5s visible tick.
  function viewTama(root) {
    var KEY = 'd5-tama';
    var pet, timer;
    var wrap = el('div');
    var face = el('p', '');
    face.style.cssText = 'font-size:4rem;margin:0.5rem 0;';
    var stats = el('p', '', { 'class': 'meta' });
    var msg = el('p', '', { 'class': 'meta' });
    var row = el('div');
    row.style.cssText = 'display:flex;gap:6px;flex-wrap:wrap;margin:0.5rem 0;';
    var bFeed = el('button', 'Füttern (+15)');
    var bPlay = el('button', 'Spielen (+20)');
    var bSleep = el('button', 'Schlafen');
    var bNew = el('button', 'Neues Ei');
    row.appendChild(bFeed); row.appendChild(bPlay); row.appendChild(bSleep); row.appendChild(bNew);
    wrap.appendChild(face); wrap.appendChild(stats); wrap.appendChild(msg); wrap.appendChild(row);
    root.appendChild(wrap);
    function fresh() {
      return { hunger: 100, happiness: 100, health: 100, age: 0, sleeping: false, alive: true };
    }
    function load() {
      try {
        var raw = localStorage.getItem(KEY);
        if (raw) { pet = JSON.parse(raw); return; }
      } catch (e) { /* fresh below */ }
      pet = fresh();
    }
    function save() { try { localStorage.setItem(KEY, JSON.stringify(pet)); } catch (e) {} }
    function mood() {
      if (!pet.alive) return '💀';
      if (pet.sleeping) return '😴';
      if (pet.health < 25 || pet.hunger <= 0) return '🤒';
      if (pet.happiness < 30) return '😢';
      if (pet.hunger < 30) return '🍽️';
      return '😊';
    }
    function draw(m) {
      face.textContent = mood();
      stats.textContent = 'Hunger ' + pet.hunger + ' · Spaß ' + pet.happiness +
        ' · Gesundheit ' + pet.health + ' · Alter ' + pet.age + 'min' +
        (pet.sleeping ? ' · schläft' : '');
      if (m) msg.textContent = m;
      var dead = !pet.alive;
      bFeed.disabled = dead || pet.sleeping; bPlay.disabled = dead || pet.sleeping;
    }
    function tick() {
      if (!pet.alive) return;
      pet.age++;
      if (pet.sleeping) {
        pet.health = Math.min(100, pet.health + 4);
        pet.hunger = Math.max(0, pet.hunger - 1);
      } else {
        pet.hunger = Math.max(0, pet.hunger - 2);
        pet.happiness = Math.max(0, pet.happiness - 2);
        if (pet.hunger <= 0) pet.health = Math.max(0, pet.health - 5);
      }
      if (pet.health <= 0) { pet.alive = false; draw('Dein Tamagotchi ist gestorben. Neues Ei unten.'); }
      else draw();
      save();
    }
    bFeed.addEventListener('click', function () {
      if (!pet.alive || pet.sleeping) return;
      pet.hunger = Math.min(100, pet.hunger + 15);
      draw('Nom nom! Hunger +15.'); save();
    });
    bPlay.addEventListener('click', function () {
      if (!pet.alive || pet.sleeping) return;
      pet.happiness = Math.min(100, pet.happiness + 20);
      pet.hunger = Math.max(0, pet.hunger - 3);
      draw('Juhu! Spaß +20.'); save();
    });
    bSleep.addEventListener('click', function () {
      if (!pet.alive) return;
      pet.sleeping = !pet.sleeping;
      draw(pet.sleeping ? 'Gute Nacht… (Gesundheit regeneriert)' : 'Guten Morgen!');
      save();
    });
    bNew.addEventListener('click', function () { pet = fresh(); save(); draw('Ein neues Ei ist geschlüpft!'); });
    load(); draw('Kümmere dich um dein Ei: füttern, spielen, schlafen lassen.');
    timer = setInterval(function () { tick(); }, 5000);
  }

  // ---------- Audio Visualizer (projects/utilities-&-desktop-tools-audio_visualizer) ----------
  // Same analyser setup as the original (fftSize 2048, hue bars from
  // getByteFrequencyData). Mic input where available, plus a demo tone so the
  // bars move with one click and no permission prompt.
  function viewViz(root) {
    var my = ++__mount;
    var wrap = el('div');
    var msg = el('p', 'Mikrofon oder Demo-Ton wählen, dann tanzen die Balken.', { 'class': 'meta' });
    var cv = el('canvas', null, { width: 480, height: 180 });
    cv.style.border = '1px solid #2b3644';
    cv.style.cssText += 'width:100%;max-width:480px;';
    var row = el('div');
    row.style.cssText = 'display:flex;gap:6px;margin:0.5rem 0;';
    var bMic = el('button', 'Mikrofon starten');
    var bDemo = el('button', 'Demo-Ton');
    var bStop = el('button', 'Stopp');
    row.appendChild(bMic); row.appendChild(bDemo); row.appendChild(bStop);
    wrap.appendChild(msg); wrap.appendChild(cv); wrap.appendChild(row);
    root.appendChild(wrap);
    var ctx = cv.getContext('2d');
    var ac = null, analyser = null, demoNodes = null, stream = null, running = false;
    function ensureCtx() {
      if (!ac) {
        ac = new (window.AudioContext || window.webkitAudioContext)();
        analyser = ac.createAnalyser();
        analyser.fftSize = 2048;
      }
      if (ac.state === 'suspended') ac.resume();
    }
    function stopAll() {
      running = false;
      if (demoNodes) { try { demoNodes.osc.stop(); } catch (e) {} demoNodes = null; }
      if (stream) { stream.getTracks().forEach(function (t) { t.stop(); }); stream = null; }
      msg.textContent = 'Gestoppt.';
    }
    function draw() {
      if (my !== __mount || !running) return;
      var n = analyser.frequencyBinCount;
      var data = new Uint8Array(n);
      analyser.getByteFrequencyData(data);
      ctx.fillStyle = '#000'; ctx.fillRect(0, 0, cv.width, cv.height);
      var barW = (cv.width / n) * 2.5, x = 0;
      for (var i = 0; i < n; i++) {
        var h = data[i] * 1.5 * (cv.height / 384);
        ctx.fillStyle = 'hsl(' + Math.round((i / n) * 360) + ',100%,50%)';
        ctx.fillRect(x, cv.height - h, barW, h);
        x += barW + 1;
        if (x > cv.width) break;
      }
      requestAnimationFrame(draw);
    }
    bMic.addEventListener('click', function () {
      ensureCtx(); stopAll();
      if (!navigator.mediaDevices || !navigator.mediaDevices.getUserMedia) {
        msg.textContent = 'Kein Mikrofon verfügbar — nimm den Demo-Ton.';
        return;
      }
      navigator.mediaDevices.getUserMedia({ audio: true }).then(function (s) {
        if (my !== __mount) { s.getTracks().forEach(function (t) { t.stop(); }); return; }
        stream = s;
        ac.createMediaStreamSource(s).connect(analyser);
        running = true; msg.textContent = 'Mikrofon läuft…';
        draw();
      }).catch(function () { msg.textContent = 'Mikrofon verweigert — nimm den Demo-Ton.'; });
    });
    bDemo.addEventListener('click', function () {
      ensureCtx(); stopAll();
      var osc = ac.createOscillator(), lfo = ac.createOscillator(), gain = ac.createGain();
      osc.type = 'sawtooth'; osc.frequency.value = 110;
      lfo.frequency.value = 2; gain.gain.value = 0.4;
      lfo.connect(gain.gain); osc.connect(analyser); osc.connect(ac.destination);
      osc.start(); lfo.start();
      demoNodes = { osc: osc };
      running = true; msg.textContent = 'Demo-Ton läuft…';
      draw();
    });
    bStop.addEventListener('click', stopAll);
  }

  // ---------- Theme Park Tycoon (original: d5 fun build) ----------
  // Buy rides on a 10x7 grid, visitors stream in and pay per ride.
  // Coaster EUR 300 (fee 8, upkeep 3, thrill 5), Wheel EUR 200
  // (fee 5, upkeep 2, thrill 3), Stand EUR 100 (fee 3, upkeep 1,
  // thrill 1). Visitors per tick = 1 + thrill/3 (cap 20). Upkeep is
  // charged per ride per tick. Win at EUR 5000, bankrupt below 0.
  var PARK = {
    coaster: { cost: 300, fee: 8, upkeep: 3, thrill: 5, color: '#e74c3c', key: 'C' },
    wheel: { cost: 200, fee: 5, upkeep: 2, thrill: 3, color: '#3498db', key: 'W' },
    stand: { cost: 100, fee: 3, upkeep: 1, thrill: 1, color: '#f1c40f', key: 'S' }
  };
  function viewPark(root) {
    var my = ++__mount;
    var COLS = 10, ROWS = 7, T = 46, OX = 10, OY = 10;
    var W = OX * 2 + COLS * T, H = OY * 2 + ROWS * T;
    var wrap = el('div');
    var top = el('p', '', { 'class': 'meta' });
    var cv = el('canvas', null, { width: W, height: H });
    cv.style.border = '1px solid #2b3644';
    var row = el('div');
    row.style.cssText = 'display:flex;gap:6px;flex-wrap:wrap;margin:0.5rem 0;';
    var order = ['coaster', 'wheel', 'stand'];
    order.forEach(function (k) {
      var b = el('button', PARK[k].key + ': ' + k + ' (€' + PARK[k].cost + ')');
      b.addEventListener('click', function () { sel = k; status('Baue ' + k + ': freies Feld anklicken.'); });
      row.appendChild(b);
    });
    var startBtn = el('button', 'Start');
    var restartBtn = el('button', 'Neustart');
    row.appendChild(startBtn); row.appendChild(restartBtn);
    wrap.appendChild(top); wrap.appendChild(cv); wrap.appendChild(row);
    root.appendChild(wrap);
    var ctx = cv.getContext('2d');
    var rides, visitors, money, sel, started, over, won, ticks, timer;
    function reset() {
      rides = []; visitors = []; money = 1000; sel = 'coaster';
      started = false; over = false; won = false; ticks = 0;
      draw(); status('Wähle ein Fahrgeschäft, klicke ein Feld, dann Start.');
    }
    function status(m) {
      top.textContent = 'Tag ' + (Math.floor(ticks / 30) + 1) + ' · Kasse: €' + money +
        ' · Fahrgeschäfte: ' + rides.length + ' · Besucher: ' + visitors.length + ' — ' + m;
    }
    function thrill() {
      var s = 0, i;
      for (i = 0; i < rides.length; i++) s += PARK[rides[i].t].thrill;
      return s;
    }
    function occupied(c, r) {
      for (var i = 0; i < rides.length; i++) if (rides[i].c === c && rides[i].r === r) return true;
      return false;
    }
    function step() {
      if (!started || over || won) return;
      ticks++;
      var th = thrill();
      var want = Math.min(20, 1 + Math.floor(th / 3));
      while (visitors.length < want) visitors.push({ ride: -1 });
      var i, up = 0;
      for (i = 0; i < rides.length; i++) up += PARK[rides[i].t].upkeep;
      for (i = 0; i < visitors.length; i++) {
        if (!rides.length) break;
        var ri = Math.floor(Math.random() * rides.length);
        visitors[i].ride = ri;
        money += PARK[rides[ri].t].fee;
      }
      money -= up;
      if (money >= 5000) { won = true; status('5-STERNE-PARK! Ziel erreicht — Neustart unten.'); draw(); return; }
      if (money < 0) { over = true; status('BANKROTT — Neustart unten.'); draw(); return; }
      status(rides.length ? 'Läuft.' : 'Baue erst Fahrgeschäfte.');
      draw();
    }
    function draw() {
      ctx.fillStyle = '#0b3d1b'; ctx.fillRect(0, 0, W, H);
      var c, r;
      for (c = 0; c < COLS; c++) for (r = 0; r < ROWS; r++) {
        ctx.strokeStyle = '#1d5c2e';
        ctx.strokeRect(OX + c * T, OY + r * T, T, T);
      }
      ctx.fillStyle = '#7cc4ff';
      ctx.fillRect(OX, OY + (ROWS - 1) * T, T, T);
      ctx.fillStyle = '#000'; ctx.font = 'bold 16px sans-serif'; ctx.textAlign = 'center';
      ctx.fillText('IN', OX + T / 2, OY + (ROWS - 1) * T + T / 2 + 6);
      var i;
      for (i = 0; i < rides.length; i++) {
        var rd = rides[i], p = PARK[rd.t];
        ctx.fillStyle = p.color;
        ctx.fillRect(OX + rd.c * T + 3, OY + rd.r * T + 3, T - 6, T - 6);
        ctx.fillStyle = '#000';
        ctx.fillText(p.key, OX + rd.c * T + T / 2, OY + rd.r * T + T / 2 + 6);
      }
      ctx.fillStyle = '#ffe14d';
      for (i = 0; i < visitors.length; i++) {
        var v = visitors[i];
        var vx, vy;
        if (v.ride >= 0 && v.ride < rides.length) {
          vx = OX + rides[v.ride].c * T + (i * 13) % (T - 8) + 4;
          vy = OY + rides[v.ride].r * T + 8 + Math.floor((i * 13) / (T - 8)) * 8 % (T - 12);
        } else {
          vx = OX + 8 + (i * 17) % (COLS * T - 16);
          vy = OY + (ROWS - 1) * T + T / 2;
        }
        ctx.beginPath(); ctx.arc(vx, vy, 3, 0, Math.PI * 2); ctx.fill();
      }
      if (!started) {
        ctx.fillStyle = '#fff'; ctx.textAlign = 'center';
        ctx.font = 'bold 28px sans-serif'; ctx.fillText('D5 PARK', W / 2, 60);
        ctx.font = '15px sans-serif'; ctx.fillText('Bauen, dann Start drücken', W / 2, 86);
      }
    }
    cv.addEventListener('click', function (e) {
      if (over || won) return;
      var rect = cv.getBoundingClientRect();
      var x = (e.clientX - rect.left) * (cv.width / rect.width);
      var y = (e.clientY - rect.top) * (cv.height / rect.height);
      var c = Math.floor((x - OX) / T), r = Math.floor((y - OY) / T);
      if (c < 0 || c >= COLS || r < 0 || r >= ROWS) return;
      if (occupied(c, r)) { status('Feld belegt.'); return; }
      var p = PARK[sel];
      if (money < p.cost) { status('Zu teuer — ' + sel + ' kostet €' + p.cost + '.'); return; }
      money -= p.cost;
      rides.push({ c: c, r: r, t: sel });
      status(sel + ' gebaut. Noch €' + money + '.');
      draw();
    });
    startBtn.addEventListener('click', function () {
      if (!rides.length) { status('Erst mindestens ein Fahrgeschäft bauen.'); return; }
      started = true; cv.focus(); status('Geöffnet!');
    });
    restartBtn.addEventListener('click', function () { if (timer) clearInterval(timer); reset(); timer = setInterval(tick, 1000); });
    function tick() { if (my !== __mount) { clearInterval(timer); return; } step(); }
    reset();
    timer = setInterval(tick, 1000);
  }

  return {
    viewSnake: viewSnake, viewTictactoe: viewTictactoe, viewPong: viewPong,
    viewHangman: viewHangman, viewGuess: viewGuess, view2048: view2048,
    viewTank: viewTank, viewTama: viewTama, viewViz: viewViz,
    viewPark: viewPark
  };
})();