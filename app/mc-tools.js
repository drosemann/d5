// Native web rewrites of the Java server-system/utility plugins (Bukkit API
// cannot run in a browser). Each view keeps the plugin's portable rules;
// MySQL/SQLite/file backends become localStorage.
window.d5McTools = (function () {
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
  function btn(label, fn) {
    var b = el('button', label);
    b.addEventListener('click', fn);
    return b;
  }

  // SessionLock / SessionLockPlugin: PIN lock screen.
  function viewLock(root) {
    var wrap = el('div', null, { 'class': 'tool-form' });
    var pin = store('lock-pin', '1234');
    var msg = el('p', pin === '1234' ? 'Default-PIN: 1234 — setze deine PIN.' : 'Gesperrt. PIN eingeben.', { 'class': 'meta' });
    var inp = el('input', null, { type: 'password', placeholder: 'PIN' });
    var go = btn('Entsperren / Setzen', function () {
      if (!inp.value) return;
      if (store('lock-pin', '1234') === '1234' && msg.textContent.indexOf('Default') === 0) {
        save('lock-pin', inp.value); msg.textContent = 'PIN gesetzt. Gesperrt — PIN eingeben.';
      } else if (inp.value === store('lock-pin', '')) msg.textContent = 'Entsperrt. Sitzung aktiv.';
      else msg.textContent = 'Falsche PIN.';
      inp.value = '';
    });
    wrap.appendChild(msg); wrap.appendChild(inp); wrap.appendChild(go); root.appendChild(wrap);
  }

  // Tablist: player list with ping, add/remove/sort like the plugin.
  function viewTablist(root) {
    var wrap = el('div'); root.appendChild(wrap);
    function render() {
      wrap.innerHTML = '';
      var ps = store('tablist', [{ n: 'Steve', ping: 42 }, { n: 'Alex', ping: 87 }]);
      var h = el('h3', 'Tabliste (' + ps.length + ')'); wrap.appendChild(h);
      ps.slice().sort(function (a, b) { return a.ping - b.ping; }).forEach(function (p) {
        var row = el('p', p.n + ' — ' + p.ping + 'ms', { 'class': 'meta' });
        var kick = btn('x', function () { save('tablist', store('tablist', []).filter(function (q) { return q.n !== p.n; })); render(); });
        row.appendChild(kick); wrap.appendChild(row);
      });
      var inp = el('input', null, { placeholder: 'Spielername' });
      wrap.appendChild(inp);
      wrap.appendChild(btn('Hinzufügen', function () {
        var n = inp.value.trim(); if (!n) return;
        var l = store('tablist', []); l.push({ n: n, ping: 20 + Math.floor(Math.random() * 120) });
        save('tablist', l); render();
      }));
    }
    render();
  }

  // Autosaver: interval save scheduler with countdown + log.
  function viewAutosave(root) {
    var wrap = el('div', null, { 'class': 'tool-form' });
    var log = el('pre', '', { 'class': 'result' });
    var secs = el('input', null, { type: 'number', value: '60' });
    var left = 0, timer = null;
    var msg = el('p', 'Bereit.', { 'class': 'meta' });
    function tick() {
      if (!document.body.contains(wrap)) { clearInterval(timer); return; }
      if (--left <= 0) {
        var n = store('autosave-n', 0) + 1; save('autosave-n', n);
        log.textContent += 'Welt gespeichert (#' + n + ')\n';
        left = parseInt(secs.value, 10) || 60;
      }
      msg.textContent = 'Nächster Autosave in ' + left + 's';
    }
    wrap.appendChild(el('p', 'Intervall (s):', { 'class': 'meta' })); wrap.appendChild(secs);
    wrap.appendChild(btn('Start', function () { clearInterval(timer); left = parseInt(secs.value, 10) || 60; timer = setInterval(tick, 1000); }));
    wrap.appendChild(btn('Stopp', function () { clearInterval(timer); msg.textContent = 'Bereit.'; }));
    wrap.appendChild(msg); wrap.appendChild(log); root.appendChild(wrap);
  }

  // BroadcastRestart: restart countdown with broadcasts.
  function viewRestart(root) {
    var wrap = el('div', null, { 'class': 'tool-form' });
    var msg = el('p', 'Bereit.', { 'class': 'meta' });
    var log = el('pre', '', { 'class': 'result' });
    var secs = el('input', null, { type: 'number', value: '30' });
    var left = 0, timer = null;
    wrap.appendChild(secs);
    wrap.appendChild(btn('Restart planen', function () {
      clearInterval(timer); left = parseInt(secs.value, 10) || 30;
      log.textContent += 'Restart in ' + left + 's angekündigt.\n';
      timer = setInterval(function () {
        if (!document.body.contains(wrap)) { clearInterval(timer); return; }
        left--;
        if (left <= 0) { clearInterval(timer); log.textContent += 'Server startet neu … (simuliert)\n'; msg.textContent = 'Bereit.'; return; }
        if (left <= 5 || left % 10 === 0) log.textContent += 'Broadcast: Restart in ' + left + 's!\n';
        msg.textContent = 'Restart in ' + left + 's';
      }, 1000);
    }));
    wrap.appendChild(msg); wrap.appendChild(log); root.appendChild(wrap);
  }

  // ChestSpawner: loot chest generator with rarity tiers.
  var LOOT = ['Holzschwert', 'Eisenbrust', 'Goldapfel', 'Bogen', 'Enderperle', 'Diamant', 'Verzauberungsbuch', 'Netheritbarren'];
  function viewChest(root) {
    var wrap = el('div'); root.appendChild(wrap);
    var out = el('div'); wrap.appendChild(out);
    wrap.appendChild(btn('Kiste öffnen', function () {
      out.innerHTML = '';
      var n = 3 + Math.floor(Math.random() * 3);
      for (var i = 0; i < n; i++) {
        var r = Math.random(), tier = r < 0.6 ? 'common' : r < 0.9 ? 'rare' : 'EPIC';
        out.appendChild(el('p', '[' + tier + '] ' + LOOT[Math.floor(Math.random() * LOOT.length)], { 'class': 'meta' }));
      }
    }));
  }

  // RandomItem: timed random-item drops.
  function viewRanditem(root) {
    var wrap = el('div', null, { 'class': 'tool-form' });
    var inv = store('randitem', []);
    var out = el('div'); wrap.appendChild(out);
    function render() {
      out.innerHTML = '';
      inv.forEach(function (it) { out.appendChild(el('p', it, { 'class': 'meta' })); });
      if (!inv.length) out.appendChild(el('p', 'Inventar leer.', { 'class': 'meta' }));
    }
    wrap.appendChild(btn('Zufalls-Item', function () {
      inv.push(LOOT[Math.floor(Math.random() * LOOT.length)]); save('randitem', inv); render();
    }));
    wrap.appendChild(btn('Inventar leeren', function () { inv = []; save('randitem', inv); render(); }));
    root.appendChild(wrap); render();
  }

  // QuestSystem: accept/track/complete quests with progress.
  var QUESTS = [
    { id: 'q1', name: 'Baue 10 Blöcke ab', need: 10 },
    { id: 'q2', name: 'Besiege 5 Gegner', need: 5 },
    { id: 'q3', name: 'Sammle 3 Diamanten', need: 3 }
  ];
  function viewQuests(root) {
    var wrap = el('div'); root.appendChild(wrap);
    function render() {
      wrap.innerHTML = '';
      var st = store('quests', {});
      QUESTS.forEach(function (q) {
        var p = st[q.id] || 0;
        var row = el('p', q.name + ' — ' + Math.min(p, q.need) + '/' + q.need + (p >= q.need ? ' ABGESCHLOSSEN' : ''), { 'class': 'meta' });
        wrap.appendChild(row);
        if (p < q.need) wrap.appendChild(btn('+1 ' + q.id, function () {
          var s = store('quests', {}); s[q.id] = (s[q.id] || 0) + 1; save('quests', s); render();
        }));
      });
      wrap.appendChild(btn('Zurücksetzen', function () { save('quests', {}); render(); }));
    }
    render();
  }

  // LobbySystem + ConnectHub: server selector with player counts.
  function viewLobby(root) {
    var wrap = el('div'); root.appendChild(wrap);
    var msg = el('p', 'Wähle einen Server.', { 'class': 'meta' }); wrap.appendChild(msg);
    [['Lobby', 124], ['BedWars-1', 16], ['BuildFFA', 9], ['ClanWars-Arena', 23]].forEach(function (s) {
      wrap.appendChild(btn(s[0] + ' (' + s[1] + ' online)', function () {
        msg.textContent = 'Verbinde mit ' + s[0] + ' … verbunden! (simuliert)';
      }));
    });
  }

  // DirectServerConnect: host/port form with simulated latency.
  function viewDirect(root) {
    var wrap = el('div', null, { 'class': 'tool-form' });
    var host = el('input', null, { placeholder: 'Host', value: 'localhost' });
    var port = el('input', null, { type: 'number', placeholder: 'Port', value: '25565' });
    var msg = el('p', '', { 'class': 'meta' });
    wrap.appendChild(host); wrap.appendChild(port);
    wrap.appendChild(btn('Verbinden', function () {
      var ms = 15 + Math.floor(Math.random() * 120);
      msg.textContent = 'Ping ' + (host.value || 'localhost') + ':' + (port.value || 25565) + ' — ' + ms + 'ms, Server online (simuliert).';
    }));
    wrap.appendChild(msg); root.appendChild(wrap);
  }

  // ElytraPlugin: glide/boost tuning calculator.
  function viewElytra(root) {
    var wrap = el('div', null, { 'class': 'tool-form' });
    var boost = el('input', null, { type: 'number', value: '1.5' });
    var angle = el('input', null, { type: 'number', value: '20' });
    var msg = el('p', '', { 'class': 'meta' });
    wrap.appendChild(el('p', 'Boost-Faktor:', { 'class': 'meta' })); wrap.appendChild(boost);
    wrap.appendChild(el('p', 'Gleitwinkel (Grad):', { 'class': 'meta' })); wrap.appendChild(angle);
    wrap.appendChild(btn('Berechnen', function () {
      var b = parseFloat(boost.value) || 1, a = parseFloat(angle.value) || 0;
      var dist = Math.round(100 * b * Math.cos(a * Math.PI / 180));
      var speed = (12 * b).toFixed(1);
      msg.textContent = 'Reichweite: ~' + dist + ' Blöcke · Speed: ~' + speed + ' m/s (Näherung).';
    }));
    wrap.appendChild(msg); root.appendChild(wrap);
  }

  // HordenPlugin: horde wave clicker with scaling HP.
  function viewHorde(root) {
    var wrap = el('div', null, { 'class': 'tool-form' });
    var msg = el('p', 'Welle 1 bereit.', { 'class': 'meta' });
    var wave = store('horde-wave', 1), hp = 0;
    function startWave() { hp = 10 + wave * 5; msg.textContent = 'Welle ' + wave + ': Gegner-HP ' + hp + ' — klicken zum Schlagen (5 DMG).'; }
    wrap.appendChild(msg);
    wrap.appendChild(btn('Schlagen', function () {
      hp -= 5;
      if (hp <= 0) { wave++; save('horde-wave', wave); startWave(); }
      else msg.textContent = 'Welle ' + wave + ': Gegner-HP ' + hp;
    }));
    wrap.appendChild(btn('Reset', function () { wave = 1; save('horde-wave', 1); startWave(); }));
    root.appendChild(wrap); startWave();
  }

  // MinigameTemplate(s): starter-kit generator (plugin.yml + arena config).
  function viewTemplate(root) {
    var wrap = el('div', null, { 'class': 'tool-form' });
    var name = el('input', null, { placeholder: 'Minigame-Name', value: 'MyGame' });
    var out = el('pre', '', { 'class': 'result' });
    wrap.appendChild(name);
    wrap.appendChild(btn('Generieren', function () {
      var n = (name.value || 'MyGame').trim();
      out.textContent = 'name: ' + n + '\nversion: 1.0.0\nmain: com.example.' +
        n.toLowerCase() + '.' + n + '\narenas:\n  - name: arena1\n    spawns: 8\n    min-players: 2';
    }));
    var dl = btn('Download .yml', function () {
      var blob = new Blob([out.textContent || '# erst Generieren klicken'], { type: 'text/yaml' });
      var a = el('a', '', { href: URL.createObjectURL(blob), download: 'plugin.yml' });
      document.body.appendChild(a); a.click(); setTimeout(function () { document.body.removeChild(a); }, 100);
    });
    wrap.appendChild(out); wrap.appendChild(dl); root.appendChild(wrap);
  }

  // AntiCheat: CPS + movement anomaly detector demo.
  function viewAnticheat(root) {
    var wrap = el('div', null, { 'class': 'tool-form' });
    var msg = el('p', 'Klicke so schnell du kannst (5s-Fenster).', { 'class': 'meta' });
    var clicks = [], timer = null;
    wrap.appendChild(msg);
    wrap.appendChild(btn('Klicken', function () {
      var now = Date.now();
      if (!timer) timer = setTimeout(function () {
        var cps = (clicks.length / 5).toFixed(1);
        msg.textContent = clicks.length + ' Klicks = ' + cps + ' CPS — ' +
          (cps > 12 ? 'FLAG: Autoclicker-Verdacht!' : 'OK: menschlich.');
        clicks = []; timer = null;
      }, 5000);
      clicks.push(now);
      msg.textContent = 'Klicks: ' + clicks.length + ' …';
    }));
    root.appendChild(wrap);
  }

  // RoleSync: Minecraft <-> Discord role mapper.
  function viewRolesync(root) {
    var wrap = el('div'); root.appendChild(wrap);
    function render() {
      wrap.innerHTML = '';
      var m = store('rolesync', { Owner: 'Admin', Member: 'Spieler' });
      Object.keys(m).forEach(function (mc) {
        var row = el('p', 'MC: ' + mc + ' ⇄ Discord: ' + m[mc] + ' ', { 'class': 'meta' });
        row.appendChild(btn('x', function () { var d = store('rolesync', {}); delete d[mc]; save('rolesync', d); render(); }));
        wrap.appendChild(row);
      });
      var a = el('input', null, { placeholder: 'MC-Rang' });
      var b = el('input', null, { placeholder: 'Discord-Rolle' });
      wrap.appendChild(a); wrap.appendChild(b);
      wrap.appendChild(btn('Mappen', function () {
        if (!a.value.trim()) return;
        var d = store('rolesync', {}); d[a.value.trim()] = b.value.trim() || a.value.trim();
        save('rolesync', d); render();
      }));
    }
    render();
  }

  // SandstoneRemover: block grid filter sim.
  function viewSandstone(root) {
    var wrap = el('div'); root.appendChild(wrap);
    var out = el('p', '', { 'class': 'meta' }); wrap.appendChild(out);
    var grid = [];
    for (var i = 0; i < 24; i++) grid.push(Math.random() < 0.3 ? 'sandstone' : 'stone');
    out.textContent = 'Blöcke: ' + grid.length + ', davon Sandstein: ' + grid.filter(function (g) { return g === 'sandstone'; }).length;
    wrap.appendChild(btn('Sandstein entfernen', function () {
      var n = grid.filter(function (g) { return g === 'sandstone'; }).length;
      grid = grid.map(function () { return 'stone'; });
      out.textContent = n + ' Sandsteinblöcke entfernt. Übrig: ' + grid.length + ' stone.';
    }));
  }

  // ArenaAutoReset: arena reset timer.
  function viewArena(root) {
    var wrap = el('div', null, { 'class': 'tool-form' });
    var msg = el('p', 'Arena intakt.', { 'class': 'meta' });
    var left = 0, timer = null;
    wrap.appendChild(msg);
    wrap.appendChild(btn('Match starten (Reset in 60s)', function () {
      clearInterval(timer); left = 60; msg.textContent = 'Match läuft. Reset in 60s.';
      timer = setInterval(function () {
        if (!document.body.contains(wrap)) { clearInterval(timer); return; }
        if (--left <= 0) { clearInterval(timer); msg.textContent = 'Arena zurückgesetzt. Bereit.'; return; }
        msg.textContent = 'Match läuft. Reset in ' + left + 's.';
      }, 1000);
    }));
    root.appendChild(wrap);
  }

  // LocateStructure: seed-hash structure locator.
  function viewLocate(root) {
    var wrap = el('div', null, { 'class': 'tool-form' });
    var seed = el('input', null, { placeholder: 'Seed', value: '12345' });
    var kind = el('select');
    ['Village', 'Stronghold', 'Nether Fortress', 'End City'].forEach(function (s) {
      kind.appendChild(el('option', s, { value: s }));
    });
    var msg = el('p', '', { 'class': 'meta' });
    wrap.appendChild(seed); wrap.appendChild(kind);
    wrap.appendChild(btn('Finden', function () {
      var h = 0, str = seed.value + kind.value;
      for (var i = 0; i < str.length; i++) h = (h * 31 + str.charCodeAt(i)) >>> 0;
      msg.textContent = kind.value + ' bei X=' + (h % 3000 - 1500) + ' Z=' + ((h >> 8) % 3000 - 1500) + ' (deterministisch aus Seed).';
    }));
    wrap.appendChild(msg); root.appendChild(wrap);
  }

  // TNTRemover: blast toggle — counts blocked TNT.
  function viewTnt(root) {
    var wrap = el('div'); root.appendChild(wrap);
    var blocked = store('tnt-blocked', 0);
    var msg = el('p', 'TNT-Schaden: AN. Blockiert bisher: ' + blocked, { 'class': 'meta' });
    wrap.appendChild(msg);
    var on = true;
    wrap.appendChild(btn('Umschalten', function () {
      on = !on;
      if (!on) { blocked += 1 + Math.floor(Math.random() * 5); save('tnt-blocked', blocked); }
      msg.textContent = 'TNT-Schaden: ' + (on ? 'AN' : 'AUS') + '. Blockiert bisher: ' + blocked;
    }));
  }

  // VoiceChat: proximity channel sim.
  function viewVoice(root) {
    var wrap = el('div'); root.appendChild(wrap);
    var msg = el('p', 'Nicht verbunden.', { 'class': 'meta' }); wrap.appendChild(msg);
    var chan = null;
    ['Lobby', 'Team Rot', 'Team Blau'].forEach(function (c) {
      wrap.appendChild(btn(c + ' beitreten', function () {
        chan = c; msg.textContent = 'Im Channel: ' + c + ' — sprich (simuliert, Reichweite 30 Blöcke).';
      }));
    });
    wrap.appendChild(btn('Verlassen', function () { chan = null; msg.textContent = 'Nicht verbunden.'; }));
  }

  // HelloWorld: minimal greeting (archive-unsorted-helloworld).
  function viewHello(root) {
    var wrap = el('div', null, { 'class': 'tool-form' });
    var inp = el('input', null, { placeholder: 'Name', value: 'Welt' });
    var msg = el('p', '', { 'class': 'meta' });
    wrap.appendChild(inp);
    wrap.appendChild(btn('Grüßen', function () { msg.textContent = 'Hello, ' + (inp.value || 'Welt') + '!'; }));
    wrap.appendChild(msg); root.appendChild(wrap);
  }

  // Pseudocode: tiny pseudocode interpreter (SET/ADD/PRINT/IF/LOOP).
  function viewPseudo(root) {
    var wrap = el('div', null, { 'class': 'tool-form' });
    var ta = el('textarea', null, { rows: '6', cols: '40' });
    ta.value = 'SET x 5\nLOOP 3\n  ADD x 2\nPRINT x';
    var out = el('pre', '', { 'class': 'result' });
    wrap.appendChild(ta);
    wrap.appendChild(btn('Ausführen', function () {
      var vars = {}, lines = ta.value.split('\n'), res = [], loopN = 1, loopBody = [];
      function exec(line) {
        var p = line.trim().split(/\s+/);
        if (p[0] === 'SET') vars[p[1]] = parseFloat(p[2]) || 0;
        else if (p[0] === 'ADD') vars[p[1]] = (vars[p[1]] || 0) + (parseFloat(p[2]) || 0);
        else if (p[0] === 'PRINT') res.push(vars[p[1]] !== undefined ? String(vars[p[1]]) : p.slice(1).join(' '));
      }
      var i = 0;
      while (i < lines.length) {
        var t = lines[i].trim().split(/\s+/);
        if (t[0] === 'LOOP') { loopN = parseInt(t[1], 10) || 1; loopBody = []; i++;
          while (i < lines.length && /^\s/.test(lines[i])) { loopBody.push(lines[i]); i++; }
          for (var k = 0; k < loopN; k++) loopBody.forEach(exec);
        } else { exec(lines[i]); i++; }
      }
      out.textContent = res.join('\n') || '(keine Ausgabe)';
    }));
    wrap.appendChild(out); root.appendChild(wrap);
  }

  return {
    viewLock: viewLock, viewTablist: viewTablist, viewAutosave: viewAutosave,
    viewRestart: viewRestart, viewChest: viewChest, viewRanditem: viewRanditem,
    viewQuests: viewQuests, viewLobby: viewLobby, viewDirect: viewDirect,
    viewElytra: viewElytra, viewHorde: viewHorde, viewTemplate: viewTemplate,
    viewAnticheat: viewAnticheat, viewRolesync: viewRolesync, viewSandstone: viewSandstone,
    viewArena: viewArena, viewLocate: viewLocate, viewTnt: viewTnt,
    viewVoice: viewVoice, viewHello: viewHello, viewPseudo: viewPseudo
  };
})();
