/* BedWars / BuildFFA / ClanWars — ported from app/mc-games.js. */
import { createSignal, createEffect, onCleanup, For } from "solid-js";
import { storeGet, storeSet } from "../store.js";

function useKeys(handler) {
  const down = (e) => handler(e, true);
  const up = (e) => handler(e, false);
  document.addEventListener("keydown", down);
  document.addEventListener("keyup", up);
  onCleanup(() => { document.removeEventListener("keydown", down); document.removeEventListener("keyup", up); });
}
const dist2 = (ax, ay, bx, by) => Math.sqrt((ax - bx) ** 2 + (ay - by) ** 2);

/* ---------- BedWars ---------- */
export function ViewBedwars() {
  let cv;
  const [msg, setMsg] = createSignal("WASD/Pfeile laufen · Eisen-Orbs in der Mitte einsammeln · am blauen Bett ANGRIFF (Leertaste) · Shop unten.");
  const [stats, setStats] = createSignal("Siege: 0 · Niederlagen: 0");
  const [shopTick, setShopTick] = createSignal(0);
  let S;
  const mkSide = (ai, x) => ({ ai, bed: 100, shield: 0, maxShield: 0, obsidian: 0, spike: false, sword: 1, gen: 1, iron: 0, gold: 0, hp: 20, alive: true, respawn: 0, x, y: 100, cool: 0 });
  function reset() {
    S = { you: mkSide(false, 60), bot: mkSide(true, 420), over: false, tick: 0, orbs: [], keys: {}, melee: 0 };
    const lb = storeGet("bw-lb", { w: 0, l: 0 });
    setStats("Siege: " + lb.w + " · Niederlagen: " + lb.l);
    setShopTick((v) => v + 1);
  }
  const cost = (n) => n * 10;
  function damageBed(def, raw, atkName) {
    let d = raw;
    d = Math.max(1, Math.round(d * (1 - def.obsidian * 0.2)));
    if (def.shield > 0) { const ab = Math.min(def.shield, d); def.shield -= ab; d -= ab; }
    def.bed -= d;
    let reflected = 0;
    if (def.spike) { reflected = Math.ceil(raw * 0.5); def.spike = false; }
    if (def.bed <= 0) { def.bed = 0; setMsg(atkName + " hat das Bett zerstört!"); }
    return reflected;
  }
  function attack(a, d, an, dn) {
    if (!a.alive || !d.alive) return;
    an = an || "Du"; dn = dn || "Bot";
    const raw = a.sword * 8 + Math.floor(Math.random() * 6);
    const refl = damageBed(d, raw, an);
    if (refl) { a.hp -= refl; setMsg("Stachelfalle! " + an + " nimmt " + refl + " Schaden."); }
    a.hp -= 2 + Math.floor(Math.random() * 4);
    if (a.hp <= 0) {
      a.hp = 0; a.alive = false;
      const bedGone = (a === S.you ? S.you : S.bot).bed <= 0;
      if (bedGone) return end(d === S.you ? "you" : "bot");
      a.respawn = 3;
      setMsg(an + " gefallen — Respawn in 3s" + (a.bed <= 0 ? "" : " (Bett steht)."));
    }
    setShopTick((v) => v + 1); draw();
  }
  function strike() {
    if (!S.you.alive || S.over) return;
    if (S.bot.bed > 0 && dist2(S.you.x, S.you.y, 420, 145) < 75) attack(S.you, S.bot, "Du", "Bot");
    else if (S.bot.alive && dist2(S.you.x, S.you.y, S.bot.x, S.bot.y) < 32) {
      S.bot.hp -= 4 + S.you.sword * 2;
      if (S.bot.hp <= 0) {
        S.bot.hp = 0; S.bot.alive = false;
        if (S.bot.bed <= 0) return end("you");
        S.bot.respawn = 3; setMsg("Bot ausgeschaltet! Sein Bett steht noch — bleib dran.");
      } else setMsg("Treffer! Bot-HP: " + S.bot.hp);
    } else setMsg("Zu weit weg — lauf ans blaue Bett (rechts) oder zum Bot!");
    setShopTick((v) => v + 1); draw();
  }
  function end(winner) {
    if (S.over) return; S.over = true;
    const lb = storeGet("bw-lb", { w: 0, l: 0 });
    if (winner === "you") { lb.w++; setMsg("SIEG! Das blaue Team ist ausgeschaltet."); }
    else { lb.l++; setMsg("NIEDERLAGE! Dein Bett und dein Leben sind weg."); }
    storeSet("bw-lb", lb);
    setStats("Siege: " + lb.w + " · Niederlagen: " + lb.l);
    setShopTick((v) => v + 1); draw();
  }
  function step() {
    if (S.over) return;
    S.tick++;
    [S.you, S.bot].forEach((s, i) => {
      s.iron += 1 * s.gen; s.gold += 0.2 * s.gen;
      if (s.maxShield && s.shield < s.maxShield) s.shield = Math.min(s.maxShield, s.shield + 1);
      if (!s.alive && s.respawn > 0 && --s.respawn <= 0) { s.alive = true; s.hp = 20; s.x = i === 0 ? 60 : 420; s.y = 100; }
    });
    if (S.tick % 2 === 0 && S.orbs.length < 6) S.orbs.push({ x: 180 + Math.random() * 120, y: 60 + Math.random() * 100 });
    if (S.tick % 45 === 0) {
      const m = 10 + Math.floor(Math.random() * 11);
      S.you.bed = Math.max(0, S.you.bed - m); S.bot.bed = Math.max(0, S.bot.bed - m);
      setMsg("Meteorschauer! Beide Betten nehmen " + m + " Schaden.");
    }
    if (S.tick % 4 === 0) {
      const b = S.bot;
      if (b.iron >= 20 && b.sword < 3 && Math.random() < 0.4) { b.iron -= cost(b.sword); b.sword++; }
      else if (b.iron >= 20 && b.obsidian < 2 && Math.random() < 0.3) { b.iron -= cost(b.obsidian + 1); b.obsidian++; }
      else if (b.alive && S.you.bed > 0 && dist2(b.x, b.y, 60, 145) < 75 && Math.random() < 0.7) attack(b, S.you, "Bot", "Du");
    }
    if (S.you.bed <= 0 && !S.you.alive) return end("bot");
    if (S.bot.bed <= 0 && !S.bot.alive) return end("you");
    setShopTick((v) => v + 1); draw();
  }
  function bar(c, x, y, w, label, frac, color) {
    c.fillStyle = "#333"; c.fillRect(x, y, w, 10);
    c.fillStyle = color; c.fillRect(x, y, w * Math.max(0, Math.min(1, frac)), 10);
    c.fillStyle = "#fff"; c.font = "10px sans-serif"; c.fillText(label, x, y - 3);
  }
  function draw() {
    const c = cv.getContext("2d");
    c.fillStyle = "#000"; c.fillRect(0, 0, 480, 200);
    c.fillStyle = "#1a1a1a"; c.fillRect(150, 40, 180, 120);
    S.orbs.forEach((o) => { c.fillStyle = "#ccc"; c.beginPath(); c.arc(o.x, o.y, 5, 0, Math.PI * 2); c.fill(); });
    if (S.you.alive) { c.fillStyle = "#f44"; c.fillRect(S.you.x - 8, S.you.y - 8, 16, 16); }
    if (S.bot.alive) { c.fillStyle = "#44f"; c.fillRect(S.bot.x - 8, S.bot.y - 8, 16, 16); }
    c.fillStyle = S.you.bed > 0 ? "#f88" : "#555"; c.fillRect(30, 135, 60, 20);
    c.fillStyle = S.bot.bed > 0 ? "#88f" : "#555"; c.fillRect(390, 135, 60, 20);
    if (!S.you.alive) { c.fillStyle = "#fff"; c.fillText("RESPAWN " + S.you.respawn, 30, 80); }
    if (!S.bot.alive) { c.fillStyle = "#fff"; c.fillText("RESPAWN " + S.bot.respawn, 390, 80); }
    bar(c, 30, 30, 120, "Dein Bett", S.you.bed / 100, "#f44");
    bar(c, 330, 30, 120, "Bot-Bett", S.bot.bed / 100, "#44f");
    bar(c, 30, 55, 120, "Dein HP", S.you.hp / 20, "#0f0");
    bar(c, 330, 55, 120, "Bot HP", S.bot.hp / 20, "#0f0");
  }
  const secTimer = setInterval(() => step(), 1000);
  useKeys((e, isDown) => {
    const k = e.key.toLowerCase();
    if (isDown && ["arrowup","arrowdown","arrowleft","arrowright"," "].includes(k)) e.preventDefault();
    S.keys[k] = isDown;
    if (k === " " && isDown && !S.over) strike();
  });
  let raf, mvLast;
  function mv(t) {
    if (!mvLast) mvLast = t;
    const dt = Math.min((t - mvLast) / 1000, 0.05); mvLast = t;
    if (!S.over && S.you.alive) {
      const sp = 130 * dt, k = S.keys;
      if (k.a || k.arrowleft) S.you.x -= sp;
      if (k.d || k.arrowright) S.you.x += sp;
      if (k.w || k.arrowup) S.you.y -= sp;
      if (k.s || k.arrowdown) S.you.y += sp;
      S.you.x = Math.max(10, Math.min(470, S.you.x));
      S.you.y = Math.max(10, Math.min(190, S.you.y));
      for (let i = S.orbs.length - 1; i >= 0; i--) {
        if (dist2(S.you.x, S.you.y, S.orbs[i].x, S.orbs[i].y) < 15) {
          S.orbs.splice(i, 1); S.you.iron += 5; setShopTick((v) => v + 1);
        }
      }
    }
    if (!S.over && S.bot.alive) {
      const b = S.bot;
      let tgt = null, bd = 1e9;
      S.orbs.forEach((o) => { const d = dist2(b.x, b.y, o.x, o.y); if (d < bd) { bd = d; tgt = o; } });
      const gx = tgt ? tgt.x : 90, gy = tgt ? tgt.y : 140;
      const dx = gx - b.x, dy = gy - b.y, dd = Math.sqrt(dx * dx + dy * dy) || 1;
      if (dd > (tgt ? 12 : 50)) { b.x += dx / dd * 95 * dt; b.y += dy / dd * 95 * dt; }
      else if (!tgt && S.you.bed > 0) { if (b.cool <= 0) { b.cool = 2.5; attack(b, S.you, "Bot", "Du"); } }
      else if (tgt && bd < 15) { S.orbs.splice(S.orbs.indexOf(tgt), 1); b.iron += 5; }
      if (b.cool > 0) b.cool -= dt;
      if (S.melee <= 0 && S.you.alive && dist2(S.you.x, S.you.y, b.x, b.y) < 24) {
        S.melee = 0.8; S.you.hp -= 3; b.hp -= 2 + S.you.sword;
        if (S.you.hp <= 0) {
          S.you.hp = 0; S.you.alive = false;
          if (S.you.bed <= 0) return end("bot");
          S.you.respawn = 3;
        }
        if (b.hp <= 0) {
          b.hp = 0; b.alive = false;
          if (S.bot.bed <= 0) return end("you");
          b.respawn = 3;
        }
        setShopTick((v) => v + 1);
      }
      if (S.melee > 0) S.melee -= dt;
    }
    draw();
    raf = requestAnimationFrame(mv);
  }
  createEffect(() => {
    reset();
    raf = requestAnimationFrame(mv);
  });
  onCleanup(() => { clearInterval(secTimer); cancelAnimationFrame(raf); });
  function buy(label, price, fn) {
    return (
      <button disabled={S.over || S.you.iron < price} onClick={() => { if (S.over || S.you.iron < price) return; S.you.iron -= price; fn(); setShopTick((v) => v + 1); }}>
        {label} ({price} Eisen)
      </button>
    );
  }
  return (
    <div>
      <canvas ref={cv} width="480" height="200" style={{ border: "1px solid #2b3644" }} />
      <p class="meta">{msg()}</p>
      <p class="meta">{stats()}</p>
      <div class="tool-form">
        {(() => { shopTick(); return null; })()}
        {S.over ? (
          <button onClick={reset}>Neustart</button>
        ) : (
          <>
            <p class="meta">Eisen: {Math.floor(S.you.iron)} · Gold: {Math.floor(S.you.gold)} · Schwert T{S.you.sword} · Obsidian {S.you.obsidian} · Schild {S.you.shield}/{S.you.maxShield} · Generator T{S.you.gen}</p>
            {buy("Schwert-Upgrade", cost(S.you.sword), () => { S.you.sword++; })}
            {buy("Obsidian-Schicht", cost(S.you.obsidian + 1), () => { if (S.you.obsidian < 3) S.you.obsidian++; })}
            {buy("Regenerations-Schild", 20, () => { S.you.maxShield += 50; S.you.shield = S.you.maxShield; })}
            {!S.you.spike && buy("Stachelfalle", 30, () => { S.you.spike = true; })}
            {buy("Generator-Upgrade", cost(S.you.gen), () => { S.you.gen++; })}
            <button onClick={strike}>ANGRIFF! (Leertaste)</button>
          </>
        )}
      </div>
    </div>
  );
}

