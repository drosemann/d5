/* Native game ports from app/games.js — Solid signals + onCleanup. */
import { createSignal, createEffect, onCleanup, For, Show } from "solid-js";
import { storeGet, storeSet } from "../store.js";

function useKeys(handler) {
  const down = (e) => handler(e, true);
  const up = (e) => handler(e, false);
  document.addEventListener("keydown", down);
  document.addEventListener("keyup", up);
  onCleanup(() => {
    document.removeEventListener("keydown", down);
    document.removeEventListener("keyup", up);
  });
}

/* ---------- Snake ---------- */
export function ViewSnake() {
  let cv;
  const CELL = 20, COLS = 20, ROWS = 15;
  const [info, setInfo] = createSignal("Pfeiltasten zum Steuern. Wand oder sich selbst berühren = Spiel vorbei.");
  let snake, dir, food, over, timer;
  const ctx = () => cv.getContext("2d");
  function placeFood() {
    let p;
    do { p = [Math.floor(Math.random() * COLS), Math.floor(Math.random() * ROWS)]; }
    while (snake.some((s) => s[0] === p[0] && s[1] === p[1]));
    food = p;
  }
  function draw() {
    const c = ctx();
    c.fillStyle = "#000"; c.fillRect(0, 0, cv.width, cv.height);
    c.fillStyle = "#f00"; c.fillRect(food[0] * CELL, food[1] * CELL, CELL, CELL);
    c.fillStyle = "#0f0";
    snake.forEach((s) => c.fillRect(s[0] * CELL, s[1] * CELL, CELL, CELL));
  }
  function step() {
    if (over) return;
    const h = snake[0].slice();
    if (dir === "up") h[1]--; else if (dir === "down") h[1]++;
    else if (dir === "left") h[0]--; else h[0]++;
    if (h[0] < 0 || h[0] >= COLS || h[1] < 0 || h[1] >= ROWS ||
        snake.some((s) => s[0] === h[0] && s[1] === h[1])) {
      over = true;
      setInfo("Spiel vorbei! Länge: " + snake.length + " — Neustart unten.");
      clearInterval(timer); draw(); return;
    }
    snake.unshift(h);
    if (h[0] === food[0] && h[1] === food[1]) placeFood(); else snake.pop();
    draw();
  }
  function reset() {
    snake = [[10, 7]]; dir = "up"; over = false;
    placeFood(); draw();
    setInfo("Pfeiltasten zum Steuern. Wand oder sich selbst berühren = Spiel vorbei.");
  }
  useKeys((e, isDown) => {
    if (!isDown) return;
    const k = e.key;
    if (k === "ArrowUp" && dir !== "down") dir = "up";
    else if (k === "ArrowDown" && dir !== "up") dir = "down";
    else if (k === "ArrowLeft" && dir !== "right") dir = "left";
    else if (k === "ArrowRight" && dir !== "left") dir = "right";
    else return;
    e.preventDefault();
  });
  createEffect(() => {
    timer = setInterval(step, 100);
    reset();
    onCleanup(() => clearInterval(timer));
  });
  return (
    <div>
      <canvas ref={cv} width={COLS * CELL} height={ROWS * CELL} style={{ border: "1px solid #2b3644" }} />
      <p class="meta">{info()}</p>
      <button onClick={() => { clearInterval(timer); reset(); timer = setInterval(step, 100); }}>Neustart</button>
    </div>
  );
}

/* ---------- Tic-Tac-Toe ---------- */
const LINES = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]];
export function ViewTictactoe() {
  const [board, setBoard] = createSignal([" "," "," "," "," "," "," "," "," "]);
  const [done, setDone] = createSignal(false);
  const [msg, setMsg] = createSignal("Spieler X, wähle ein Feld.");
  const [sx, setSx] = createSignal(0);
  const [so, setSo] = createSignal(0);
  const [dr, setDr] = createSignal(0);
  function won(b) {
    return LINES.some((l) => b[l[0]] !== " " && b[l[0]] === b[l[1]] && b[l[1]] === b[l[2]]);
  }
  function reset() { setBoard([" "," "," "," "," "," "," "," "," "]); setDone(false); setMsg("Spieler X, wähle ein Feld."); }
  function move(i) {
    if (done() || board()[i] !== " ") return;
    let b = board().slice();
    b[i] = "X";
    if (won(b)) { setBoard(b); setDone(true); setSx((v) => v + 1); setMsg("Spieler X hat gewonnen!"); return; }
    if (b.indexOf(" ") === -1) { setBoard(b); setDone(true); setDr((v) => v + 1); setMsg("Unentschieden!"); return; }
    const free = [];
    b.forEach((v, j) => { if (v === " ") free.push(j); });
    const p = free[Math.floor(Math.random() * free.length)];
    b[p] = "O";
    setBoard(b);
    setMsg("KI hat Feld " + p + " gewählt. Du bist dran.");
    if (won(b)) { setDone(true); setSo((v) => v + 1); setMsg("Spieler O hat gewonnen!"); }
    else if (b.indexOf(" ") === -1) { setDone(true); setDr((v) => v + 1); setMsg("Unentschieden!"); }
  }
  return (
    <div>
      <div class="ttt" style={{ "display": "grid", "grid-template-columns": "repeat(3,64px)", gap: "6px", margin: "1rem 0" }}>
        <For each={board()}>{(v, i) => (
          <button style={{ width: "64px", height: "64px", "font-size": "1.8rem" }} disabled={done() || v !== " "} onClick={() => move(i())}>{v}</button>
        )}</For>
      </div>
      <p class="meta">{msg()}</p>
      <p class="meta">Endstand: X - {sx()}, O - {so()}, Unentschieden - {dr()}</p>
      <button onClick={reset}>Neues Spiel</button>
    </div>
  );
}

