// Native web rewrites of the Java Minecraft plugins BedWars, BuildFFA and
// ClanWars. Bukkit/Spigot APIs cannot run in a browser, so each plugin's
// portable rules are re-implemented: BedWars beds/reinforcements/shop/events,
// BuildFFA kills-deaths-KD stats, ClanWars clans/ratings/battle requests.
// Persistence is localStorage (the originals used MySQL/SQLite).
window.d5McGames = (function () {
  var __mount = 0;
  function el(tag, text, attrs) {
    var e = document.createElement(tag);
    if (text != null) e.textContent = text;
    if (attrs) for (var k in attrs) e.setAttribute(k, attrs[k]);
    return e;
  }
  function store(k, d) {
    try { var v = localStorage.getItem('d5:' + k); return v == null ? d : JSON.parse(v); }
    catch (e) { return d; }
  }
  function save(k, v) { try { localStorage.setItem('d5:' + k, JSON.stringify(v)); } catch (e) {} }

  // ---------- BedWars (org.bedwars.bedwarsproject) ----------
  // Bed: HP + destroyed flag + reinforcements (OBSIDIAN_LAYER,
  // REGENERATING_SHIELD +50 max/level, SPIKE_TRAP reflect). Team: ability
  // cooldown in ticks/20. Events: FogEvent, MeteorShowerEvent via EventManager.
  function viewBedwars(root) {
    var my = ++__mount;
    var wrap = el('div');
    var cv = el('canvas', null, { width: 480, height: 200 });
    cv.style.border = '1px solid #2b3644';
    var msg = el('p', 'WASD/Pfeile laufen · Eisen-Orbs in der Mitte einsammeln · am blauen Bett ANGRIFF (Leertaste) · Shop unten.', { 'class': 'meta' });
    var stats = el('p', '', { 'class': 'meta' });
    wrap.appendChild(cv); wrap.appendChild(msg); wrap.appendChild(stats);
    var shop = el('div', null, { 'class': 'tool-form' });
    wrap.appendChild(shop); root.appendChild(wrap);
    var ctx = cv.getContext('2d');
    var S;
    function mkSide(ai, x) {
      return { ai: ai, bed: 100, shield: 0, maxShield: 0, obsidian: 0, spike: false,
        sword: 1, gen: 1, iron: 0, gold: 0, hp: 20, alive: true, respawn: 0, x: x, y: 100, cool: 0 };
    }
    function reset() {
      S = { you: mkSide(false, 60), bot: mkSide(true, 420), over: false, tick: 0, orbs: [], keys: {}, melee: 0 };
      var lb = store('bw-lb', { w: 0, l: 0 });
      stats.textContent = 'Siege: ' + lb.w + ' · Niederlagen: ' + lb.l;
    }
    function cost(n) { return n * 10; }
    function buttons() {
      shop.innerHTML = '';
      if (S.over) {
        var again = el('button', 'Neustart');
        again.addEventListener('click', function () { if (my === __mount) { reset(); buttons(); } });
        shop.appendChild(again); return;
      }
      var y = S.you;
      var info = el('p', 'Eisen: ' + Math.floor(y.iron) + ' · Gold: ' + Math.floor(y.gold) +
        ' · Schwert T' + y.sword + ' · Obsidian ' + y.obsidian + ' · Schild ' + y.shield + '/' + y.maxShield +
        ' · Generator T' + y.gen, { 'class': 'meta' });
      shop.appendChild(info);
      function buy(label, price, fn) {
        var b = el('button', label + ' (' + price + ' Eisen)');
        b.disabled = y.iron < price;
        b.addEventListener('click', function () {
          if (my !== __mount || S.over || S.you.iron < price) return;
          S.you.iron -= price; fn(); buttons();
        });
        shop.appendChild(b);
      }
      buy('Schwert-Upgrade', cost(y.sword), function () { y.sword++; });
      buy('Obsidian-Schicht', cost(y.obsidian + 1), function () { if (y.obsidian < 3) y.obsidian++; });
      buy('Regenerations-Schild', 20, function () { y.maxShield += 50; y.shield = y.maxShield; });
      if (!y.spike) buy('Stachelfalle', 30, function () { y.spike = true; });
      buy('Generator-Upgrade', cost(y.gen), function () { y.gen++; });
      var atk = el('button', 'ANGRIFF! (Leertaste)');
      atk.addEventListener('click', function () { if (my === __mount && !S.over) strike(); });
      shop.appendChild(atk);
    }
    function dist2(ax, ay, bx, by) { var dx = ax - bx, dy = ay - by; return Math.sqrt(dx * dx + dy * dy); }
    function strike() { // player attack: bed needs range, otherwise melee the bot
      if (!S.you.alive || S.over) return;
      if (S.bot.bed > 0 && dist2(S.you.x, S.you.y, 420, 145) < 75) attack(S.you, S.bot, 'Du', 'Bot');
      else if (S.bot.alive && dist2(S.you.x, S.you.y, S.bot.x, S.bot.y) < 32) {
        S.bot.hp -= 4 + S.you.sword * 2;
        if (S.bot.hp <= 0) {
          S.bot.hp = 0; S.bot.alive = false;
          if (S.bot.bed <= 0) return end('you');
          S.bot.respawn = 3; msg.textContent = 'Bot ausgeschaltet! Sein Bett steht noch — bleib dran.';
        } else msg.textContent = 'Treffer! Bot-HP: ' + S.bot.hp;
      } else msg.textContent = 'Zu weit weg — lauf ans blaue Bett (rechts) oder zum Bot!';
      buttons(); draw();
    }
    function damageBed(def, raw, atkName) {
      var d = raw;
      d = Math.max(1, Math.round(d * (1 - def.obsidian * 0.2))); // obsidian: -20%/level
      if (def.shield > 0) { // regenerating shield absorbs first
        var ab = Math.min(def.shield, d); def.shield -= ab; d -= ab;
      }
      def.bed -= d;
      var reflected = 0;
      if (def.spike) { reflected = Math.ceil(raw * 0.5); def.spike = false; } // one-shot trap
      if (def.bed <= 0) { def.bed = 0; msg.textContent = atkName + ' hat das Bett zerstört!'; }
      return reflected;
    }
    function attack(a, d, an, dn) {
      if (!a.alive || !d.alive) return;
      an = an || 'Du'; dn = dn || 'Bot';
      var raw = a.sword * 8 + Math.floor(Math.random() * 6);
      var refl = damageBed(d, raw, an);
      if (refl) { a.hp -= refl; msg.textContent = 'Stachelfalle! ' + an + ' nimmt ' + refl + ' Schaden.'; }
      // counter: defender strikes the attacker directly
      a.hp -= 2 + Math.floor(Math.random() * 4);
      if (a.hp <= 0) {
        a.hp = 0; a.alive = false;
        var bedGone = (a === S.you ? S.you : S.bot).bed <= 0;
        if (bedGone) return end(d === S.you ? 'you' : 'bot');
        a.respawn = 3;
        msg.textContent = an + ' gefallen — Respawn in 3s' + (a.bed <= 0 ? '' : ' (Bett steht).');
      }
      buttons(); draw();
    }
    function attackYou() { return attack(S.you, S.bot, 'Du', 'Bot'); }
    function attackBot() { return attack(S.bot, S.you, 'Bot', 'Du'); }
    function end(winner) {
      if (S.over) return; S.over = true;
      var lb = store('bw-lb', { w: 0, l: 0 });
      if (winner === 'you') { lb.w++; msg.textContent = 'SIEG! Das blaue Team ist ausgeschaltet.'; }
      else { lb.l++; msg.textContent = 'NIEDERLAGE! Dein Bett und dein Leben sind weg.'; }
      save('bw-lb', lb);
      stats.textContent = 'Siege: ' + lb.w + ' · Niederlagen: ' + lb.l;
      buttons(); draw();
    }
    function step() {
      if (S.over) return;
      S.tick++;
      [S.you, S.bot].forEach(function (s, i) { // ResourceGenerator tick
        s.iron += 1 * s.gen; s.gold += 0.2 * s.gen;
        if (s.maxShield && s.shield < s.maxShield) s.shield = Math.min(s.maxShield, s.shield + 1); // regen
        if (!s.alive && s.respawn > 0 && --s.respawn <= 0) { s.alive = true; s.hp = 20; s.x = i === 0 ? 60 : 420; s.y = 100; }
      });
      if (S.tick % 2 === 0 && S.orbs.length < 6) // center generator drops iron orbs
        S.orbs.push({ x: 180 + Math.random() * 120, y: 60 + Math.random() * 100 });
      if (S.tick % 45 === 0) { // MeteorShowerEvent: hits both beds
        var m = 10 + Math.floor(Math.random() * 11);
        S.you.bed = Math.max(0, S.you.bed - m); S.bot.bed = Math.max(0, S.bot.bed - m);
        msg.textContent = 'Meteorschauer! Beide Betten nehmen ' + m + ' Schaden.';
      }
      if (S.tick % 4 === 0) { // bot AI: upgrade or raid your bed (needs range)
        var b = S.bot;
        if (b.iron >= 20 && b.sword < 3 && Math.random() < 0.4) { b.iron -= cost(b.sword); b.sword++; }
        else if (b.iron >= 20 && b.obsidian < 2 && Math.random() < 0.3) { b.iron -= cost(b.obsidian + 1); b.obsidian++; }
        else if (b.alive && S.you.bed > 0 && dist2(b.x, b.y, 60, 145) < 75 && Math.random() < 0.7) attackBot();
      }
      if (S.you.bed <= 0 && !S.you.alive) return end('bot');
      if (S.bot.bed <= 0 && !S.bot.alive) return end('you');
      buttons(); draw();
    }
    function bar(x, y, w, label, frac, color) {
      ctx.fillStyle = '#333'; ctx.fillRect(x, y, w, 10);
      ctx.fillStyle = color; ctx.fillRect(x, y, w * Math.max(0, Math.min(1, frac)), 10);
      ctx.fillStyle = '#fff'; ctx.font = '10px sans-serif'; ctx.fillText(label, x, y - 3);
    }
    function draw() {
      ctx.fillStyle = '#000'; ctx.fillRect(0, 0, 480, 200);
      ctx.fillStyle = '#1a1a1a'; ctx.fillRect(150, 40, 180, 120); // midfield
      S.orbs.forEach(function (o) { // iron orbs
        ctx.fillStyle = '#ccc'; ctx.beginPath(); ctx.arc(o.x, o.y, 5, 0, Math.PI * 2); ctx.fill();
      });
      // you (red) vs bot (blue) at their positions
      if (S.you.alive) { ctx.fillStyle = '#f44'; ctx.fillRect(S.you.x - 8, S.you.y - 8, 16, 16); }
      if (S.bot.alive) { ctx.fillStyle = '#44f'; ctx.fillRect(S.bot.x - 8, S.bot.y - 8, 16, 16); }
      ctx.fillStyle = S.you.bed > 0 ? '#f88' : '#555'; ctx.fillRect(30, 135, 60, 20); // beds
      ctx.fillStyle = S.bot.bed > 0 ? '#88f' : '#555'; ctx.fillRect(390, 135, 60, 20);
      if (!S.you.alive) { ctx.fillStyle = '#fff'; ctx.fillText('RESPAWN ' + S.you.respawn, 30, 80); }
      if (!S.bot.alive) { ctx.fillStyle = '#fff'; ctx.fillText('RESPAWN ' + S.bot.respawn, 390, 80); }
      bar(30, 30, 120, 'Dein Bett', S.you.bed / 100, '#f44');
      bar(330, 30, 120, 'Bot-Bett', S.bot.bed / 100, '#44f');
      bar(30, 55, 120, 'Dein HP', S.you.hp / 20, '#0f0');
      bar(330, 55, 120, 'Bot HP', S.bot.hp / 20, '#0f0');
    }
    var timer = setInterval(function () {
      if (my !== __mount) { clearInterval(timer); return; }
      if (!document.body.contains(cv)) { clearInterval(timer); return; }
      step();
    }, 1000);
    document.addEventListener('keydown', function (e) {
      if (my !== __mount) return;
      var k = e.key.toLowerCase();
      if (['arrowup', 'arrowdown', 'arrowleft', 'arrowright', ' '].indexOf(k) >= 0) e.preventDefault();
      S.keys[k] = true;
      if (k === ' ' && !S.over) strike();
    });
    document.addEventListener('keyup', function (e) { if (my === __mount) S.keys[e.key.toLowerCase()] = false; });
    function mv(t) { // real-time movement + orb pickup + bot raids + brawls
      if (my !== __mount) return;
      if (!mv.last) mv.last = t;
      var dt = Math.min((t - mv.last) / 1000, 0.05); mv.last = t;
      if (!S.over && S.you.alive) {
        var sp = 130 * dt, k = S.keys;
        if (k.a || k.arrowleft) S.you.x -= sp;
        if (k.d || k.arrowright) S.you.x += sp;
        if (k.w || k.arrowup) S.you.y -= sp;
        if (k.s || k.arrowdown) S.you.y += sp;
        S.you.x = Math.max(10, Math.min(470, S.you.x));
        S.you.y = Math.max(10, Math.min(190, S.you.y));
        for (var i = S.orbs.length - 1; i >= 0; i--) { // orb pickup: +5 iron
          if (dist2(S.you.x, S.you.y, S.orbs[i].x, S.orbs[i].y) < 15) {
            S.orbs.splice(i, 1); S.you.iron += 5; buttons();
          }
        }
      }
      if (!S.over && S.bot.alive) { // bot seeks orbs, then raids your bed
        var b = S.bot, tgt = null, bd = 1e9;
        S.orbs.forEach(function (o) { var d = dist2(b.x, b.y, o.x, o.y); if (d < bd) { bd = d; tgt = o; } });
        var gx = tgt ? tgt.x : 90, gy = tgt ? tgt.y : 140;
        var dx = gx - b.x, dy = gy - b.y, dd = Math.sqrt(dx * dx + dy * dy) || 1;
        if (dd > (tgt ? 12 : 50)) { b.x += dx / dd * 95 * dt; b.y += dy / dd * 95 * dt; }
        else if (!tgt && S.you.bed > 0) { if (b.cool <= 0) { b.cool = 2.5; attackBot(); } }
        else if (tgt && bd < 15) { S.orbs.splice(S.orbs.indexOf(tgt), 1); b.iron += 5; }
        if (b.cool > 0) b.cool -= dt;
        if (S.melee <= 0 && S.you.alive && dist2(S.you.x, S.you.y, b.x, b.y) < 24) { // brawl
          S.melee = 0.8; S.you.hp -= 3; b.hp -= 2 + S.you.sword;
          if (S.you.hp <= 0) {
            S.you.hp = 0; S.you.alive = false;
            if (S.you.bed <= 0) return end('bot');
            S.you.respawn = 3;
          }
          if (b.hp <= 0) {
            b.hp = 0; b.alive = false;
            if (S.bot.bed <= 0) return end('you');
            b.respawn = 3;
          }
          buttons();
        }
        if (S.melee > 0) S.melee -= dt;
      }
      draw();
      requestAnimationFrame(mv);
    }
    requestAnimationFrame(mv);
    reset(); buttons(); draw();
  }

  // ---------- BuildFFA (net.bote.bffa) ----------
  // Stats: kills/deaths (MySQL -> localStorage). getKD mirrored except the
  // original returned deaths (0.0) when deaths == 0; the port returns kills.
  function viewBuildffa(root) {
    var my = ++__mount;
    var W = 480, H = 300;
    var wrap = el('div');
    var cv = el('canvas', null, { width: W, height: H });
    cv.style.border = '1px solid #2b3644'; cv.tabIndex = 0;
    var msg = el('p', 'Pfeiltasten/WASD bewegen, Leertaste schlagen. 3 Bots.', { 'class': 'meta' });
    var board = el('p', '', { 'class': 'meta' });
    wrap.appendChild(cv); wrap.appendChild(msg); wrap.appendChild(board);
    root.appendChild(wrap);
    var ctx = cv.getContext('2d');
    var P, bots, keys = {};
    function stats() { return store('bffa-stats', { k: 0, d: 0, best: 0 }); }
    function kd(k, d) { return d === 0 ? k : Math.round(k / d * 100) / 100; }
    function drawBoard() {
      var s = stats();
      board.textContent = 'Kills: ' + s.k + ' · Deaths: ' + s.d + ' · K/D: ' + kd(s.k, s.d) + ' · Best-Streak: ' + s.best;
    }
    function reset() {
      P = { x: 240, y: 150, hp: 20, streak: 0, cool: 0 };
      bots = [];
      for (var i = 0; i < 3; i++) bots.push({ x: 60 + i * 160, y: 60 + (i % 2) * 140, hp: 20, cool: 0 });
      drawBoard();
    }
    function kill(att, def, an) {
      var s = stats();
      if (att === P) {
        s.k++; P.streak++;
        if (P.streak > s.best) s.best = P.streak;
        msg.textContent = an + ' schaltet einen Bot aus! Streak: ' + P.streak;
      } else if (def === P) {
        s.d++; P.streak = 0;
        msg.textContent = 'Du wurdest ausgeschaltet! Respawn…';
        P.x = 240; P.y = 150; P.hp = 20;
      }
      def.x = 10 + Math.random() * (W - 20); def.y = 10 + Math.random() * (H - 20); def.hp = 20;
      save('bffa-stats', s); drawBoard();
    }
    function hit(att, def, an) {
      if (def.hp <= 0) return;
      def.hp -= 4 + Math.floor(Math.random() * 3);
      if (def.hp <= 0) kill(att, def, an);
    }
    function step(dt) {
      var sp = 160 * dt;
      if (keys.a || keys.arrowleft) P.x -= sp;
      if (keys.d || keys.arrowright) P.x += sp;
      if (keys.w || keys.arrowup) P.y -= sp;
      if (keys.s || keys.arrowdown) P.y += sp;
      P.x = Math.max(8, Math.min(W - 8, P.x)); P.y = Math.max(8, Math.min(H - 8, P.y));
      if (P.cool > 0) P.cool -= dt;
      bots.forEach(function (b, i) {
        var dx = P.x - b.x, dy = P.y - b.y, dist = Math.sqrt(dx * dx + dy * dy) || 1;
        b.x += dx / dist * 90 * dt; b.y += dy / dist * 90 * dt;
        if (b.cool > 0) b.cool -= dt;
        if (dist < 26 && b.cool <= 0) { b.cool = 0.9; hit(b, P, 'Bot ' + (i + 1)); }
      });
    }
    function draw() {
      ctx.fillStyle = '#0a0f0a'; ctx.fillRect(0, 0, W, H);
      ctx.strokeStyle = '#223'; ctx.strokeRect(4, 4, W - 8, H - 8);
      bots.forEach(function (b, i) {
        ctx.fillStyle = '#f80'; ctx.fillRect(b.x - 8, b.y - 8, 16, 16);
        ctx.fillStyle = '#fff'; ctx.font = '10px sans-serif'; ctx.fillText('B' + (i + 1), b.x - 6, b.y - 12);
      });
      ctx.fillStyle = '#0c0'; ctx.fillRect(P.x - 8, P.y - 8, 16, 16);
      ctx.fillStyle = '#fff'; ctx.fillText('DU ' + P.hp + 'HP', P.x - 16, P.y - 12);
    }
    function loop(t) {
      if (my !== __mount) return;
      if (!loop.last) loop.last = t;
      var dt = Math.min((t - loop.last) / 1000, 0.05); loop.last = t;
      step(dt); draw();
      requestAnimationFrame(loop);
    }
    document.addEventListener('keydown', function (e) {
      if (my !== __mount) return;
      var k = e.key.toLowerCase();
      if (['arrowup', 'arrowdown', 'arrowleft', 'arrowright', ' '].indexOf(k) >= 0) e.preventDefault();
      keys[k] = true;
      if (k === ' ' && P.cool <= 0) {
        P.cool = 0.5;
        var best = null, bd = 30;
        bots.forEach(function (b) {
          var d = Math.sqrt((b.x - P.x) * (b.x - P.x) + (b.y - P.y) * (b.y - P.y));
          if (d < bd) { bd = d; best = b; }
        });
        if (best) hit(P, best, 'Du');
      }
    });
    document.addEventListener('keyup', function (e) { if (my === __mount) keys[e.key.toLowerCase()] = false; });
    reset();
    requestAnimationFrame(loop);
  }

  // ---------- ClanWars (com.minecraft.clanwars) ----------
  // ClanManager: clans with members/roles/rating, getTopClans by rating desc.
  // BattleManager: requests (PENDING/APPROVED) -> battle -> Elo +-16. DB -> localStorage.
  function viewClanwars(root) {
    var wrap = el('div');
    var msg = el('p', 'Gründe einen Clan, wirb Mitglieder, fordere KI-Clans und klettere im Rating.', { 'class': 'meta' });
    wrap.appendChild(msg);
    var ctl = el('div', null, { 'class': 'tool-form' }); wrap.appendChild(ctl);
    var out = el('div'); wrap.appendChild(out); root.appendChild(wrap);
    function data() { return store('cw', { clans: {}, mine: null }); }
    function ensureBots(d) {
      [['CR', 'Crimson', 1200], ['VB', 'VoidBorn', 1100], ['AS', 'Ashen', 1000]].forEach(function (b) {
        if (!d.clans[b[0]]) d.clans[b[0]] = { tag: b[0], name: b[1], rating: b[2], members: 5, wins: 0, losses: 0 };
      });
    }
    function render() {
      var d = data(); ensureBots(d); save('cw', d);
      ctl.innerHTML = ''; out.innerHTML = '';
      if (!d.mine || !d.clans[d.mine]) {
        var inp = el('input', null, { placeholder: 'Clan-Tag (max 4)' });
        var nm = el('input', null, { placeholder: 'Clan-Name' });
        var go = el('button', 'Clan gründen');
        go.addEventListener('click', function () {
          var tag = (inp.value || '').trim().toUpperCase().slice(0, 4);
          if (!tag) { msg.textContent = 'Gib einen Tag ein.'; return; }
          var dd = data();
          if (dd.clans[tag]) { msg.textContent = 'Tag vergeben.'; return; }
          dd.clans[tag] = { tag: tag, name: nm.value.trim() || tag, rating: 1000, members: 1, wins: 0, losses: 0 };
          dd.mine = tag; save('cw', dd); render();
        });
        ctl.appendChild(inp); ctl.appendChild(nm); ctl.appendChild(go);
      } else {
        var add = el('button', 'Mitglied werben');
        add.addEventListener('click', function () {
          var dd = data(); dd.clans[dd.mine].members++; save('cw', dd); render();
        });
        ctl.appendChild(add);
        Object.keys(d.clans).forEach(function (t) {
          if (t === d.mine) return;
          var foe = d.clans[t];
          var b = el('button', foe.tag + ' herausfordern (' + foe.rating + ')');
          b.addEventListener('click', function () { battle(foe.tag); });
          ctl.appendChild(b);
        });
      }
      out.appendChild(el('h3', 'Bestenliste (Rating)'));
      Object.keys(d.clans).map(function (t) { return d.clans[t]; })
        .sort(function (a, b) { return b.rating - a.rating; })
        .forEach(function (c, i) {
          out.appendChild(el('p', (i + 1) + '. [' + c.tag + '] ' + c.name + ' — ' + c.rating +
            ' (' + c.wins + 'S/' + c.losses + 'N, ' + c.members + ' Mitgl.)', { 'class': 'meta' }));
        });
    }
    function battle(foeTag) { // approved request -> animated 8-round clash, Elo +-16
      var d = data(); var me = d.clans[d.mine], foe = d.clans[foeTag];
      if (!me || !foe || battle._on) return;
      battle._on = true;
      var power = me.members * (0.8 + Math.random() * 0.4) + me.rating / 200;
      var fpower = foe.members * (0.8 + Math.random() * 0.4) + foe.rating / 200;
      var myPow = 50, foPow = 50, n = 0;
      msg.textContent = '[' + d.mine + '] gegen [' + foeTag + '] — Kampf läuft!';
      var bt = setInterval(function () {
        if (!document.body.contains(wrap)) { clearInterval(bt); battle._on = false; return; }
        n++;
        myPow += (power > fpower ? 1 : -1) * (2 + Math.random() * 4);
        foPow += (fpower >= power ? 1 : -1) * (2 + Math.random() * 4);
        msg.textContent = '[' + d.mine + '] ' + Math.max(0, Math.round(myPow)) + ' gegen ' +
          Math.max(0, Math.round(foPow)) + ' [' + foeTag + '] (Runde ' + n + '/8)';
        if (n >= 8) {
          clearInterval(bt); battle._on = false;
          var dd = data(); var m2 = dd.clans[dd.mine], f2 = dd.clans[foeTag];
          if (!m2 || !f2) { render(); return; }
          if (power >= fpower) {
            m2.rating += 16; f2.rating = Math.max(0, f2.rating - 16); m2.wins++; f2.losses++;
            msg.textContent = 'SIEG gegen [' + foeTag + ']! +16 Rating.';
          } else {
            m2.rating = Math.max(0, m2.rating - 16); f2.rating += 16; m2.losses++; f2.wins++;
            msg.textContent = 'NIEDERLAGE gegen [' + foeTag + ']. -16 Rating. Wirb Mitglieder und versuch es erneut.';
          }
          save('cw', dd); render();
        }
      }, 400);
    }
    render();
  }

  return {
    viewBedwars: viewBedwars, viewBuildffa: viewBuildffa, viewClanwars: viewClanwars
  };
})();