/* ---------- BuildFFA ---------- */
export function ViewBuildffa() {
  let cv;
  const W = 480, H = 300;
  const [msg, setMsg] = createSignal("Pfeiltasten/WASD bewegen, Leertaste schlagen. 3 Bots.");
  const [board, setBoard] = createSignal("Kills: 0 · Deaths: 0 · K/D: 0 · Best-Streak: 0");
  let P, bots;
  const keys = {};
  function stats() { return storeGet("bffa-stats", { k: 0, d: 0, best: 0 }); }
  const kd = (k, d) => d === 0 ? k : Math.round(k / d * 100) / 100;
  function drawBoard() {
    const s = stats();
    setBoard("Kills: " + s.k + " · Deaths: " + s.d + " · K/D: " + kd(s.k, s.d) + " · Best-Streak: " + s.best);
  }
  function reset() {
    P = { x: 240, y: 150, hp: 20, streak: 0, cool: 0 };
    bots = [];
    for (let i = 0; i < 3; i++) bots.push({ x: 60 + i * 160, y: 60 + (i % 2) * 140, hp: 20, cool: 0 });
    drawBoard();
  }
  function kill(att, def, an) {
    const s = stats();
    if (att === P) {
      s.k++; P.streak++;
      if (P.streak > s.best) s.best = P.streak;
      setMsg(an + " schaltet einen Bot aus! Streak: " + P.streak);
    } else if (def === P) {
      s.d++; P.streak = 0;
      setMsg("Du wurdest ausgeschaltet! Respawn…");
      P.x = 240; P.y = 150; P.hp = 20;
    }
    def.x = 10 + Math.random() * (W - 20); def.y = 10 + Math.random() * (H - 20); def.hp = 20;
    storeSet("bffa-stats", s); drawBoard();
  }
  function hit(att, def, an) {
    if (def.hp <= 0) return;
    def.hp -= 4 + Math.floor(Math.random() * 3);
    if (def.hp <= 0) kill(att, def, an);
  }
  function step(dt) {
    const sp = 160 * dt;
    if (keys.a || keys.arrowleft) P.x -= sp;
    if (keys.d || keys.arrowright) P.x += sp;
    if (keys.w || keys.arrowup) P.y -= sp;
    if (keys.s || keys.arrowdown) P.y += sp;
    P.x = Math.max(8, Math.min(W - 8, P.x)); P.y = Math.max(8, Math.min(H - 8, P.y));
    if (P.cool > 0) P.cool -= dt;
    bots.forEach((b, i) => {
      const dx = P.x - b.x, dy = P.y - b.y, dist = Math.sqrt(dx * dx + dy * dy) || 1;
      b.x += dx / dist * 90 * dt; b.y += dy / dist * 90 * dt;
      if (b.cool > 0) b.cool -= dt;
      if (dist < 26 && b.cool <= 0) { b.cool = 0.9; hit(b, P, "Bot " + (i + 1)); }
    });
  }
  function draw() {
    const c = cv.getContext("2d");
    c.fillStyle = "#0a0f0a"; c.fillRect(0, 0, W, H);
    c.strokeStyle = "#223"; c.strokeRect(4, 4, W - 8, H - 8);
    bots.forEach((b, i) => {
      c.fillStyle = "#f80"; c.fillRect(b.x - 8, b.y - 8, 16, 16);
      c.fillStyle = "#fff"; c.font = "10px sans-serif"; c.fillText("B" + (i + 1), b.x - 6, b.y - 12);
    });
    c.fillStyle = "#0c0"; c.fillRect(P.x - 8, P.y - 8, 16, 16);
    c.fillStyle = "#fff"; c.fillText("DU " + P.hp + "HP", P.x - 16, P.y - 12);
  }
  useKeys((e, isDown) => {
    const k = e.key.toLowerCase();
    if (isDown && ["arrowup","arrowdown","arrowleft","arrowright"," "].includes(k)) e.preventDefault();
    keys[k] = isDown;
    if (k === " " && isDown && P.cool <= 0) {
      P.cool = 0.5;
      let best = null, bd = 30;
      bots.forEach((b) => {
        const d = Math.sqrt((b.x - P.x) ** 2 + (b.y - P.y) ** 2);
        if (d < bd) { bd = d; best = b; }
      });
      if (best) hit(P, best, "Du");
    }
  });
  let raf, last;
  function loop(t) {
    if (!last) last = t;
    const dt = Math.min((t - last) / 1000, 0.05); last = t;
    step(dt); draw();
    raf = requestAnimationFrame(loop);
  }
  createEffect(() => {
    reset();
    raf = requestAnimationFrame(loop);
  });
  onCleanup(() => cancelAnimationFrame(raf));
  return (
    <div>
      <canvas ref={cv} width={W} height={H} tabindex="0" style={{ border: "1px solid #2b3644" }} />
      <p class="meta">{msg()}</p>
      <p class="meta">{board()}</p>
    </div>
  );
}