/* ---------- Ping Pong ---------- */
export function ViewPong() {
  let cv;
  const W = 480, H = 270, PW = 10, PH = 50, BS = 8;
  const [msg, setMsg] = createSignal("PONG — Leertaste oder Klick zum Starten. W/S steuern. 1/2 kaufen Upgrades.");
  let started, last, keys = {};
  let pa, pb, ball, sa, sb, points, shop, paddleSpeed = 220;
  const AI_SPEED = 250, MAX_SCORE = 5;
  function resetBall() {
    const a = (Math.random() * 0.5 - 0.25) * Math.PI;
    const dx = 260 * Math.cos(a);
    ball = { x: W / 2, y: H / 2, dx: Math.random() < 0.5 ? -dx : dx, dy: 260 * Math.sin(a), color: "#fff" };
  }
  function reset() {
    pa = { y: H / 2 - PH / 2, h: PH, color: "#fff" };
    pb = { y: H / 2 - PH / 2, h: PH, color: "#fff" };
    sa = 0; sb = 0; points = 0; paddleSpeed = 220;
    shop = { size: { name: "1. Bigger Paddle", cost: 20, level: 1 }, speed: { name: "2. Faster Paddle", cost: 30, level: 1 } };
    resetBall(); started = false;
  }
  function buy(item) {
    const u = shop[item];
    if (!u || u.level >= 3 || points < u.cost) return;
    points -= u.cost; u.level++; u.cost *= 2;
    if (item === "size") pa.h += 12; else paddleSpeed *= 1.2;
  }
  function step(dt) {
    if (!started) return;
    points += dt;
    if (keys.w) pa.y -= paddleSpeed * dt;
    if (keys.s) pa.y += paddleSpeed * dt;
    pa.y = Math.max(0, Math.min(H - pa.h, pa.y));
    if (ball.dx > 0) {
      if (ball.y > pb.y + pb.h / 2 + 15) pb.y += AI_SPEED * dt;
      else if (ball.y < pb.y + pb.h / 2 - 15) pb.y -= AI_SPEED * dt;
    } else if (Math.abs(pb.y + pb.h / 2 - H / 2) > 3) {
      pb.y += (pb.y + pb.h / 2 < H / 2 ? 1 : -1) * AI_SPEED * dt * 0.5;
    }
    pb.y = Math.max(0, Math.min(H - pb.h, pb.y));
    ball.x += ball.dx * dt; ball.y += ball.dy * dt;
    if (Math.abs(ball.y - H / 2) > H / 2 - BS) ball.dy *= -1;
    const bounce = (p) => {
      const rel = (ball.y - (p.y + p.h / 2)) / (p.h / 2);
      const ang = rel * Math.PI / 3;
      const sp = Math.sqrt(ball.dx * ball.dx + ball.dy * ball.dy) * 1.1;
      const d = ball.dx > 0 ? -1 : 1;
      ball.dx = d * sp * Math.cos(ang); ball.dy = sp * Math.sin(ang);
    };
    if (ball.dx > 0 && ball.x > W - 20 - PW && ball.x < W - 20 && ball.y > pb.y - BS && ball.y < pb.y + pb.h + BS) {
      ball.x = W - 20 - PW; bounce(pb); ball.color = "blue";
    } else if (ball.dx < 0 && ball.x < 20 + PW && ball.x > 20 && ball.y > pa.y - BS && ball.y < pa.y + pa.h + BS) {
      ball.x = 20 + PW; bounce(pa); ball.color = "red";
    }
    if (ball.x > W) { sa++; points += 10; pa.color = ["red","blue","green","yellow"][Math.floor(Math.random() * 4)]; resetBall(); }
    else if (ball.x < 0) { sb++; pb.color = ["red","blue","green","yellow"][Math.floor(Math.random() * 4)]; resetBall(); }
    if (Math.max(sa, sb) >= MAX_SCORE) started = "over";
  }
  function draw() {
    const c = cv.getContext("2d");
    c.fillStyle = "#000"; c.fillRect(0, 0, W, H);
    c.strokeStyle = "#333";
    for (let gy = 0; gy < H; gy += 12) { c.beginPath(); c.moveTo(0, gy); c.lineTo(W, gy); c.stroke(); }
    c.fillStyle = "#fff";
    for (let cy = 0; cy < H; cy += 16) c.fillRect(W / 2 - 1, cy, 2, 8);
    c.font = "bold 48px sans-serif"; c.textAlign = "center";
    c.fillText(sa, W / 3, 60); c.fillText(sb, 2 * W / 3, 60);
    c.font = "14px sans-serif"; c.textAlign = "left";
    c.fillStyle = "yellow"; c.fillText("Punkte: " + Math.floor(points), 10, 20);
    c.fillStyle = "#fff";
    c.fillText("1: " + shop.size.name + " Lvl " + shop.size.level + " (" + shop.size.cost + ")", W - 210, 20);
    c.fillText("2: " + shop.speed.name + " Lvl " + shop.speed.level + " (" + shop.speed.cost + ")", W - 210, 38);
    c.fillStyle = pa.color; c.fillRect(20, pa.y, PW, pa.h);
    c.fillStyle = pb.color; c.fillRect(W - 20 - PW, pb.y, PW, pb.h);
    c.fillStyle = ball.color;
    c.beginPath(); c.arc(ball.x, ball.y, BS, 0, Math.PI * 2); c.fill();
    if (!started) {
      c.fillStyle = "#fff"; c.textAlign = "center";
      c.font = "bold 36px sans-serif"; c.fillText("PONG", W / 2, H / 2 - 30);
      c.font = "16px sans-serif"; c.fillText("Leertaste oder Klick zum Starten", W / 2, H / 2 + 10);
    } else if (started === "over") {
      c.fillStyle = "#fff"; c.textAlign = "center";
      c.font = "bold 30px sans-serif";
      c.fillText((sa >= MAX_SCORE ? "Spieler A" : "Spieler B") + " gewinnt!", W / 2, H / 2);
    }
  }
  function loop(t) {
    if (!last) last = t;
    const dt = Math.min((t - last) / 1000, 0.05); last = t;
    step(dt); draw();
    raf = requestAnimationFrame(loop);
  }
  function start() {
    if (!started) { started = true; setMsg("W/S steuern · 1/2 kaufen Upgrades."); cv.focus(); }
  }
  useKeys((e, isDown) => {
    const k = e.key.toLowerCase();
    if (isDown) {
      if (k === " ") { start(); e.preventDefault(); }
      if (k === "w") keys.w = true;
      if (k === "s") keys.s = true;
      if (k === "1") buy("size");
      if (k === "2") buy("speed");
    } else {
      if (k === "w") keys.w = false;
      if (k === "s") keys.s = false;
    }
  });
  let raf;
  createEffect(() => {
    reset();
    raf = requestAnimationFrame(loop);
    onCleanup(() => cancelAnimationFrame(raf));
  });
  return (
    <div>
      <canvas ref={cv} width={W} height={H} tabindex="0" style={{ border: "1px solid #2b3644" }} onClick={start} />
      <p class="meta">{msg()}</p>
    </div>
  );
}

