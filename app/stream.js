// d5 Stream Studio — Twitch-artiges lokales Streaming: Kanal, Live-Schaltung
// mit Kamera/Mikrofon, Chat mit Emotes/Slowmode/Mods/Bot, Clips/VODs, Planung.
// Alles localStorage + MediaRecorder; keine Server, keine erfundenen Zuschauer.
window.d5Stream = (function () {
  var P = 'd5stream_';
  function load(k, d) {
    try { var v = JSON.parse(localStorage.getItem(P + k)); return v == null ? d : v; }
    catch (e) { return d; }
  }
  function save(k, v) {
    try { localStorage.setItem(P + k, JSON.stringify(v)); return true; }
    catch (e) { return false; }
  }
  function el(tag, text, attrs) {
    var e = document.createElement(tag);
    if (text != null) e.textContent = text;
    if (attrs) for (var k in attrs) { if (k === 'html') e.innerHTML = attrs[k]; else e.setAttribute(k, attrs[k]); }
    return e;
  }
  function esc(s) {
    return String(s).replace(/[&<>"']/g, function (c) {
      return { '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;', "'": '&#39;' }[c];
    });
  }
  function sid() {
    return 'st' + Date.now().toString(36) + Math.floor(Math.random() * 1296).toString(36);
  }
  function me() {
    try { return sessionStorage.getItem('d5:session') || ''; } catch (e) { return ''; }
  }
  function nameColor(n) {
    var h = 0;
    for (var i = 0; i < n.length; i++) h = ((h * 31) + n.charCodeAt(i)) >>> 0;
    return 'hsl(' + (h % 360) + ',70%,45%)';
  }
  var EMOTES = {
    Kappa: '😎', PogChamp: '😲', LUL: '😂', KEKW: '🤣', FeelsGoodMan: '🐸👍',
    FeelsBadMan: '🐸👎', MonkaS: '😰', PepeHands: '😭', HYPE: '🎉', F: '🇫',
    EZ: '😏', GG: '🤝', RIP: '⚰️', POGGERS: '🤩'
  };
  function emoteify(html) {
    return String(html).split(/(<[^>]*>)/g).map(function (part, i) {
      if (i % 2 === 1) return part;
      Object.keys(EMOTES).forEach(function (code) {
        part = part.split(code).join(EMOTES[code]);
      });
      return part;
    }).join('');
  }
  function levelBadge(nm) {
    var c = (load('counts', {})[nm] || 0);
    if (c >= 200) return ' <span class="badge">👑 Stammgast</span>';
    if (c >= 50) return ' <span class="badge">💎 aktiv</span>';
    if (c >= 10) return ' <span class="badge">⭐ bekannt</span>';
    return '';
  }
  function chatHtml(m) {
    var vip = load('vips', []).indexOf(m.name) >= 0;
    return '<button type="button" data-ucc="' + esc(m.name) + '" style="background:none;border:none;padding:0;cursor:pointer;color:' + nameColor(m.name) + ';font-weight:bold">' + esc(m.name) + '</button>' +
      (m.mod ? ' <span class="badge">mod</span>' : '') +
      (vip ? ' <span class="badge">💠</span>' : '') + levelBadge(m.name) +
      ' <span class="meta">' + esc(new Date(m.ts).toLocaleTimeString()) + '</span><br>' +
      emoteify(esc(m.text));
  }
  function viewStream(root) {
    var views = load('views', 0) + 1;
    save('views', views);
    var chan = load('chan', { title: 'd5 Live', category: 'Just Chatting' });
    var live = load('live', { on: false, startedAt: 0 });
    var stats = load('stats', { streams: 0, liveMinutes: 0, chats: 0 });
    var wrap = el('div', null, { 'class': 'tool-form' });
    root.appendChild(wrap);
    var head = el('div');
    var titleIn = el('input', null, { id: 'st-title', value: chan.title });
    var catIn = el('input', null, { id: 'st-cat', value: chan.category });
    head.appendChild(el('span', null, { html: '<strong>Kanal:</strong> ' }));
    head.appendChild(titleIn); head.appendChild(document.createTextNode(' ')); head.appendChild(catIn);
    wrap.appendChild(head);
    var liveLine = el('p', null, { 'class': 'meta', id: 'st-liveline' });
    wrap.appendChild(liveLine);
    var folRow = el('p', null, { 'class': 'meta' });
    var folBtn = el('button', 'Folgen', { type: 'button' });
    var folCount = el('span', '', {});
    var ptsLine = el('span', '', { 'class': 'meta' });
    folRow.appendChild(folBtn); folRow.appendChild(document.createTextNode(' '));
    folRow.appendChild(folCount); folRow.appendChild(document.createTextNode(' · '));
    folRow.appendChild(ptsLine);
    wrap.appendChild(folRow);
    function myName() { return (chatName.value.trim() || me() || 'Gast').slice(0, 30); }
    function refreshFol() {
      var fols = load('streamfollows', []);
      var nm = myName();
      folBtn.textContent = fols.indexOf(nm) >= 0 ? 'Entfolgen' : 'Folgen';
      folCount.textContent = fols.length + ' Follower (lokal)';
      var pts = load('points', {});
      ptsLine.textContent = (pts[nm] || 0) + ' Punkte';
    }
    folBtn.addEventListener('click', function () {
      var fols = load('streamfollows', []);
      var nm = (chatName.value.trim() || me() || 'Gast').slice(0, 30);
      if (!nm) return;
      var i = fols.indexOf(nm);
      if (i >= 0) fols.splice(i, 1); else fols.push(nm);
      save('streamfollows', fols);
      out.textContent = i >= 0 ? 'Entfolgt.' : 'Du folgst dem Kanal. 🎉';
      refreshFol(); renderChat(false);
    });
    setInterval(function () {
      if (!document.getElementById('st-liveline')) return;
      var nm = 'Gast';
      try { nm = (chatName.value.trim() || me() || 'Gast').slice(0, 30); } catch (e) {}
      if (!nm) return;
      var pts = load('points', {});
      pts[nm] = (pts[nm] || 0) + 10;
      if (save('points', pts)) refreshFol();
    }, 60000);
    var vid = el('video', null, { id: 'st-video', width: 480, playsinline: '', muted: '' });
    vid.style.maxWidth = '100%'; vid.style.background = '#000';
    wrap.appendChild(vid);
    var row = el('div');
    var camBtn = el('button', 'Kamera an', { type: 'button' });
    var audioOnly = el('input', null, { id: 'st-audioonly', type: 'checkbox' });
    var liveBtn = el('button', live.on ? 'Stream beenden' : 'Live gehen', { type: 'button' });
    var clipBtn = el('button', 'Clip (30s)', { type: 'button' });
    row.appendChild(camBtn); row.appendChild(document.createTextNode(' '));
    row.appendChild(audioOnly); row.appendChild(document.createTextNode(' Nur Audio '));
    row.appendChild(liveBtn); row.appendChild(document.createTextNode(' ')); row.appendChild(clipBtn);
    wrap.appendChild(row);
    var out = el('div', null, { id: 'st-out' });
    wrap.appendChild(out);
    var stream = null, rec = null, recChunks = [], recMime = 'video/webm', recStart = 0;
    var lastSent = {};
    function persistLive() { save('live', live); }
    function refreshLive() {
      var s = document.getElementById('st-liveline');
      if (!s) { if (timer) clearInterval(timer); return; }
      if (live.on) {
        var sec = Math.floor((Date.now() - live.startedAt) / 1000);
        var hh = Math.floor(sec / 3600), mm = Math.floor((sec % 3600) / 60), ss = sec % 60;
        s.innerHTML = '<span class="badge">● LIVE</span> ' + esc(chan.title) + ' · ' + esc(chan.category) +
          ' · <span id="st-uptime">' + hh + ':' + (mm < 10 ? '0' : '') + mm + ':' + (ss < 10 ? '0' : '') + ss + '</span>';
      } else {
        s.innerHTML = 'Offline — ' + esc(chan.title) + ' · ' + esc(chan.category);
      }
      liveBtn.textContent = live.on ? 'Stream beenden' : 'Live gehen';
      if (typeof hype !== 'undefined' && hype && Date.now() > hype.until) { hype = null; renderChat(false); }
      checkExpiry();
    }
    var timer = setInterval(refreshLive, 1000);
    refreshLive();
    function stopTracks() {
      if (stream) { stream.getTracks().forEach(function (t) { t.stop(); }); stream = null; }
      vid.removeAttribute('src'); vid.load();
    }
    function saveVod(blob, title, durSec, markers) {
      if (!blob || !blob.size) { out.textContent = 'Leere Aufnahme, nichts gespeichert.'; return; }
      if (blob.size > 8000000) {
        out.textContent = 'VOD zu groß für localStorage (' + Math.round(blob.size / 1048576) + ' MB) — verworfen. Kürzer streamen oder Clip nutzen.';
        return;
      }
      var fr = new FileReader();
      fr.onload = function () {
        var vods = load('vods', []);
        vods.unshift({ id: sid(), title: title, ts: Date.now(), dur: durSec || 0, src: String(fr.result), markers: markers || [] });
        vods = vods.slice(0, 10);
        if (!save('vods', vods)) out.textContent = 'Speicher voll — VOD verworfen.';
        else { out.textContent = 'VOD gespeichert.'; renderVods(); }
      };
      fr.readAsDataURL(blob);
    }
    function startRec() {
      recChunks = [];
      try {
        rec = new MediaRecorder(stream);
        recMime = rec.mimeType || 'video/webm';
      } catch (e) { rec = null; return false; }
      recStart = Date.now();
      rec.ondataavailable = function (ev) { if (ev.data && ev.data.size) recChunks.push(ev.data); };
      try { rec.start(1000); } catch (e) { rec = null; return false; }
      return true;
    }
    function stopRec() {
      if (!rec) return null;
      var dur = Math.round((Date.now() - recStart) / 1000);
      try { rec.stop(); } catch (e) {}
      var chunks = recChunks; rec = null;
      if (!chunks.length) return null;
      return { blob: new Blob(chunks, { type: recMime }), dur: dur };
    }
    function hasCam() {
      return !!(navigator.mediaDevices && navigator.mediaDevices.getUserMedia && typeof MediaRecorder !== 'undefined');
    }
    camBtn.addEventListener('click', function () {
      if (stream) { stopTracks(); camBtn.textContent = 'Kamera an'; out.textContent = 'Vorschau aus.'; return; }
      if (!hasCam()) { out.textContent = 'Kamera/Mikrofon werden von diesem Browser nicht unterstützt.'; return; }
      var onlyAudio = false;
      try { onlyAudio = audioOnly.checked; } catch (e) {}
      navigator.mediaDevices.getUserMedia(onlyAudio ? { audio: true } : { video: true, audio: true }).then(function (s) {
        stream = s;
        try { vid.srcObject = stream; vid.play(); } catch (e) {}
        camBtn.textContent = 'Kamera aus';
        out.textContent = onlyAudio ? 'Mikrofon aktiv (nur Audio).' : 'Vorschau aktiv.';
      }).catch(function () { out.textContent = 'Kamera/Mikrofon verweigert oder nicht verfügbar.'; });
    });
    liveBtn.addEventListener('click', function () {
      if (live.on) {
        var mins = Math.round((Date.now() - live.startedAt) / 60000);
        var st = load('stats', { streams: 0, liveMinutes: 0, chats: 0 });
        st.liveMinutes += mins;
        save('stats', st);
        var fin = stopRec();
        live = { on: false, startedAt: 0 };
        persistLive();
        stopTracks();
        camBtn.textContent = 'Kamera an';
        refreshLive();
        var mks = load('streammarkers', []);
        save('streammarkers', []);
        if (fin) saveVod(fin.blob, chan.title + ' (VOD)', fin.dur, mks);
        else out.textContent = 'Stream beendet (keine Aufnahme).';
        return;
      }
      function go() {
        live = { on: true, startedAt: Date.now() };
        persistLive();
        save('streammarkers', []);
        var st2 = load('stats', { streams: 0, liveMinutes: 0, chats: 0 });
        st2.streams++;
        save('stats', st2);
        if (!startRec()) out.textContent = 'Live! (Aufnahme fehlgeschlagen — kein VOD.)';
        else out.textContent = 'Live! Aufnahme läuft.';
        refreshLive();
      }
      if (stream) { go(); return; }
      if (!hasCam()) { out.textContent = 'Ohne Kamera/Mikrofon kein Livestream in diesem Browser.'; return; }
      var onlyAudio = false;
      try { onlyAudio = audioOnly.checked; } catch (e) {}
      navigator.mediaDevices.getUserMedia(onlyAudio ? { audio: true } : { video: true, audio: true }).then(function (s) {
        stream = s;
        try { vid.srcObject = stream; vid.play(); } catch (e2) {}
        camBtn.textContent = 'Kamera aus';
        go();
      }).catch(function () { out.textContent = 'Kamera/Mikrofon verweigert oder nicht verfügbar.'; });
    });
    clipBtn.addEventListener('click', function () {
      if (!stream) { out.textContent = 'Erst Kamera starten, dann Clip aufnehmen.'; return; }
      if (!hasCam()) return;
      var chunks = [];
      var r;
      try { r = new MediaRecorder(stream); } catch (e) { out.textContent = 'Clip fehlgeschlagen.'; return; }
      r.ondataavailable = function (ev) { if (ev.data && ev.data.size) chunks.push(ev.data); };
      r.onstop = function () {
        if (!chunks.length) { out.textContent = 'Clip leer.'; return; }
        saveVod(new Blob(chunks, { type: r.mimeType || 'video/webm' }), chan.title + ' (Clip)', 30);
      };
      try { r.start(1000); } catch (e) { out.textContent = 'Clip fehlgeschlagen.'; return; }
      out.textContent = 'Clip läuft (30s)…';
      setTimeout(function () { try { r.stop(); } catch (e) {} }, 30000);
    });
    titleIn.addEventListener('change', function () {
      chan.title = titleIn.value.trim().slice(0, 80) || 'd5 Live';
      save('chan', chan); refreshLive();
    });
    catIn.addEventListener('change', function () {
      chan.category = catIn.value.trim().slice(0, 40) || 'Just Chatting';
      save('chan', chan); refreshLive();
    });
    // ---------- Chat ----------
    var chatTitle = el('h3', 'Chat');
    wrap.appendChild(chatTitle);
    var chatSlow = el('p', null, { 'class': 'meta', id: 'st-slow' });
    wrap.appendChild(chatSlow);
    var chatBox = el('div', null, { id: 'st-chat' });
    chatBox.style.maxHeight = '320px'; chatBox.style.overflowY = 'auto';
    wrap.appendChild(chatBox);
    var chatRow = el('div');
    var chatName = el('input', null, { id: 'st-name', placeholder: 'Name', value: me() });
    chatName.style.width = '110px';
    var chatIn = el('input', null, { id: 'st-msg', placeholder: 'Nachricht (Enter = senden)' });
    chatIn.style.width = '220px';
    var chatSend = el('button', 'Senden', { type: 'button' });
    chatRow.appendChild(chatName); chatRow.appendChild(document.createTextNode(' '));
    chatRow.appendChild(chatIn); chatRow.appendChild(document.createTextNode(' ')); chatRow.appendChild(chatSend);
    wrap.appendChild(chatRow);
    var emoRow = el('div');
    Object.keys(EMOTES).forEach(function (code) {
      var b = el('button', EMOTES[code] + ' ' + code, { type: 'button', title: code });
      b.addEventListener('click', function () { chatIn.value += chatIn.value && !/\s$/.test(chatIn.value) ? ' ' + code : code; chatIn.focus(); });
      emoRow.appendChild(b); emoRow.appendChild(document.createTextNode(' '));
    });
    wrap.appendChild(emoRow);
    function owner() { return me(); }
    function isMod(nm) {
      if (nm && nm === owner() && owner() !== '') return true;
      return load('mods', []).indexOf(nm) >= 0;
    }
    function botSay(text) {
      var c = load('chat', []);
      c.push({ id: sid(), name: 'Nachtbot', text: text, ts: Date.now(), mod: true });
      save('chat', c.slice(-150));
      var st = load('stats', { streams: 0, liveMinutes: 0, chats: 0 });
      st.chats++;
      save('stats', st);
      renderChat(true);
    }
    function pushChat(nm, text, mod) {
      var c = load('chat', []);
      c.push({ id: sid(), name: nm, text: text.slice(0, 500), ts: Date.now(), mod: !!mod });
      save('chat', c.slice(-150));
      var st = load('stats', { streams: 0, liveMinutes: 0, chats: 0 });
      st.chats++;
      save('stats', st);
      var counts = load('counts', {});
      counts[nm] = (counts[nm] || 0) + 1;
      save('counts', counts);
      addPoints(nm, 2);
      hypeHit();
      renderChat(true);
    }
    var hype = null;
    var hypeWin = [];
    function hypeHit() {
      var now = Date.now();
      hypeWin = hypeWin.filter(function (t) { return now - t < 60000; });
      hypeWin.push(now);
      if (hype && now > hype.until) hype = null;
      if (!hype && hypeWin.length >= 10) {
        hype = { level: 1, until: now + 300000 };
        botSay('🚂 HYPE-ZUG Level 1! Weiter chatten für Level 2!');
        return;
      }
      if (hype && hype.level < 5 && hypeWin.length >= (hype.level + 1) * 15) {
        hype.level++;
        hype.until = now + 300000;
        botSay('🚂 HYPE-ZUG Level ' + hype.level + '!');
      }
    }
    function refreshSlow() {
      var s = load('slow', 0);
      var elx = document.getElementById('st-slow');
      if (elx) elx.textContent = (s > 0 ? 'Langsamer Modus: ' + s + 's' : 'Chat: Emotes mit Klick einfügen. Mod-Befehle: /slow /ban /timeout /mod /title — Bot: !uptime !so !clip') + (typeof hype !== 'undefined' && hype ? ' · 🚂 HYPE ' + hype.level : '');
    }
    function handleCmd(nm, raw, mod) {
      var parts = raw.trim().split(/\s+/);
      var cmd = (parts[0] || '').toLowerCase();
      var rest = raw.slice(parts[0].length).trim();
      var needMod = ['/slow', '/slowoff', '/ban', '/unban', '/timeout', '/mod', '/unmod', '/title', '/category'].indexOf(cmd) >= 0;
      if (needMod && !mod) { out.textContent = 'Nur für Mods.'; return true; }
      if (cmd === '/slow') {
        var n = parseInt(parts[1], 10);
        if (!n || n < 1 || n > 300) { out.textContent = '/slow <Sekunden 1-300>'; return true; }
        save('slow', n); botSay('Langsamer Modus: ' + n + 's (von ' + nm + ')'); refreshSlow();
        return true;
      }
      if (cmd === '/slowoff') { save('slow', 0); botSay('Langsamer Modus aus.'); refreshSlow(); return true; }
      if (cmd === '/ban' || cmd === '/timeout') {
        var target = parts[1];
        if (!target) { out.textContent = cmd + ' <Name> [Minuten]'; return true; }
        var mins = cmd === '/ban' ? 0 : (parseInt(parts[2], 10) || 10);
        var bans = load('bans', []).filter(function (b) { return b.name !== target; });
        bans.push({ name: target, until: mins === 0 ? 0 : Date.now() + mins * 60000 });
        save('bans', bans);
        botSay(target + (mins === 0 ? ' wurde gebannt.' : ' Timeout für ' + mins + ' Min.'));
        return true;
      }
      if (cmd === '/unban') {
        save('bans', load('bans', []).filter(function (b) { return b.name !== parts[1]; }));
        botSay(parts[1] + ' entbannt.');
        return true;
      }
      if (cmd === '/mod' || cmd === '/unmod') {
        if (nm !== owner() || owner() === '') { out.textContent = 'Nur für den Kanalbesitzer (Login Demo).'; return true; }
        var mods = load('mods', []);
        if (cmd === '/mod') { if (parts[1] && mods.indexOf(parts[1]) < 0) mods.push(parts[1]); }
        else mods = mods.filter(function (m) { return m !== parts[1]; });
        save('mods', mods);
        botSay(parts[1] + (cmd === '/mod' ? ' ist jetzt Mod.' : ' ist kein Mod mehr.'));
        return true;
      }
      if (cmd === '/title') {
        if (!rest) { out.textContent = '/title <Text>'; return true; }
        chan.title = rest.slice(0, 80); save('chan', chan);
        titleIn.value = chan.title; refreshLive();
        botSay('Titel: ' + chan.title);
        return true;
      }
      if (cmd === '/category') {
        if (!rest) { out.textContent = '/category <Text>'; return true; }
        chan.category = rest.slice(0, 40); save('chan', chan);
        catIn.value = chan.category; refreshLive();
        botSay('Kategorie: ' + chan.category);
        return true;
      }
      if (cmd === '!uptime') {
        botSay(live.on
          ? 'Live seit ' + Math.floor((Date.now() - live.startedAt) / 60000) + ' Min — ' + chan.title
          : 'Gerade offline. Nächster Stream: siehe Planung.');
        return true;
      }
      if (cmd === '!title') { botSay(chan.title + ' · ' + chan.category); return true; }
      if (cmd === '!so') {
        if (!rest) { out.textContent = '!so <Name>'; return true; }
        botSay('Schaut bei ' + rest.slice(0, 40) + ' vorbei! 🎉');
        return true;
      }
      if (cmd === '!clip') {
        if (!stream) { botSay('Kein aktiver Stream für Clips.'); return true; }
        botSay('Clip läuft (30s)…');
        clipBtn.click();
        return true;
      }
      if (cmd === '/vip' || cmd === '/unvip') {
        if (nm !== owner() || owner() === '') { out.textContent = 'Nur für den Kanalbesitzer (Login Demo).'; return true; }
        var vips = load('vips', []);
        if (cmd === '/vip') { if (parts[1] && vips.indexOf(parts[1]) < 0) vips.push(parts[1]); }
        else vips = vips.filter(function (m) { return m !== parts[1]; });
        save('vips', vips);
        botSay(parts[1] + (cmd === '/vip' ? ' ist jetzt VIP. 💠' : ' ist kein VIP mehr.'));
        return true;
      }
      if (cmd === '!points') {
        botSay(nm + ': ' + (load('points', {})[nm] || 0) + ' Punkte. (+2 pro Nachricht, +10 pro Minute)');
        return true;
      }
      if (cmd === '/redeem') {
        var rw = (parts[1] || '').toLowerCase();
        if (rw === 'highlight') {
          var bal = load('points', {})[nm] || 0;
          if (bal < 50) { out.textContent = 'Braucht 50 Punkte (du hast ' + bal + ').'; return true; }
          addPoints(nm, -50);
          var cc = load('chat', []);
          var mine2 = cc.filter(function (m) { return m.name === nm; });
          if (mine2.length) { save('hl', mine2[mine2.length - 1].id); botSay(nm + ' hebt eine Nachricht hervor. ✨'); }
          else botSay('Schreib erst eine Nachricht, dann /redeem highlight.');
          renderChat(false);
          return true;
        }
        if (rw === 'slowmo') {
          var bal2 = load('points', {})[nm] || 0;
          if (bal2 < 200) { out.textContent = 'Braucht 200 Punkte (du hast ' + bal2 + ').'; return true; }
          addPoints(nm, -200);
          var prevSlow = load('slow', 0);
          save('slow', 15);
          botSay(nm + ' löst Slow-Mo (15s) für 60 Sekunden aus! 🐌');
          refreshSlow();
          setTimeout(function () { save('slow', prevSlow); refreshSlow(); }, 60000);
          return true;
        }
        out.textContent = '/redeem highlight (50) | slowmo (200)';
        return true;
      }
      if (cmd === '/predict') {
        if (!mod) { out.textContent = 'Nur für Mods.'; return true; }
        var pm = raw.match(/^\/predict\s+"([^"]+)"\s+"([^"]+)"\s+"([^"]+)"(?:\s+(\d+))?/);
        if (!pm) { out.textContent = '/predict "Frage" "A" "B" [Minuten 1-5]'; return true; }
        var mins = Math.min(5, Math.max(1, parseInt(pm[4] || '2', 10) || 2));
        save('streampred', { id: sid(), q: pm[1].slice(0, 140), opts: [{ t: pm[2].slice(0, 60), pool: 0 }, { t: pm[3].slice(0, 60), pool: 0 }], bets: {}, endsAt: Date.now() + mins * 60000, by: nm, open: true });
        botSay('🔮 Vorhersage: ' + pm[1] + ' — 1) ' + pm[2] + '  2) ' + pm[3] + ' — !bet <1|2> <Punkte> (' + mins + ' Min)');
        renderPred();
        return true;
      }
      if (cmd === '!bet') {
        var pred = load('streampred', null);
        if (!pred || !pred.open) { out.textContent = 'Keine offene Vorhersage.'; return true; }
        if (Date.now() > pred.endsAt) { closePred(); out.textContent = 'Vorhersage ist zu.'; return true; }
        var oi = parseInt(parts[1], 10), amt = parseInt(parts[2], 10);
        if ((oi !== 1 && oi !== 2) || !amt || amt < 1) { out.textContent = '!bet <1|2> <Punkte>'; return true; }
        var have = load('points', {})[nm] || 0;
        if (have < amt) { out.textContent = 'Nur ' + have + ' Punkte.'; return true; }
        if (pred.bets[nm]) { out.textContent = 'Du hast schon gesetzt.'; return true; }
        addPoints(nm, -amt);
        pred.bets[nm] = { idx: oi - 1, amt: amt };
        pred.opts[oi - 1].pool += amt;
        save('streampred', pred);
        botSay(nm + ' setzt ' + amt + ' auf „' + pred.opts[oi - 1].t + '“.');
        renderPred();
        return true;
      }
      if (cmd === '/resolve' || cmd === '/refund') {
        if (!mod) { out.textContent = 'Nur für Mods.'; return true; }
        var pr = load('streampred', null);
        if (!pr || !pr.open) { out.textContent = 'Keine offene Vorhersage.'; return true; }
        var win = parseInt(parts[1], 10) - 1;
        var names = Object.keys(pr.bets);
        if (cmd === '/refund' || win < 0 || win > 1) {
          names.forEach(function (u) { addPoints(u, pr.bets[u].amt); });
          botSay('Vorhersage abgebrochen — Einsätze zurück.');
        } else {
          var totWin = 0, totLose = 0;
          names.forEach(function (u) {
            if (pr.bets[u].idx === win) totWin += pr.bets[u].amt; else totLose += pr.bets[u].amt;
          });
          names.forEach(function (u) {
            if (pr.bets[u].idx === win) {
              var share = totWin ? Math.floor(pr.bets[u].amt / totWin * totLose) : 0;
              addPoints(u, pr.bets[u].amt + share);
            }
          });
          botSay('🏆 „' + pr.opts[win].t + '“ gewinnt! (' + pr.q + ')');
        }
        pr.open = false;
        save('streampred', pr);
        renderPred();
        return true;
      }
      if (cmd === '/poll') {
        if (!mod) { out.textContent = 'Nur für Mods.'; return true; }
        var plm = raw.match(/^\/poll\s+"([^"]+)"((?:\s+"[^"]+"){2,4})(?:\s+(\d+))?/);
        if (!plm) { out.textContent = '/poll "Frage" "A" "B" ["C" "D"] [Sek 30-300]'; return true; }
        var popts = (plm[2].match(/"[^"]+"/g) || []).map(function (s) { return s.slice(1, -1).slice(0, 60); });
        if (popts.length < 2) { out.textContent = 'Mindestens 2 Optionen.'; return true; }
        var psec = Math.min(300, Math.max(30, parseInt(plm[3] || '60', 10) || 60));
        save('streampoll', { id: sid(), q: plm[1].slice(0, 140), opts: popts.map(function (t) { return { t: t, v: 0 }; }), voters: {}, endsAt: Date.now() + psec * 1000 });
        botSay('📊 Umfrage: ' + plm[1] + ' — abstimmen mit Klick (' + psec + 's)');
        renderPoll();
        return true;
      }
      if (cmd === '/endpoll') {
        if (!mod) { out.textContent = 'Nur für Mods.'; return true; }
        closePoll(true);
        return true;
      }
      if (cmd === '/marker') {
        if (!mod) { out.textContent = 'Nur für Mods.'; return true; }
        if (!live.on) { out.textContent = 'Nur live möglich.'; return true; }
        var mk = load('streammarkers', []);
        mk.push({ off: Math.round((Date.now() - live.startedAt) / 1000), note: rest.slice(0, 80) });
        save('streammarkers', mk);
        botSay('🔖 Marker gesetzt' + (rest ? ': ' + rest.slice(0, 80) : '') + '.');
        return true;
      }
      if (raw[0] === '/') { out.textContent = 'Unbekannter Befehl: ' + cmd; return true; }
      return false;
    }
    var chatFilter = '';
    var chatSearch = el('input', null, { placeholder: 'Chat durchsuchen' });
    chatSearch.addEventListener('input', function () { chatFilter = chatSearch.value.trim().toLowerCase(); renderChat(false); });
    wrap.insertBefore(chatSearch, chatBox);
    function renderChat(scroll) {
      refreshSlow();
      var c = load('chat', []);
      if (chatFilter) c = c.filter(function (m) { return m.text.toLowerCase().indexOf(chatFilter) >= 0 || m.name.toLowerCase().indexOf(chatFilter) >= 0; });
      var hl = load('hl', null);
      chatBox.innerHTML = c.slice(-60).map(function (m) {
        var inner = '<p>' + chatHtml(m) + '</p>';
        if (hl && m.id === hl) inner = '<div style="background:#3a3000;border-radius:8px">' + inner + '</div>';
        return inner;
      }).join('') || '<p class="meta">Noch keine Nachrichten. Schreib die erste!</p>';
      chatBox.querySelectorAll('[data-ucc]').forEach(function (b) {
        b.addEventListener('click', function () { selUser = b.getAttribute('data-ucc'); renderCard(); });
      });
      if (scroll) chatBox.scrollTop = chatBox.scrollHeight;
      try { refreshFol(); } catch (e) {}
    }
    function sendChat() {
      var nm = (chatName.value.trim() || me() || 'Gast').slice(0, 30);
      var txt = chatIn.value.trim();
      if (!txt) return;
      var mod = isMod(nm);
      if (txt.length > 500) { out.textContent = 'Maximal 500 Zeichen.'; return; }
      if (handleCmd(nm, txt, mod)) { chatIn.value = ''; renderChat(false); return; }
      var ban = load('bans', []).filter(function (b) { return b.name === nm; })[0];
      if (ban && (ban.until === 0 || ban.until > Date.now())) {
        out.textContent = ban.until === 0 ? 'Du bist gebannt.' : 'Timeoutet bis ' + new Date(ban.until).toLocaleTimeString() + '.';
        return;
      }
      var slow = load('slow', 0);
      if (slow > 0 && !mod && load('vips', []).indexOf(nm) < 0) {
        var last = lastSent[nm] || 0;
        if (Date.now() - last < slow * 1000) { out.textContent = 'Langsamer Modus: noch ' + Math.ceil((slow * 1000 - (Date.now() - last)) / 1000) + 's warten.'; return; }
        lastSent[nm] = Date.now();
      }
      if (load('folonly', false) && !mod && load('vips', []).indexOf(nm) < 0) {
        var fols = load('streamfollows', []);
        if (fols.indexOf(nm) < 0) { out.textContent = 'Follower-Only-Chat: erst Kanal folgen (Button oben).'; return; }
      }
      var terms = load('automod', []);
      var low = txt.toLowerCase();
      var bad = !mod && terms.filter(function (t) { return t && low.indexOf(t) >= 0; })[0];
      if (bad) {
        var holds = load('holds', []);
        holds.push({ id: sid(), name: nm, text: txt.slice(0, 500), ts: Date.now() });
        save('holds', holds.slice(-50));
        chatIn.value = '';
        out.textContent = 'AutoMod: Nachricht enthält „' + bad + '“ — zur Freigabe gehalten.';
        renderHolds();
        return;
      }
      pushChat(nm, txt, mod);
      chatIn.value = '';
    }
    chatSend.addEventListener('click', sendChat);
    chatIn.addEventListener('keydown', function (e) { if (e.key === 'Enter') sendChat(); });
    // ---------- VODs ----------
    var vodTitle = el('h3', 'Videos (VODs & Clips)');
    wrap.appendChild(vodTitle);
    var vodBox = el('div', null, { id: 'st-vods' });
    wrap.appendChild(vodBox);
    function fmtDur(s) {
      s = s | 0;
      var mm = Math.floor(s / 60), ss = s % 60;
      return mm + ':' + (ss < 10 ? '0' : '') + ss;
    }
    function renderVods() {
      var vods = load('vods', []);
      vodBox.innerHTML = vods.map(function (v) {
        var chaps = (v.markers || []).map(function (m, i) {
          return '<button type="button" data-vodjump="' + v.id + ':' + m.off + '">' + fmtDur(m.off) + ' ' + esc(m.note || ('Marker ' + (i + 1))) + '</button>';
        }).join(' ');
        return '<article class="card"><h3>' + esc(v.title) + '</h3>' +
          '<p class="meta">' + esc(new Date(v.ts).toLocaleString()) + ' · ' + fmtDur(v.dur) + ' · ' +
          Math.round(String(v.src || '').length / 1024) + ' KB</p>' +
          '<video controls width="320" id="vod-' + v.id + '" src="' + esc(v.src || '') + '" style="max-width:100%"></video>' +
          (chaps ? '<p class="meta">Kapitel: ' + chaps + '</p>' : '') +
          '<p class="meta"><button type="button" data-voddl="' + v.id + '">Download</button> ' +
          '<button type="button" data-voddel="' + v.id + '">Löschen</button></p></article>';
      }).join('') || '<p class="meta">Noch keine Videos. Beende einen Stream oder nimm einen Clip auf.</p>';
      vodBox.querySelectorAll('[data-voddel]').forEach(function (b) {
        b.addEventListener('click', function () {
          save('vods', load('vods', []).filter(function (x) { return x.id !== b.getAttribute('data-voddel'); }));
          renderVods();
        });
      });
      vodBox.querySelectorAll('[data-vodjump]').forEach(function (b) {
        b.addEventListener('click', function () {
          var parts = b.getAttribute('data-vodjump').split(':');
          var vid = document.getElementById('vod-' + parts[0]);
          if (vid) { try { vid.currentTime = +parts[1] || 0; vid.play(); } catch (e) {} }
        });
      });
      vodBox.querySelectorAll('[data-voddl]').forEach(function (b) {
        b.addEventListener('click', function () {
          var v = load('vods', []).filter(function (x) { return x.id === b.getAttribute('data-voddl'); })[0];
          if (!v || !v.src) return;
          var a = document.createElement('a');
          a.href = v.src;
          a.download = (v.title || 'clip').replace(/[^\w\-äöüÄÖÜß ]+/g, '').slice(0, 40) + '.webm';
          document.body.appendChild(a);
          try { a.click(); } catch (e) {}
          document.body.removeChild(a);
        });
      });
    }
    // ---------- Planung ----------
    var schedTitle = el('h3', 'Streamplan');
    wrap.appendChild(schedTitle);
    var schedRow = el('div');
    var schedName = el('input', null, { placeholder: 'Titel' });
    var schedCat = el('input', null, { placeholder: 'Kategorie' });
    var schedAt = el('input', null, { type: 'datetime-local' });
    var schedAdd = el('button', 'Planen', { type: 'button' });
    schedRow.appendChild(schedName); schedRow.appendChild(document.createTextNode(' '));
    schedRow.appendChild(schedCat); schedRow.appendChild(document.createTextNode(' '));
    schedRow.appendChild(schedAt); schedRow.appendChild(document.createTextNode(' '));
    schedRow.appendChild(schedAdd);
    wrap.appendChild(schedRow);
    var schedBox = el('div', null, { id: 'st-sched' });
    wrap.appendChild(schedBox);
    schedAdd.addEventListener('click', function () {
      var when = new Date(schedAt.value).getTime();
      if (!schedName.value.trim() || !when || when <= Date.now()) {
        out.textContent = 'Titel und Zukunfts-Zeitpunkt nötig.';
        return;
      }
      var all = load('sched', []);
      all.push({ id: sid(), title: schedName.value.trim().slice(0, 80), category: schedCat.value.trim().slice(0, 40) || 'Just Chatting', at: when });
      save('sched', all);
      schedName.value = ''; schedCat.value = '';
      out.textContent = 'Geplant.';
      renderSched();
    });
    function renderSched() {
      var all = load('sched', []).sort(function (a, b) { return a.at - b.at; });
      schedBox.innerHTML = all.map(function (s) {
        return '<p><strong>' + esc(s.title) + '</strong> <span class="meta">' + esc(s.category) + ' · ' +
          esc(new Date(s.at).toLocaleString()) + '</span> ' +
          '<button type="button" data-schedgo="' + s.id + '">Jetzt starten</button> ' +
          '<button type="button" data-schedrm="' + s.id + '">x</button></p>';
      }).join('') || '<p class="meta">Nichts geplant.</p>';
      schedBox.querySelectorAll('[data-schedrm]').forEach(function (b) {
        b.addEventListener('click', function () {
          save('sched', load('sched', []).filter(function (x) { return x.id !== b.getAttribute('data-schedrm'); }));
          renderSched();
        });
      });
      schedBox.querySelectorAll('[data-schedgo]').forEach(function (b) {
        b.addEventListener('click', function () {
          var s = load('sched', []).filter(function (x) { return x.id === b.getAttribute('data-schedgo'); })[0];
          if (!s) return;
          chan.title = s.title; chan.category = s.category;
          save('chan', chan);
          titleIn.value = chan.title; catIn.value = chan.category;
          save('sched', load('sched', []).filter(function (x) { return x.id !== s.id; }));
          renderSched(); refreshLive();
          out.textContent = 'Planung übernommen — jetzt „Live gehen“.';
          if (window.scrollTo) window.scrollTo(0, 0);
        });
      });
    }
    // ---------- Dashboard ----------
    var dashTitle = el('h3', 'Dashboard');
    wrap.appendChild(dashTitle);
    var dashBox = el('div', null, { id: 'st-dash' });
    wrap.appendChild(dashBox);
    function renderDash() {
      var st = load('stats', { streams: 0, liveMinutes: 0, chats: 0 });
      dashBox.innerHTML = '<p class="meta">Streams: ' + st.streams + ' · Live-Minuten: ' + st.liveMinutes +
        ' · Kanalaufrufe: ' + views + ' · Chatnachrichten: ' + st.chats +
        ' · VODs: ' + load('vods', []).length + '</p>';
    }
    renderChat(false); renderVods(); renderSched(); renderDash();
    // ---------- Tiefe: Usercards, AutoMod, Follower-Only, VIPs, Level, Suche ----------
    var selUser = null;
    var cardBox = el('div', null, { id: 'st-usercard' });
    wrap.appendChild(cardTitleMod());
    wrap.appendChild(cardBox);
    function cardTitleMod() { return el('h3', 'Moderation'); }
    var modRow = el('div');
    var termIn = el('input', null, { placeholder: 'Blockierter Begriff' });
    var termAdd = el('button', 'Wort sperren', { type: 'button' });
    var folOnlyBtn = el('button', 'Follower-Only: aus', { type: 'button' });
    var holdBox = el('div', null, { id: 'st-holds' });
    modRow.appendChild(termIn); modRow.appendChild(document.createTextNode(' '));
    modRow.appendChild(termAdd); modRow.appendChild(document.createTextNode(' '));
    modRow.appendChild(folOnlyBtn);
    wrap.appendChild(modRow); wrap.appendChild(holdBox);
    var predBox = el('div', null, { id: 'st-pred' });
    var pollBox = el('div', null, { id: 'st-poll' });
    wrap.appendChild(predBox); wrap.appendChild(pollBox);
    function closePred() {
      var pr = load('streampred', null);
      if (!pr || !pr.open) return;
      Object.keys(pr.bets).forEach(function (u) { addPoints(u, pr.bets[u].amt); });
      pr.open = false;
      save('streampred', pr);
      botSay('Vorhersage zu — Einsätze zurück.');
      renderPred();
    }
    function closePoll(manual) {
      var po = load('streampoll', null);
      if (!po) return;
      var best = 0;
      po.opts.forEach(function (o, i) { if (o.v > po.opts[best].v) best = i; });
      botSay('📊 Ergebnis (' + po.q + '): ' + po.opts.map(function (o) { return o.t + ' ' + o.v; }).join(' · '));
      save('streampoll', null);
      renderPoll();
    }
    function renderPred() {
      var p = load('streampred', null);
      if (!p || !p.open) { predBox.innerHTML = ''; return; }
      var left = Math.max(0, Math.round((p.endsAt - Date.now()) / 1000));
      var bets = Object.keys(p.bets).length;
      predBox.innerHTML = '<div class="card"><p><strong>🔮 ' + esc(p.q) + '</strong> <span class="meta">noch ' + left + 's · ' + bets + ' Tipps</span></p>' +
        p.opts.map(function (o, i) {
          return '<p>' + (i + 1) + ') ' + esc(o.t) + ' — Pool ' + o.pool + '</p>';
        }).join('') + '<p class="meta">Tippen: !bet &lt;1|2&gt; &lt;Punkte&gt;</p></div>';
    }
    function renderPoll() {
      var po = load('streampoll', null);
      if (!po) { pollBox.innerHTML = ''; return; }
      if (Date.now() > po.endsAt) { closePoll(false); return; }
      var left = Math.max(0, Math.round((po.endsAt - Date.now()) / 1000));
      var nm = '';
      try { nm = (chatName.value.trim() || me() || 'Gast').slice(0, 30); } catch (e) {}
      var voted = po.voters[nm];
      pollBox.innerHTML = '<div class="card"><p><strong>📊 ' + esc(po.q) + '</strong> <span class="meta">noch ' + left + 's</span></p>' +
        po.opts.map(function (o, i) {
          var total = po.opts.reduce(function (a, x) { return a + x.v; }, 0);
          var pct = total ? Math.round(o.v * 100 / total) : 0;
          return '<p>' + esc(o.t) + ' — ' + pct + '% (' + o.v + ')' +
            (voted == null ? ' <button type="button" data-pvote="' + i + '">Stimmen</button>' : (voted === i ? ' ◉' : '')) + '</p>';
        }).join('') + '</div>';
      pollBox.querySelectorAll('[data-pvote]').forEach(function (b) {
        b.addEventListener('click', function () {
          var all = load('streampoll', null);
          if (!all || Date.now() > all.endsAt) { renderPoll(); return; }
          var who = '';
          try { who = (chatName.value.trim() || me() || 'Gast').slice(0, 30); } catch (e) {}
          if (!who || all.voters[who] != null) return;
          var idx = +b.getAttribute('data-pvote');
          if (idx < 0 || idx >= all.opts.length) return;
          all.voters[who] = idx; all.opts[idx].v++;
          save('streampoll', all);
          renderPoll();
        });
      });
    }
    function checkExpiry() {
      var pr = load('streampred', null);
      if (pr && pr.open && Date.now() > pr.endsAt) closePred();
      var po = load('streampoll', null);
      if (po && Date.now() > po.endsAt) closePoll(false);
    }
    termAdd.addEventListener('click', function () {
      var t = termIn.value.trim().toLowerCase().slice(0, 40);
      if (!t) return;
      var terms = load('automod', []);
      if (terms.indexOf(t) < 0) terms.push(t);
      save('automod', terms);
      termIn.value = '';
      out.textContent = 'Begriff gesperrt: ' + t;
      renderHolds();
    });
    folOnlyBtn.addEventListener('click', function () {
      var nm = (chatName.value.trim() || me() || 'Gast');
      if (!isMod(nm)) { out.textContent = 'Nur für Mods.'; return; }
      save('folonly', !load('folonly', false));
      renderHolds();
    });
    function renderHolds() {
      var fo = load('folonly', false);
      folOnlyBtn.textContent = 'Follower-Only: ' + (fo ? 'an' : 'aus');
      var terms = load('automod', []);
      var holds = load('holds', []);
      holdBox.innerHTML = '<p class="meta">AutoMod-Begriffe: ' + (terms.map(esc).join(', ') || 'keine') + '</p>' +
        (holds.map(function (h) {
          return '<p><strong>' + esc(h.name) + '</strong>: ' + esc(h.text) +
            ' <button type="button" data-hok="' + h.id + '">OK</button>' +
            ' <button type="button" data-hno="' + h.id + '">Weg</button></p>';
        }).join('') || '<p class="meta">Freigabe-Queue leer.</p>');
      holdBox.querySelectorAll('[data-hok]').forEach(function (b) {
        b.addEventListener('click', function () {
          var all = load('holds', []);
          var h = all.filter(function (x) { return x.id === b.getAttribute('data-hok'); })[0];
          save('holds', all.filter(function (x) { return x.id !== b.getAttribute('data-hok'); }));
          if (h) { pushChatRaw(h.name, h.text, isMod(h.name)); }
          renderHolds();
        });
      });
      holdBox.querySelectorAll('[data-hno]').forEach(function (b) {
        b.addEventListener('click', function () {
          save('holds', load('holds', []).filter(function (x) { return x.id !== b.getAttribute('data-hno'); }));
          renderHolds();
        });
      });
    }
    function addPoints(nm, n) {
      var pts = load('points', {});
      pts[nm] = Math.max(0, (pts[nm] || 0) + n);
      save('points', pts);
      return pts[nm];
    }
    function pushChatRaw(nm, text, mod) {
      var c = load('chat', []);
      c.push({ id: sid(), name: nm, text: text.slice(0, 500), ts: Date.now(), mod: !!mod });
      save('chat', c.slice(-150));
      var st = load('stats', { streams: 0, liveMinutes: 0, chats: 0 });
      st.chats++;
      save('stats', st);
      var counts = load('counts', {});
      counts[nm] = (counts[nm] || 0) + 1;
      save('counts', counts);
      addPoints(nm, 2);
      hypeHit();
      renderChat(true);
    }
    function renderCard() {
      if (!selUser) { cardBox.innerHTML = ''; return; }
      var nm = selUser;
      var c = load('chat', []);
      var mine = c.filter(function (m) { return m.name === nm; });
      var vips = load('mods', []);
      var isVip = load('vips', []).indexOf(nm) >= 0;
      var isM = isMod(nm);
      var pts = load('points', {});
      cardBox.innerHTML = '<div class="card"><h3>' + esc(nm) + '</h3>' +
        '<p class="meta">' + mine.length + ' Nachrichten · ' + (pts[nm] || 0) + ' Punkte' +
        (isM ? ' · <span class="badge">mod</span>' : '') + (isVip ? ' · <span class="badge">💠 VIP</span>' : '') + '</p>' +
        '<p class="meta">' + mine.slice(-3).map(function (m) { return esc(excerpt(m.text, 50)); }).join(' · ') + '</p>' +
        '<p><button type="button" data-cact="to10">Timeout 10m</button> ' +
        '<button type="button" data-cact="ban">Bann</button> ' +
        '<button type="button" data-cact="unban">Entbannen</button> ' +
        '<button type="button" data-cact="vip">VIP an/aus</button> ' +
        '<button type="button" data-cact="clear">Nachrichten löschen</button> ' +
        '<button type="button" data-cact="close">x</button></p></div>';
      var actor = (chatName.value.trim() || me() || 'Gast');
      cardBox.querySelectorAll('[data-cact]').forEach(function (b) {
        b.addEventListener('click', function () {
          var act = b.getAttribute('data-cact');
          if (act === 'close') { selUser = null; renderCard(); return; }
          if (!isMod(actor)) { out.textContent = 'Nur für Mods.'; return; }
          var bans = load('bans', []).filter(function (x) { return x.name !== nm; });
          if (act === 'to10') {
            bans.push({ name: nm, until: Date.now() + 600000 });
            botSay(nm + ' Timeout für 10 Min. (durch ' + actor + ')');
          } else if (act === 'ban') {
            bans.push({ name: nm, until: 0 });
            botSay(nm + ' wurde gebannt. (durch ' + actor + ')');
          } else if (act === 'unban') {
            botSay(nm + ' entbannt.');
          } else if (act === 'vip') {
            var vips2 = load('vips', []);
            if (vips2.indexOf(nm) >= 0) vips2 = vips2.filter(function (x) { return x !== nm; });
            else vips2.push(nm);
            save('vips', vips2);
            botSay(nm + (vips2.indexOf(nm) >= 0 ? ' ist jetzt VIP. 💠' : ' ist kein VIP mehr.'));
            renderCard();
            return;
          } else if (act === 'clear') {
            save('chat', load('chat', []).filter(function (m) { return m.name !== nm; }));
            botSay('Nachrichten von ' + nm + ' gelöscht.');
            renderCard();
            return;
          }
          save('bans', bans);
          renderCard();
        });
      });
    }
    renderHolds(); renderCard(); renderPred(); renderPoll();
  }

  return { viewStream: viewStream };
})();