/* ---------- ClanWars ---------- */
export function ViewClanwars() {
  const [tick, setTick] = createSignal(0);
  const [msg, setMsg] = createSignal("Gründe einen Clan, wirb Mitglieder, fordere KI-Clans und klettere im Rating.");
  const [tagInput, setTagInput] = createSignal("");
  const [nameInput, setNameInput] = createSignal("");
  function data() { return storeGet("cw", { clans: {}, mine: null }); }
  function ensureBots(d) {
    [["CR", "Crimson", 1200], ["VB", "VoidBorn", 1100], ["AS", "Ashen", 1000]].forEach((b) => {
      if (!d.clans[b[0]]) d.clans[b[0]] = { tag: b[0], name: b[1], rating: b[2], members: 5, wins: 0, losses: 0 };
    });
    return d;
  }
  function battle(foeTag) {
    const d = data(); const me = d.clans[d.mine], foe = d.clans[foeTag];
    if (!me || !foe || battle._on) return;
    battle._on = true;
    const power = me.members * (0.8 + Math.random() * 0.4) + me.rating / 200;
    const fpower = foe.members * (0.8 + Math.random() * 0.4) + foe.rating / 200;
    let myPow = 50, foPow = 50, n = 0;
    setMsg("[" + d.mine + "] gegen [" + foeTag + "] — Kampf läuft!");
    const bt = setInterval(() => {
      n++;
      myPow += (power > fpower ? 1 : -1) * (2 + Math.random() * 4);
      foPow += (fpower >= power ? 1 : -1) * (2 + Math.random() * 4);
      setMsg("[" + d.mine + "] " + Math.max(0, Math.round(myPow)) + " gegen " +
        Math.max(0, Math.round(foPow)) + " [" + foeTag + "] (Runde " + n + "/8)");
      if (n >= 8) {
        clearInterval(bt); battle._on = false;
        const dd = data(); const m2 = dd.clans[dd.mine], f2 = dd.clans[foeTag];
        if (!m2 || !f2) { setTick((v) => v + 1); return; }
        if (power >= fpower) {
          m2.rating += 16; f2.rating = Math.max(0, f2.rating - 16); m2.wins++; f2.losses++;
          setMsg("SIEG gegen [" + foeTag + "]! +16 Rating.");
        } else {
          m2.rating = Math.max(0, m2.rating - 16); f2.rating += 16; m2.losses++; f2.wins++;
          setMsg("NIEDERLAGE gegen [" + foeTag + "]. -16 Rating. Wirb Mitglieder und versuch es erneut.");
        }
        storeSet("cw", dd); setTick((v) => v + 1);
      }
    }, 400);
    onCleanup(() => { clearInterval(bt); battle._on = false; });
  }
  const d = () => ensureBots(data());
  return (
    <div>
      <p class="meta">{msg()}</p>
      {(() => {
        tick();
        const dd = d();
        return (
          <>
            <div class="tool-form">
              {!dd.mine || !dd.clans[dd.mine] ? (
                <>
                  <input placeholder="Clan-Tag (max 4)" value={tagInput()} onInput={(e) => setTagInput(e.target.value)} />
                  <input placeholder="Clan-Name" value={nameInput()} onInput={(e) => setNameInput(e.target.value)} />
                  <button onClick={() => {
                    const tag = (tagInput() || "").trim().toUpperCase().slice(0, 4);
                    if (!tag) { setMsg("Gib einen Tag ein."); return; }
                    const cur = data();
                    if (cur.clans[tag]) { setMsg("Tag vergeben."); return; }
                    cur.clans[tag] = { tag, name: nameInput().trim() || tag, rating: 1000, members: 1, wins: 0, losses: 0 };
                    cur.mine = tag; storeSet("cw", cur); setTick((v) => v + 1);
                  }}>Clan gründen</button>
                </>
              ) : (
                <>
                  <button onClick={() => { const cur = data(); cur.clans[cur.mine].members++; storeSet("cw", cur); setTick((v) => v + 1); }}>Mitglied werben</button>
                  <For each={Object.keys(dd.clans).filter((t) => t !== dd.mine)}>{(t) => (
                    <button onClick={() => battle(t)}>{dd.clans[t].tag} herausfordern ({dd.clans[t].rating})</button>
                  )}</For>
                </>
              )}
            </div>
            <div>
              <h3>Bestenliste (Rating)</h3>
              <For each={Object.keys(dd.clans).map((t) => dd.clans[t]).sort((a, b) => b.rating - a.rating)}>
                {(c, i) => <p class="meta">{i() + 1}. [{c.tag}] {c.name} — {c.rating} ({c.wins}S/{c.losses}N, {c.members} Mitgl.)</p>}
              </For>
            </div>
          </>
        );
      })()}
    </div>
  );
}