/* ---------- Hangman ---------- */
const HANGMAN_WORDS = ["python", "programmieren", "computer", "spiel", "hallo"];
export function ViewHangman() {
  const [word, setWord] = createSignal("python");
  const [guessed, setGuessed] = createSignal([]);
  const [tries, setTries] = createSignal(7);
  const [done, setDone] = createSignal(false);
  const [msg, setMsg] = createSignal("Rate einen Buchstaben. 7 Versuche.");
  const [input, setInput] = createSignal("");
  function reset() {
    setWord(HANGMAN_WORDS[Math.floor(Math.random() * HANGMAN_WORDS.length)]);
    setGuessed([]); setTries(7); setDone(false);
    setMsg("Rate einen Buchstaben. 7 Versuche.");
  }
  function masked() {
    let s = "";
    for (let i = 0; i < word().length; i++) s += (guessed().indexOf(word()[i]) >= 0 ? word()[i] : "_");
    return s.split("").join(" ");
  }
  function guess() {
    if (done()) return;
    const g = (input() || "").toLowerCase();
    setInput("");
    if (!/^[a-zäöü]$/.test(g)) { setMsg("Bitte genau einen Buchstaben eingeben. Noch " + tries() + " Versuche."); return; }
    if (guessed().indexOf(g) >= 0) { setMsg("Diesen Buchstaben hast du bereits geraten. Noch " + tries() + " Versuche."); return; }
    if (word().indexOf(g) >= 0) {
      const next = guessed().slice();
      next.push(g);
      setGuessed(next);
      let won = true;
      for (let i = 0; i < word().length; i++) if (next.indexOf(word()[i]) < 0) won = false;
      if (won) { setDone(true); setMsg("Gewonnen! Das Wort war: " + word()); }
      else setMsg("Richtig geraten! Noch " + tries() + " Versuche.");
    } else {
      const t = tries() - 1;
      setTries(t);
      if (t <= 0) { setDone(true); setMsg("Verloren! Das Wort war: " + word()); }
      else setMsg("Falsch geraten! Noch " + t + " Versuche.");
    }
  }
  return (
    <div>
      <p class="meta" style={{ "font-size": "1.6rem", "letter-spacing": "0.4rem", "font-family": "monospace" }}>{masked()}</p>
      <p class="meta">{msg()}</p>
      <div style={{ display: "flex", gap: "6px", "flex-wrap": "wrap", margin: "0.5rem 0" }}>
        <input style={{ width: "120px" }} type="text" maxlength="1" placeholder="Buchstabe" disabled={done()}
          value={input()} onInput={(e) => setInput(e.target.value)}
          onKeyDown={(e) => { if (e.key === "Enter") guess(); }} />
        <button disabled={done()} onClick={guess}>Raten</button>
        <button onClick={reset}>Neues Spiel</button>
      </div>
    </div>
  );
}

/* ---------- Guess the number ---------- */
export function ViewGuess() {
  const [target, setTarget] = createSignal(1 + Math.floor(Math.random() * 100));
  const [tries, setTries] = createSignal(0);
  const [done, setDone] = createSignal(false);
  const [log, setLog] = createSignal([]);
  const [input, setInput] = createSignal("");
  const [msg, setMsg] = createSignal("Rate eine Zahl zwischen 1 und 100. 10 Versuche.");
  function reset() {
    setTarget(1 + Math.floor(Math.random() * 100));
    setTries(0); setDone(false); setLog([]);
    setMsg("Rate eine Zahl zwischen 1 und 100. 10 Versuche.");
  }
  function guess() {
    if (done()) return;
    const g = parseInt(input(), 10);
    if (!(g >= 1 && g <= 100)) { setMsg("Bitte eine Zahl von 1 bis 100 eingeben."); return; }
    const t = tries() + 1;
    setTries(t);
    const l = log().slice();
    if (g < target()) { l.push(g + " — Zu niedrig!"); setMsg("Zu niedrig! Versuch " + t + "/10."); }
    else if (g > target()) { l.push(g + " — Zu hoch!"); setMsg("Zu hoch! Versuch " + t + "/10."); }
    else {
      l.push(g + " — Richtig!");
      setMsg("Richtig geraten! Die Zahl war " + target() + ". " + t + " Versuche. " + (t <= 5 ? "Sehr gut!" : "Gut!"));
      setDone(true);
    }
    if (!done() && g !== target() && t >= 10) {
      setMsg("Keine Versuche mehr. Die Zahl war " + target() + ". Gut!");
      setDone(true);
    }
    setLog(l);
  }
  return (
    <div class="tool-form">
      <input type="number" placeholder="1-100" disabled={done()} value={input()} onInput={(e) => setInput(e.target.value)}
        onKeyDown={(e) => { if (e.key === "Enter") guess(); }} />
      <button disabled={done()} onClick={guess}>Raten</button>
      <button onClick={reset}>Neu</button>
      <p class="meta">{msg()}</p>
      <pre class="result">{log().join("\n")}</pre>
    </div>
  );
}

/* ---------- 2048 ---------- */
export function View2048() {
  const N = 4;
  const [board, setBoard] = createSignal([[0,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0]]);
  const [score, setScore] = createSignal(0);
  const [over, setOver] = createSignal(false);
  const [top, setTop] = createSignal("");
  function spawn(b) {
    const empty = [];
    for (let r = 0; r < N; r++) for (let q = 0; q < N; q++) if (!b[r][q]) empty.push([r, q]);
    if (!empty.length) return;
    const p = empty[Math.floor(Math.random() * empty.length)];
    b[p[0]][p[1]] = Math.random() < 0.9 ? 2 : 4;
  }
  function compress(row, add) {
    const f = row.filter((v) => v !== 0);
    let sc = 0;
    for (let i = 0; i < f.length - 1; i++) {
      if (f[i] === f[i + 1]) { f[i] *= 2; sc += f[i]; f.splice(i + 1, 1); }
    }
    while (f.length < N) f.push(0);
    add(sc);
    return f;
  }
  function same(a, b) {
    for (let r = 0; r < N; r++) for (let q = 0; q < N; q++) if (a[r][q] !== b[r][q]) return false;
    return true;
  }
  const transpose = (b) => b[0].map((_, i) => b.map((row) => row[i]));
  const rev = (b) => b.map((row) => row.slice().reverse());
  function move(dir) {
    if (over()) return;
    const before = board().map((row) => row.slice());
    let b = board().map((row) => row.slice());
    let sc = 0;
    const add = (v) => { sc += v; };
    if (dir === "left") b = b.map((row) => compress(row, add));
    else if (dir === "right") b = rev(rev(b).map((row) => compress(row, add)));
    else if (dir === "up") b = transpose(transpose(b).reverse().map((row) => compress(row, add))).reverse();
    else if (dir === "down") b = transpose(rev(transpose(b)).map((row) => compress(row, add)));
    else return;
    setScore((v) => v + sc);
    if (!same(before, b)) spawn(b);
    setBoard(b);
    status(b, score() + sc);
  }
  function canMerge(b) {
    for (let r = 0; r < N; r++) for (let q = 0; q < N; q++) {
      if (q < N - 1 && b[r][q] === b[r][q + 1] && b[r][q]) return true;
      if (r < N - 1 && b[r][q] === b[r + 1][q] && b[r][q]) return true;
    }
    return false;
  }
  function status(b, sc) {
    for (let r = 0; r < N; r++) for (let q = 0; q < N; q++) {
      if (b[r][q] === 2048) { setTop("Gewonnen! Score: " + sc); setOver(true); return; }
    }
    const full = b.every((row) => row.every((v) => v !== 0));
    if (full && !canMerge(b)) { setTop("Game Over! Score: " + sc); setOver(true); return; }
    setTop("Score: " + sc + " — Pfeiltasten zum Schieben.");
  }
  function reset() {
    const b = [[0,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0]];
    spawn(b); spawn(b);
    setBoard(b); setScore(0); setOver(false);
    status(b, 0);
  }
  useKeys((e) => {
    if (e.key === "ArrowLeft") { move("left"); e.preventDefault(); }
    else if (e.key === "ArrowRight") { move("right"); e.preventDefault(); }
    else if (e.key === "ArrowUp") { move("up"); e.preventDefault(); }
    else if (e.key === "ArrowDown") { move("down"); e.preventDefault(); }
  });
  createEffect(() => { reset(); });
  return (
    <div>
      <p class="meta">{top()}</p>
      <div style={{ "display": "grid", "grid-template-columns": "repeat(4,64px)", gap: "6px", margin: "1rem 0" }}>
        <For each={board().flat()}>{(v) => (
          <div class="tile" style={{ width: "64px", height: "64px", display: "flex", "align-items": "center", "justify-content": "center", border: "1px solid #2b3644", "font-weight": "bold" }}>{v || ""}</div>
        )}</For>
      </div>
      <button onClick={reset}>Neustart</button>
    </div>
  );
}

/* ---------- TankBlaster ---------- */
export function ViewTank() {
  let cv;
  const W = 480, H = 360;
  const [top, setTop] = createSignal("");
  const [started, setStarted] = createSignal(false);
  let player, bullets, enemies, score, lives, over, last;
  const keys = { left: false, right: false };
  function status(m) { setTop("Score: " + score + " · Leben: " + lives + " — " + m); }
  function reset() {
    player = { x: W / 2 - 20, y: H - 50, w: 40, h: 40, speed: 240, color: "#e74c3c" };
    bullets = []; enemies = []; score = 0; lives = 3; over = false;
    setStarted(false);
    draw(); status("Pfeiltasten links/rechts fahren, Leertaste schießt. Start drücken.");
  }
  function shoot() {
    if (!started() || over) return;
    bullets.push({ x: player.x + player.w / 2 - 2, y: player.y, w: 5, h: 15, speed: 480 });
  }
  function spawnEnemy() {
    if (Math.random() < 0.02) {
      enemies.push({ x: Math.random() * (W - 30), y: 0, w: 30, h: 30, speed: 60 + Math.random() * 140 });
    }
  }
  const hit = (a, b) => a.x < b.x + b.w && a.x + a.w > b.x && a.y < b.y + b.h && a.y + a.h > b.y;
  function step(dt) {
    if (!started() || over) return;
    if (keys.left) player.x = Math.max(0, player.x - player.speed * dt);
    if (keys.right) player.x = Math.min(W - player.w, player.x + player.speed * dt);
    spawnEnemy();
    let i, j;
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
      if (enemies[i].y > H) { enemies.splice(i, 1); lives--; }
      else if (hit(player, enemies[i])) { enemies.splice(i, 1); lives--; }
    }
    if (lives <= 0) { over = true; status("GAME OVER — Neustart unten."); return; }
    status("Weiter so!");
  }
  function draw() {
    const c = cv.getContext("2d");
    c.fillStyle = "#000"; c.fillRect(0, 0, W, H);
    c.fillStyle = player.color; c.fillRect(player.x, player.y, player.w, player.h);
    c.fillStyle = "#f1c40f";
    bullets.forEach((b) => c.fillRect(b.x, b.y, b.w, b.h));
    c.fillStyle = "#2ecc71";
    enemies.forEach((e) => c.fillRect(e.x, e.y, e.w, e.h));
    if (!started()) {
      c.fillStyle = "#fff"; c.textAlign = "center";
      c.font = "bold 30px sans-serif"; c.fillText("TANK BLASTER", W / 2, H / 2 - 10);
      c.font = "15px sans-serif"; c.fillText("Start drücken, dann fahren + schießen", W / 2, H / 2 + 18);
    } else if (over) {
      c.fillStyle = "red"; c.textAlign = "center";
      c.font = "bold 40px sans-serif"; c.fillText("GAME OVER", W / 2, H / 2);
    }
  }
  useKeys((e, isDown) => {
    if (e.key === "ArrowLeft") { keys.left = isDown; if (isDown) e.preventDefault(); }
    else if (e.key === "ArrowRight") { keys.right = isDown; if (isDown) e.preventDefault(); }
    else if (e.key === " " && isDown) { shoot(); e.preventDefault(); }
  });
  let raf;
  function loop(t) {
    if (!last) last = t;
    const dt = Math.min((t - last) / 1000, 0.05); last = t;
    step(dt); draw();
    raf = requestAnimationFrame(loop);
  }
  createEffect(() => {
    reset();
    raf = requestAnimationFrame(loop);
    onCleanup(() => cancelAnimationFrame(raf));
  });
  return (
    <div>
      <p class="meta">{top()}</p>
      <canvas ref={cv} width={W} height={H} tabindex="0" style={{ border: "1px solid #2b3644" }} />
      <div style={{ display: "flex", gap: "6px", margin: "0.5rem 0" }}>
        <button onClick={() => { setStarted(true); if (cv) cv.focus(); status("Los gehts!"); }}>Start</button>
        <button onClick={reset}>Neustart</button>
      </div>
    </div>
  );
}

/* ---------- Tamagotchi ---------- */
export function ViewTama() {
  const KEY = "tama";
  const fresh = () => ({ hunger: 100, happiness: 100, health: 100, age: 0, sleeping: false, alive: true });
  const [pet, setPet] = createSignal(storeGet(KEY, null) || fresh());
  const [msg, setMsg] = createSignal("Kümmere dich um dein Ei: füttern, spielen, schlafen lassen.");
  function save(p) { storeSet(KEY, p); }
  function mood(p) {
    if (!p.alive) return "💀";
    if (p.sleeping) return "😴";
    if (p.health < 25 || p.hunger <= 0) return "🤒";
    if (p.happiness < 30) return "😢";
    if (p.hunger < 30) return "🍽️";
    return "😊";
  }
  function tick() {
    const p = pet();
    if (!p.alive) return;
    const n = { ...p, age: p.age + 1 };
    if (n.sleeping) {
      n.health = Math.min(100, n.health + 4);
      n.hunger = Math.max(0, n.hunger - 1);
    } else {
      n.hunger = Math.max(0, n.hunger - 2);
      n.happiness = Math.max(0, n.happiness - 2);
      if (n.hunger <= 0) n.health = Math.max(0, n.health - 5);
    }
    if (n.health <= 0) { n.alive = false; setMsg("Dein Tamagotchi ist gestorben. Neues Ei unten."); }
    setPet(n); save(n);
  }
  const timer = setInterval(tick, 5000);
  onCleanup(() => clearInterval(timer));
  return (
    <div>
      <p style={{ "font-size": "4rem", margin: "0.5rem 0" }}>{mood(pet())}</p>
      <p class="meta">Hunger {pet().hunger} · Spaß {pet().happiness} · Gesundheit {pet().health} · Alter {pet().age}min{pet().sleeping ? " · schläft" : ""}</p>
      <p class="meta">{msg()}</p>
      <div style={{ display: "flex", gap: "6px", "flex-wrap": "wrap", margin: "0.5rem 0" }}>
        <button disabled={!pet().alive || pet().sleeping} onClick={() => { const p = { ...pet(), hunger: Math.min(100, pet().hunger + 15) }; setPet(p); save(p); setMsg("Nom nom! Hunger +15."); }}>Füttern (+15)</button>
        <button disabled={!pet().alive || pet().sleeping} onClick={() => { const p = { ...pet(), happiness: Math.min(100, pet().happiness + 20), hunger: Math.max(0, pet().hunger - 3) }; setPet(p); save(p); setMsg("Juhu! Spaß +20."); }}>Spielen (+20)</button>
        <button disabled={!pet().alive} onClick={() => { const p = { ...pet(), sleeping: !pet().sleeping }; setPet(p); save(p); setMsg(p.sleeping ? "Gute Nacht… (Gesundheit regeneriert)" : "Guten Morgen!"); }}>Schlafen</button>
        <button onClick={() => { const p = fresh(); setPet(p); save(p); setMsg("Ein neues Ei ist geschlüpft!"); }}>Neues Ei</button>
      </div>
    </div>
  );
}

/* ---------- Audio Visualizer ---------- */
export function ViewViz() {
  let cv;
  const [msg, setMsg] = createSignal("Mikrofon oder Demo-Ton wählen, dann tanzen die Balken.");
  let ac = null, analyser = null, demoNodes = null, stream = null, running = false, raf;
  function ensureCtx() {
    if (!ac) {
      ac = new (window.AudioContext || window.webkitAudioContext)();
      analyser = ac.createAnalyser();
      analyser.fftSize = 2048;
    }
    if (ac.state === "suspended") ac.resume();
  }
  function stopAll() {
    running = false;
    if (demoNodes) { try { demoNodes.osc.stop(); } catch { /* ignore */ } demoNodes = null; }
    if (stream) { stream.getTracks().forEach((t) => t.stop()); stream = null; }
    setMsg("Gestoppt.");
  }
  function draw() {
    if (!running) return;
    const n = analyser.frequencyBinCount;
    const data = new Uint8Array(n);
    analyser.getByteFrequencyData(data);
    const c = cv.getContext("2d");
    c.fillStyle = "#000"; c.fillRect(0, 0, cv.width, cv.height);
    const barW = (cv.width / n) * 2.5;
    let x = 0;
    for (let i = 0; i < n; i++) {
      const h = data[i] * 1.5 * (cv.height / 384);
      c.fillStyle = "hsl(" + Math.round((i / n) * 360) + ",100%,50%)";
      c.fillRect(x, cv.height - h, barW, h);
      x += barW + 1;
      if (x > cv.width) break;
    }
    raf = requestAnimationFrame(draw);
  }
  onCleanup(() => { cancelAnimationFrame(raf); stopAll(); });
  return (
    <div>
      <p class="meta">{msg()}</p>
      <canvas ref={cv} width="480" height="180" style={{ border: "1px solid #2b3644", width: "100%", "max-width": "480px" }} />
      <div style={{ display: "flex", gap: "6px", margin: "0.5rem 0" }}>
        <button onClick={() => {
          ensureCtx(); stopAll();
          if (!navigator.mediaDevices || !navigator.mediaDevices.getUserMedia) {
            setMsg("Kein Mikrofon verfügbar — nimm den Demo-Ton.");
            return;
          }
          navigator.mediaDevices.getUserMedia({ audio: true }).then((s) => {
            stream = s;
            ac.createMediaStreamSource(s).connect(analyser);
            running = true; setMsg("Mikrofon läuft…");
            draw();
          }).catch(() => setMsg("Mikrofon verweigert — nimm den Demo-Ton."));
        }}>Mikrofon starten</button>
        <button onClick={() => {
          ensureCtx(); stopAll();
          const osc = ac.createOscillator(), lfo = ac.createOscillator(), gain = ac.createGain();
          osc.type = "sawtooth"; osc.frequency.value = 110;
          lfo.frequency.value = 2; gain.gain.value = 0.4;
          lfo.connect(gain.gain); osc.connect(analyser); osc.connect(ac.destination);
          osc.start(); lfo.start();
          demoNodes = { osc };
          running = true; setMsg("Demo-Ton läuft…");
          draw();
        }}>Demo-Ton</button>
        <button onClick={stopAll}>Stopp</button>
      </div>
    </div>
  );
}

/* ---------- Theme Park Tycoon ---------- */
const PARK = {
  coaster: { cost: 300, fee: 8, upkeep: 3, thrill: 5, color: "#e74c3c", key: "C" },
  wheel: { cost: 200, fee: 5, upkeep: 2, thrill: 3, color: "#3498db", key: "W" },
  stand: { cost: 100, fee: 3, upkeep: 1, thrill: 1, color: "#f1c40f", key: "S" },
};
export function ViewPark() {
  let cv;
  const COLS = 10, ROWS = 7, T = 46, OX = 10, OY = 10;
  const W = OX * 2 + COLS * T, H = OY * 2 + ROWS * T;
  const [top, setTop] = createSignal("");
  const [sel, setSel] = createSignal("coaster");
  let rides, visitors, money, started, over, won, ticks;
  function status(m) {
    setTop("Tag " + (Math.floor(ticks / 30) + 1) + " · Kasse: €" + money +
      " · Fahrgeschäfte: " + rides.length + " · Besucher: " + visitors.length + " — " + m);
  }
  function reset() {
    rides = []; visitors = []; money = 1000;
    started = false; over = false; won = false; ticks = 0;
    draw(); status("Wähle ein Fahrgeschäft, klicke ein Feld, dann Start.");
  }
  function thrill() {
    let s = 0;
    for (let i = 0; i < rides.length; i++) s += PARK[rides[i].t].thrill;
    return s;
  }
  const occupied = (c, r) => rides.some((rd) => rd.c === c && rd.r === r);
  function step() {
    if (!started || over || won) return;
    ticks++;
    const th = thrill();
    const want = Math.min(20, 1 + Math.floor(th / 3));
    while (visitors.length < want) visitors.push({ ride: -1 });
    let up = 0;
    for (let i = 0; i < rides.length; i++) up += PARK[rides[i].t].upkeep;
    for (let i = 0; i < visitors.length; i++) {
      if (!rides.length) break;
      const ri = Math.floor(Math.random() * rides.length);
      visitors[i].ride = ri;
      money += PARK[rides[ri].t].fee;
    }
    money -= up;
    if (money >= 5000) { won = true; status("5-STERNE-PARK! Ziel erreicht — Neustart unten."); draw(); return; }
    if (money < 0) { over = true; status("BANKROTT — Neustart unten."); draw(); return; }
    status(rides.length ? "Läuft." : "Baue erst Fahrgeschäfte.");
    draw();
  }
  function draw() {
    const c = cv.getContext("2d");
    c.fillStyle = "#0b3d1b"; c.fillRect(0, 0, W, H);
    for (let cc = 0; cc < COLS; cc++) for (let r = 0; r < ROWS; r++) {
      c.strokeStyle = "#1d5c2e";
      c.strokeRect(OX + cc * T, OY + r * T, T, T);
    }
    c.fillStyle = "#7cc4ff";
    c.fillRect(OX, OY + (ROWS - 1) * T, T, T);
    c.fillStyle = "#000"; c.font = "bold 16px sans-serif"; c.textAlign = "center";
    c.fillText("IN", OX + T / 2, OY + (ROWS - 1) * T + T / 2 + 6);
    for (let i = 0; i < rides.length; i++) {
      const rd = rides[i], p = PARK[rd.t];
      c.fillStyle = p.color;
      c.fillRect(OX + rd.c * T + 3, OY + rd.r * T + 3, T - 6, T - 6);
      c.fillStyle = "#000";
      c.fillText(p.key, OX + rd.c * T + T / 2, OY + rd.r * T + T / 2 + 6);
    }
    c.fillStyle = "#ffe14d";
    for (let i = 0; i < visitors.length; i++) {
      const v = visitors[i];
      let vx, vy;
      if (v.ride >= 0 && v.ride < rides.length) {
        vx = OX + rides[v.ride].c * T + (i * 13) % (T - 8) + 4;
        vy = OY + rides[v.ride].r * T + 8 + Math.floor((i * 13) / (T - 8)) * 8 % (T - 12);
      } else {
        vx = OX + 8 + (i * 17) % (COLS * T - 16);
        vy = OY + (ROWS - 1) * T + T / 2;
      }
      c.beginPath(); c.arc(vx, vy, 3, 0, Math.PI * 2); c.fill();
    }
    if (!started) {
      c.fillStyle = "#fff"; c.textAlign = "center";
      c.font = "bold 28px sans-serif"; c.fillText("D5 PARK", W / 2, 60);
      c.font = "15px sans-serif"; c.fillText("Bauen, dann Start drücken", W / 2, 86);
    }
  }
  const timer = setInterval(() => step(), 1000);
  createEffect(() => { reset(); });
  onCleanup(() => clearInterval(timer));
  return (
    <div>
      <p class="meta">{top()}</p>
      <canvas ref={cv} width={W} height={H} style={{ border: "1px solid #2b3644" }}
        onClick={(e) => {
          if (over || won) return;
          const rect = cv.getBoundingClientRect();
          const x = (e.clientX - rect.left) * (cv.width / rect.width);
          const y = (e.clientY - rect.top) * (cv.height / rect.height);
          const c = Math.floor((x - OX) / T), r = Math.floor((y - OY) / T);
          if (c < 0 || c >= COLS || r < 0 || r >= ROWS) return;
          if (occupied(c, r)) { status("Feld belegt."); return; }
          const p = PARK[sel()];
          if (money < p.cost) { status("Zu teuer — " + sel() + " kostet €" + p.cost + "."); return; }
          money -= p.cost;
          rides.push({ c, r, t: sel() });
          status(sel() + " gebaut. Noch €" + money + ".");
          draw();
        }} />
      <div style={{ display: "flex", gap: "6px", "flex-wrap": "wrap", margin: "0.5rem 0" }}>
        <For each={["coaster","wheel","stand"]}>{(k) => (
          <button onClick={() => { setSel(k); status("Baue " + k + ": freies Feld anklicken."); }}>
            {PARK[k].key}: {k} (€{PARK[k].cost})
          </button>
        )}</For>
        <button onClick={() => { if (!rides.length) { status("Erst mindestens ein Fahrgeschäft bauen."); return; } started = true; if (cv) cv.focus(); status("Geöffnet!"); }}>Start</button>
        <button onClick={reset}>Neustart</button>
      </div>
    </div>
  );
}
