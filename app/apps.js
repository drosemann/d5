// In-browser ports of form/table apps. Persistence is localStorage (the
// originals used PHP/MySQL or Flask/SQLite backends, which cannot run from a
// static page); all validation, formatting and balance rules mirror the
// original sources.
window.d5Apps = (function () {
  var store = {
    get: function (k, d) {
      try { var v = localStorage.getItem('d5:' + k); return v == null ? d : JSON.parse(v); }
      catch (e) { return d; }
    },
    set: function (k, v) { try { localStorage.setItem('d5:' + k, JSON.stringify(v)); } catch (e) {} }
  };
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
  function field(label, input) {
    var l = el('label'); l.appendChild(document.createTextNode(label + ' ')); l.appendChild(input);
    return l;
  }
  function input(id, type, value, placeholder) {
    return el('input', null, { id: id, type: type || 'text', value: value == null ? '' : value, placeholder: placeholder || '' });
  }

  // ---------- Guestbook (guestbook html,css,javascript; php/* backend) ----------
  // Keeps: validation (message 10-1000 chars, email format), BBCode toolbar
  // (B/I/U/url/img/emoji), entry list with BBCode rendering + XSS escaping,
  // stats. Not ported: PHP storage (localStorage instead), weather API key,
  // voice recording, visitor map, WebSocket placeholder.
  function bbcode(s) {
    return esc(s)
      .replace(/\[b\](.*?)\[\/b\]/g, '<strong>$1</strong>')
      .replace(/\[i\](.*?)\[\/i\]/g, '<em>$1</em>')
      .replace(/\[u\](.*?)\[\/u\]/g, '<u>$1</u>')
      .replace(/\[url\](.*?)\[\/url\]/g, '<a href="$1" target="_blank" rel="noopener">$1</a>')
      .replace(/\[img\](.*?)\[\/img\]/g, '<img src="$1" alt="User posted image" class="user-image">');
  }
  function socialId() {
    return 'gb' + Date.now().toString(36) + Math.floor(Math.random() * 1296).toString(36);
  }
  function handleFor(name) {
    var h = String(name).toLowerCase().replace(/[^a-z0-9]+/g, '').slice(0, 15);
    return '@' + (h || 'user');
  }
  function normalizeEntry(raw) {
    var now = Date.now();
    var e = {
      id: raw.id || socialId(),
      name: String(raw.name || 'Anonym').slice(0, 40),
      message: String(raw.message || ''),
      date: raw.date || new Date(raw.ts || now).toLocaleString(),
      ts: raw.ts || now,
      likes: raw.likes | 0, liked: !!raw.liked,
      reposts: raw.reposts | 0, reposted: !!raw.reposted,
      views: raw.views | 0,
      replies: Array.isArray(raw.replies) ? raw.replies : []
    };
    e.handle = raw.handle || handleFor(e.name);
    e.quoteId = raw.quoteId || null;
    e.threadId = raw.threadId || null;
    e.bookmarked = !!raw.bookmarked;
    e.pinned = !!raw.pinned;
    e.edited = !!raw.edited;
    e.editedAt = raw.editedAt || null;
    if (raw.poll && typeof raw.poll.q === 'string' && Array.isArray(raw.poll.opts)) {
      e.poll = {
        q: raw.poll.q.slice(0, 140),
        opts: raw.poll.opts.slice(0, 4).map(function (o) {
          return { t: String(o.t || '').slice(0, 60), v: Math.max(0, o.v | 0) };
        }),
        voted: (typeof raw.poll.voted === 'number' ? raw.poll.voted : -1)
      };
    } else e.poll = null;
    return e;
  }
  var AV_COLORS = ['#1d9bf0', '#e91e63', '#4caf50', '#ff9800', '#9c27b0', '#607d8b'];
  function loadProfile() {
    var p = store.get('gbprofile', {});
    if (!p || typeof p !== 'object') p = {};
    return {
      bio: String(p.bio || '').slice(0, 160),
      color: AV_COLORS.indexOf(p.color) >= 0 ? p.color : '#1d9bf0',
      banner: AV_COLORS.indexOf(p.banner) >= 0 ? p.banner : '#16181c'
    };
  }
  function suggestionAuthors(entries, me, follows, muted) {
    var score = {};
    entries.forEach(function (e) {
      if (e.name === me || follows.indexOf(e.name) >= 0 || muted.indexOf(e.name) >= 0) return;
      score[e.name] = (score[e.name] || 0) + 2 + e.likes + e.replies.length;
    });
    return Object.keys(score).sort(function (a, b) { return score[b] - score[a]; }).slice(0, 3);
  }
  function sessionUser() {
    try { return sessionStorage.getItem('d5:session') || ''; } catch (e) { return ''; }
  }
  function readFeed() {
    try {
      var v = JSON.parse(localStorage.getItem('d5_feed'));
      return Array.isArray(v) ? v : [];
    } catch (e) { return []; }
  }
  function writeFeed(feed) {
    localStorage.setItem('d5_feed', JSON.stringify(feed.slice(0, 50)));
  }
  function excerpt(s, n) {
    s = String(s);
    return s.length > n ? s.slice(0, n - 1) + '…' : s;
  }
  function mirrorAdd(e) {
    var feed = readFeed();
    feed.unshift({ text: e.name + ': ' + excerpt(e.message, 140), time: e.ts, id: 'gb-' + e.id });
    writeFeed(feed);
  }
  function mirrorRemove(id) {
    writeFeed(readFeed().filter(function (x) { return x.id !== 'gb-' + id; }));
  }
  function validPost(name, email, message) {
    if (!name) return 'Bitte einen Namen eingeben.';
    if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) return 'Invalid email format.';
    if (message.length < 10 || message.length > 1000) return 'Message must be between 10 and 1000 characters.';
    return '';
  }
  var PAGE_SIZE = 10;
  function tagsOf(text) {
    var tags = {}, m;
    var re = /#([A-Za-z0-9_\u00e4\u00f6\u00fc\u00c4\u00d6\u00dc\u00df]{2,30})/g;
    while ((m = re.exec(String(text)))) tags[m[1].toLowerCase()] = true;
    return Object.keys(tags);
  }
  function tagify(html) {
    return String(html).split(/(<[^>]*>)/g).map(function (part, i) {
      if (i % 2 === 1) return part;
      return part.replace(/#([A-Za-z0-9_\u00e4\u00f6\u00fc\u00c4\u00d6\u00dc\u00df]{2,30})/g,
        '<button type="button" data-tag="$1">#$1</button>');
    }).join('');
  }
  function loadNames(key) {
    var v = store.get(key, []);
    return Array.isArray(v) ? v : [];
  }
  function pushNotif(type, post, by) {
    if (!post || post.name === by) return;
    var notifs = loadNames('gbnotifs');
    notifs.unshift({ id: socialId(), type: type, postId: post.id, by: by, ts: Date.now(), read: false });
    store.set('gbnotifs', notifs.slice(0, 30));
  }
  function postUrl(id) {
    try {
      var base = String(window.location.href).split('#')[0];
      return base + '#/tool/guestbook/' + encodeURIComponent(id);
    } catch (e) { return '#/tool/guestbook/' + id; }
  }
  function dmId() {
    return 'dm' + Date.now().toString(36) + Math.floor(Math.random() * 1296).toString(36);
  }
  function loadConvos() {
    var v = store.get('gbdms', []);
    return Array.isArray(v) ? v : [];
  }
  function saveConvos(c) { store.set('gbdms', c); }
  function convoById(convos, id) {
    return convos.filter(function (c) { return c.id === id; })[0] || null;
  }
  function ensureConvo(convos, name) {
    var c = convos.filter(function (x) { return x.name === name; })[0];
    if (!c) { c = { id: dmId(), name: name, msgs: [], pinned: false, archived: false, created: Date.now() }; convos.unshift(c); }
    return c;
  }
  function dmTicks(m) {
    if (m.from === 'me') return '✓';
    return m.read ? '✓✓' : '✓';
  }
  function viewGuestbook(root, hl) {
    var entries = store.get('guestbook', []).map(normalizeEntry);
    var nowTs = Date.now();
    var schedLeft = loadNames('gbsched');
    var due = schedLeft.filter(function (s) { return s.postAt <= nowTs; });
    if (due.length) {
      store.set('gbsched', schedLeft.filter(function (s) { return s.postAt > nowTs; }));
      due.sort(function (a, b) { return a.postAt - b.postAt; }).forEach(function (s) {
        var de = normalizeEntry({ name: s.name, message: s.message, date: new Date(s.postAt).toLocaleString(), ts: s.postAt });
        entries.unshift(de);
        try { mirrorAdd(de); } catch (e2) {}
      });
    }
    store.set('guestbook', entries);
    var seen = {};
    var me = sessionUser();
    var page = 1, scope = 'all', profileName = null, profileTab = 'posts';
    var highlight = hl || null;
    var editingId = null;
    var follows = loadNames('gbfollows');
    var muted = loadNames('gbmuted');
    var lists = loadNames('gblists');
    var wrap = el('div', null, { 'class': 'tool-form' });
    var name = input('gb-name', 'text', me || '', 'Your Name');
    var email = input('gb-email', 'email', '', 'Your Email');
    var message = el('textarea', null, { id: 'gb-msg', placeholder: 'Your Message (10-1000 Zeichen)' });
    var toolbar = el('div');
    [['B', '[b]', '[/b]'], ['I', '[i]', '[/i]'], ['U', '[u]', '[/u]'],
     ['Link', '[url]', '[/url]'], ['Bild', '[img]', '[/img]'], ['Emoji', null, null]
    ].forEach(function (b) {
      var btn = el('button', b[0], { type: 'button' });
      btn.addEventListener('click', function () {
        if (!b[1]) { message.value += '😊'; message.focus(); return; }
        var s = message.selectionStart || 0, e2 = message.selectionEnd || 0;
        message.value = message.value.slice(0, s) + b[1] + message.value.slice(s, e2) + b[2] + message.value.slice(e2);
        message.focus();
      });
      toolbar.appendChild(btn); toolbar.appendChild(document.createTextNode(' '));
    });
    var send = el('button', 'Posten', { type: 'button' });
    var counter = el('span', '0/1000', { 'class': 'meta' });
    var out = el('div', null, { id: 'gb-out' });
    var filter = input('gb-filter', 'search', '', 'Suchen …');
    var sort = el('select', null, { id: 'gb-sort' });
    sort.appendChild(el('option', 'Neueste zuerst', { value: 'new' }));
    sort.appendChild(el('option', 'Beliebt zuerst', { value: 'top' }));
    var list = el('div');
    wrap.appendChild(field('Name', name)); wrap.appendChild(field('Email', email));
    wrap.appendChild(field('Nachricht', message)); wrap.appendChild(toolbar);
    var row = el('div');
    row.appendChild(send); row.appendChild(document.createTextNode(' ')); row.appendChild(counter);
    wrap.appendChild(row); wrap.appendChild(out);
    var mode = 'post', quoteTarget = null;
    var quoteBar = el('div', null, { id: 'gb-quotebar' });
    var modeRow = el('div');
    var btnPost = el('button', 'Post', { type: 'button' });
    var btnThread = el('button', 'Thread', { type: 'button' });
    var btnPoll = el('button', 'Umfrage', { type: 'button' });
    modeRow.appendChild(btnPost); modeRow.appendChild(document.createTextNode(' '));
    modeRow.appendChild(btnThread); modeRow.appendChild(document.createTextNode(' '));
    modeRow.appendChild(btnPoll);
    var threadBox = el('div', null, { id: 'gb-threadbox' });
    var threadParts = [];
    var threadAdd = el('button', '＋ Teil', { type: 'button' });
    var pollBox = el('div', null, { id: 'gb-pollbox' });
    var pollQ = input('gb-pollq', 'text', '', 'Frage (max. 140)');
    var pollOpts = [input('gb-pollo0', 'text', '', 'Option 1'), input('gb-pollo1', 'text', '', 'Option 2')];
    var pollAdd = el('button', '+ Option', { type: 'button' });
    var profBtn = el('button', 'Profil', { type: 'button', title: 'Bio und Avatarfarbe' });
    var profBox = el('div', null, { id: 'gb-profedit' });
    var profBio = input('gb-bio', 'text', '', 'Bio (max. 160)');
    var profColor = el('select', null, { id: 'gb-color' });
    var profBanner = el('select', null, { id: 'gb-banner' });
    var profSave = el('button', 'Speichern', { type: 'button' });
    AV_COLORS.forEach(function (c) {
      var o = el('option', c, { value: c });
      if (c === loadProfile().color) o.setAttribute('selected', 'selected');
      profColor.appendChild(o);
      var ob = el('option', c, { value: c });
      if (c === loadProfile().banner) ob.setAttribute('selected', 'selected');
      profBanner.appendChild(ob);
    });
    profBio.value = loadProfile().bio;
    wrap.appendChild(quoteBar); wrap.appendChild(modeRow);
    wrap.appendChild(threadBox); wrap.appendChild(threadAdd);
    wrap.appendChild(pollBox);
    pollBox.appendChild(field('Frage', pollQ));
    pollOpts.forEach(function (o, i) { pollBox.appendChild(field('Option ' + (i + 1), o)); });
    pollBox.appendChild(pollAdd);
    wrap.appendChild(profBtn); wrap.appendChild(profBox);
    profBox.appendChild(field('Bio', profBio)); profBox.appendChild(field('Avatarfarbe', profColor));
    profBox.appendChild(field('Banner', profBanner));
    profBox.appendChild(profSave);
    threadBox.style.display = 'none'; threadAdd.style.display = 'none';
    pollBox.style.display = 'none'; profBox.style.display = 'none';
    function addThreadPart(value) {
      var ta = el('textarea', null, { placeholder: 'Teil ' + (threadParts.length + 1) + ' (10-1000 Zeichen)' });
      ta.value = value || '';
      threadParts.push(ta); threadBox.appendChild(ta);
      return ta;
    }
    addThreadPart(); addThreadPart();
    threadAdd.addEventListener('click', function () { if (threadParts.length < 8) addThreadPart(); });
    pollAdd.addEventListener('click', function () {
      if (pollOpts.length >= 4) return;
      var o = input('gb-pollo' + pollOpts.length, 'text', '', 'Option ' + (pollOpts.length + 1));
      pollOpts.push(o); pollBox.insertBefore(field('Option ' + pollOpts.length, o), pollAdd);
    });
    function setMode(m) {
      mode = m;
      var isThread = m === 'thread', isPoll = m === 'poll';
      threadBox.style.display = isThread ? 'block' : 'none';
      threadAdd.style.display = isThread ? '' : 'none';
      pollBox.style.display = isPoll ? 'block' : 'none';
      message.style.display = isThread ? 'none' : '';
    }
    btnPost.addEventListener('click', function () { setMode('post'); });
    btnThread.addEventListener('click', function () { setMode('thread'); });
    btnPoll.addEventListener('click', function () { setMode('poll'); });
    profBtn.addEventListener('click', function () {
      profBox.style.display = profBox.style.display === 'none' ? 'block' : 'none';
    });
    profSave.addEventListener('click', function () {
      store.set('gbprofile', { bio: profBio.value.trim().slice(0, 160), color: profColor.value, banner: profBanner.value });
      out.textContent = 'Profil gespeichert.'; persist(); render();
    });
    function renderQuoteBar() {
      if (!quoteTarget) { quoteBar.innerHTML = ''; return; }
      var q = entries.filter(function (x) { return x.id === quoteTarget; })[0];
      quoteBar.innerHTML = q
        ? '<p class="meta">Zitiert <strong>' + esc(q.name) + '</strong>: ' + esc(excerpt(q.message, 80)) +
          ' <button type="button" data-qcancel="1">Abbrechen</button></p>'
        : '';
      var c = quoteBar.querySelector('[data-qcancel]');
      if (c) c.addEventListener('click', function () { quoteTarget = null; renderQuoteBar(); });
    }
    var bell = el('button', '🔔', { type: 'button', title: 'Mitteilungen' });
    var bellCount = el('span', '', { 'class': 'meta' });
    var scopeRow = el('div');
    var btnAll = el('button', 'Alle', { type: 'button' });
    var btnFol = el('button', 'Folgen', { type: 'button' });
    var btnBm = el('button', 'Gemerkt', { type: 'button' });
    var notifBox = el('div', null, { id: 'gb-notifs' });
    var trendBox = el('div', null, { id: 'gb-trends' });
    var profileBox = el('div', null, { id: 'gb-profile' });
    scopeRow.appendChild(btnAll); scopeRow.appendChild(document.createTextNode(' '));
    scopeRow.appendChild(btnFol); scopeRow.appendChild(document.createTextNode(' '));
    scopeRow.appendChild(btnBm); scopeRow.appendChild(document.createTextNode(' '));
    scopeRow.appendChild(bell); scopeRow.appendChild(document.createTextNode(' '));
    scopeRow.appendChild(bellCount);
    wrap.appendChild(scopeRow); wrap.appendChild(notifBox); wrap.appendChild(trendBox);
    wrap.appendChild(profileBox);
    var hlBox = el('div', null, { id: 'gb-hl' });
    var listSel = el('select', null, { id: 'gb-listsel' });
    var listsBtn = el('button', 'Listen', { type: 'button' });
    var listsBox = el('div', null, { id: 'gb-lists' });
    var muteBox = el('div', null, { id: 'gb-muted' });
    var schedInput = el('input', null, { id: 'gb-sched', type: 'datetime-local' });
    var schedBtn = el('button', 'Planen', { type: 'button' });
    var schedToggle = el('button', 'Geplant', { type: 'button' });
    var schedBox = el('div', null, { id: 'gb-schedlist' });
    var draftNote = el('div', null, { id: 'gb-draft' });
    scopeRow.appendChild(document.createTextNode(' '));
    scopeRow.appendChild(listSel); scopeRow.appendChild(document.createTextNode(' '));
    scopeRow.appendChild(listsBtn);
    wrap.appendChild(hlBox); wrap.appendChild(listsBox); wrap.appendChild(muteBox);
    wrap.appendChild(draftNote);
    var schedRow = el('div');
    schedRow.appendChild(schedInput); schedRow.appendChild(document.createTextNode(' '));
    schedRow.appendChild(schedBtn); schedRow.appendChild(document.createTextNode(' '));
    schedRow.appendChild(schedToggle);
    wrap.appendChild(schedRow); wrap.appendChild(schedBox);
    listsBox.style.display = 'none'; schedBox.style.display = 'none';
    wrap.appendChild(field('Filter', filter)); wrap.appendChild(field('Sortierung', sort));
    var mainTab = 'time', dmConvoId = null, dmAsMe = true, dmReplyTo = null, dmSearch = '', dmShowArch = false;
    var dmRec = null, dmRecChunks = [], dmRecTimer = null, dmRecStart = 0;
    var tabRow = el('div');
    var btnTime = el('button', 'Timeline', { type: 'button' });
    var btnDm = el('button', 'Nachrichten', { type: 'button' });
    var dmBox = el('div', null, { id: 'gb-dms' });
    tabRow.appendChild(btnTime); tabRow.appendChild(document.createTextNode(' ')); tabRow.appendChild(btnDm);
    root.appendChild(tabRow); root.appendChild(wrap); root.appendChild(list); root.appendChild(dmBox);
    btnTime.addEventListener('click', function () { mainTab = 'time'; render(); });
    btnDm.addEventListener('click', function () { mainTab = 'dm'; dmSearch = ''; render(); });
    function openDm(name) {
      var convos = loadConvos();
      var c = ensureConvo(convos, name);
      saveConvos(convos);
      mainTab = 'dm'; dmConvoId = c.id; dmAsMe = true; dmReplyTo = null; dmSearch = '';
      render();
    }
    function dmPreview(m) {
      if (!m) return 'Noch keine Nachrichten.';
      if (m.audio) return '🎤 Sprachnachricht (' + Math.round(m.dur || 0) + 's)';
      return excerpt(m.text || '', 60);
    }
    function renderDm() {
      var showDm = mainTab === 'dm';
      wrap.style.display = showDm ? 'none' : '';
      list.style.display = showDm ? 'none' : '';
      dmBox.style.display = showDm ? '' : 'none';
      if (!showDm) return;
      var convos = loadConvos();
      var c = dmConvoId ? convoById(convos, dmConvoId) : null;
      if (!c) {
        var vis = convos.filter(function (x) { return dmShowArch ? x.archived : !x.archived; });
        vis.sort(function (a, b) {
          if ((b.pinned ? 1 : 0) !== (a.pinned ? 1 : 0)) return (b.pinned ? 1 : 0) - (a.pinned ? 1 : 0);
          var am = a.msgs[a.msgs.length - 1], bm = b.msgs[b.msgs.length - 1];
          return ((bm && bm.ts) || a.created) - ((am && am.ts) || a.created);
        });
        dmBox.innerHTML = '<p class="meta">Private Chats — lokal auf diesem Gerät, nichts landet im Feed.</p>' +
          '<p><input data-dmnew="" placeholder="Name für neuen Chat"> <button type="button" data-dmcreate="1">＋</button> ' +
          '<button type="button" data-dmarch="1">' + (dmShowArch ? 'Aktive' : 'Archiv (' +
            convos.filter(function (x) { return x.archived; }).length + ')') + '</button></p>' +
          (vis.map(function (x) {
            var last = x.msgs[x.msgs.length - 1];
            return '<article class="feed-card" data-dmopen="' + x.id + '">' +
              '<div class="feed-head"><div class="avatar sm">' + esc(x.name[0].toUpperCase()) + '</div>' +
              '<div><span class="name">' + esc(x.name) + '</span> ' +
              (x.pinned ? '<span class="badge">📌</span>' : '') +
              '<span class="handle">' + (last ? esc(new Date(last.ts).toLocaleString()) : '') + '</span></div></div>' +
              '<div class="feed-body">' + esc(dmPreview(last)) + '</div>' +
              '<div class="feed-actions">' +
              '<span><button type="button" data-dmpin="' + x.id + '">' + (x.pinned ? '📌' : '📍') + '</button></span>' +
              '<span><button type="button" data-dmarch1="' + x.id + '">' + (x.archived ? 'Entarchivieren' : 'Archiv') + '</button></span>' +
              '<span><button type="button" data-dmdel="' + x.id + '">Löschen</button></span></div></article>';
          }).join('') || '<p class="meta">Keine Chats. Lege oben einen an — oder tippe im Profil auf „Nachricht“.</p>');
        bindDmInbox(convos);
        return;
      }
      c.msgs.forEach(function (m) { if (m.from !== 'me') m.read = true; });
      saveConvos(convos);
      var shown = dmSearch
        ? c.msgs.filter(function (m) { return (m.text || '').toLowerCase().indexOf(dmSearch.toLowerCase()) >= 0; })
        : c.msgs;
      dmBox.innerHTML = '<p><button type="button" data-dmback="1">← Alle Chats</button></p>' +
        '<div class="feed-head"><div class="avatar sm">' + esc(c.name[0].toUpperCase()) + '</div>' +
        '<div><span class="name">' + esc(c.name) + '</span> <span class="handle">' + c.msgs.length + ' Nachrichten</span></div></div>' +
        '<p class="meta">Ich schreibe als: <select data-dmas="1">' +
        '<option value="me"' + (dmAsMe ? ' selected' : '') + '>' + esc(me || 'Ich') + '</option>' +
        '<option value="ct"' + (!dmAsMe ? ' selected' : '') + '>' + esc(c.name) + '</option></select> ' +
        '<input data-dmfind="" placeholder="Im Chat suchen" value="' + esc(dmSearch) + '"></p>' +
        '<div>' + (shown.map(function (m) {
          var q = '';
          if (m.replyTo) {
            var qm = c.msgs.filter(function (x) { return x.id === m.replyTo; })[0];
            q = '<p class="meta">↩ ' + esc(qm ? (qm.audio ? '🎤 Sprachnachricht' : excerpt(qm.text || '', 60)) : '(gelöscht)') + '</p>';
          }
          var body = m.audio
            ? '<audio controls src="' + esc(m.audio) + '"></audio>'
            : '<p>' + tagify(bbcode(m.text || '')) + '</p>';
          return '<article class="feed-card"><div class="feed-head"><div class="avatar sm">' +
            esc((m.from === 'me' ? (me || 'I') : c.name)[0].toUpperCase()) + '</div>' +
            '<div><span class="name">' + esc(m.from === 'me' ? (me || 'Ich') : c.name) + '</span> ' +
            '<span class="handle">' + esc(new Date(m.ts).toLocaleString()) + ' · ' + dmTicks(m) + '</span></div></div>' +
            q + body +
            '<div class="feed-actions">' +
            '<span><button type="button" data-dmrep="' + m.id + '">Antworten</button></span>' +
            (m.text ? '<span><button type="button" data-dmfwd="' + m.id + '">Teilen</button></span>' : '') +
            '<span><button type="button" data-dmdelmsg="' + m.id + '">Löschen</button></span></div></article>';
        }).join('') || '<p class="meta">Noch nichts hier. Schreib die erste Nachricht.</p>') + '</div>' +
        '<div data-dmreplybar="">' + (function () {
          if (!dmReplyTo) return '';
          var qm = c.msgs.filter(function (x) { return x.id === dmReplyTo; })[0];
          return '<p class="meta">Antwort auf: ' + esc(qm ? (qm.audio ? '🎤 Sprachnachricht' : excerpt(qm.text || '', 60)) : '(gelöscht)') +
            ' <button type="button" data-dmreplycancel="1">x</button></p>';
        })() + '</div>' +
        '<p><input data-dmin="" placeholder="Nachricht (Enter = senden)"> ' +
        '<button type="button" data-dmsend="1">Senden</button> ' +
        '<button type="button" data-dmmic="1">🎤</button> <span class="meta" data-dmrect=""></span></p>';
      bindDmChat(convos, c);
    }
    function dmPersistAndRender(convos) { saveConvos(convos); render(); }
    function bindDmInbox(convos) {
      dmBox.querySelectorAll('[data-dmopen]').forEach(function (card) {
        card.addEventListener('click', function (ev) {
          var btn = ev.target && ev.target.closest ? ev.target.closest('button') : null;
          if (btn) return;
          dmConvoId = card.getAttribute('data-dmopen'); dmAsMe = true; dmReplyTo = null; dmSearch = '';
          render();
        });
      });
      function q(s) { return dmBox.querySelector(s); }
      var nc = q('[data-dmcreate]');
      if (nc) nc.addEventListener('click', function () {
        var inp = q('[data-dmnew]');
        var nm = inp ? inp.value.trim().slice(0, 40) : '';
        if (!nm) return;
        var all = loadConvos();
        var cc = ensureConvo(all, nm);
        saveConvos(all);
        dmConvoId = cc.id; dmAsMe = true; dmReplyTo = null; dmSearch = '';
        render();
      });
      var ar = q('[data-dmarch]');
      if (ar) ar.addEventListener('click', function () { dmShowArch = !dmShowArch; render(); });
      dmBox.querySelectorAll('[data-dmpin]').forEach(function (b) {
        b.addEventListener('click', function () {
          var all = loadConvos();
          var x = convoById(all, b.getAttribute('data-dmpin'));
          if (x) x.pinned = !x.pinned;
          dmPersistAndRender(all);
        });
      });
      dmBox.querySelectorAll('[data-dmarch1]').forEach(function (b) {
        b.addEventListener('click', function () {
          var all = loadConvos();
          var x = convoById(all, b.getAttribute('data-dmarch1'));
          if (x) x.archived = !x.archived;
          dmPersistAndRender(all);
        });
      });
      dmBox.querySelectorAll('[data-dmdel]').forEach(function (b) {
        b.addEventListener('click', function () {
          dmPersistAndRender(loadConvos().filter(function (x) { return x.id !== b.getAttribute('data-dmdel'); }));
        });
      });
    }
    function dmSendText(convos, c) {
      var inp = dmBox.querySelector('[data-dmin]');
      var txt = inp ? inp.value.trim() : '';
      if (!txt || txt.length > 2000) { out.textContent = 'Nachricht muss 1–2000 Zeichen haben.'; mainTab = 'time'; render(); return; }
      c.msgs.push({ id: dmId(), from: dmAsMe ? 'me' : c.name, text: txt, ts: Date.now(), read: dmAsMe, replyTo: dmReplyTo });
      dmReplyTo = null;
      dmPersistAndRender(convos);
    }
    function bindDmChat(convos, c) {
      function q(s) { return dmBox.querySelector(s); }
      var back = q('[data-dmback]');
      if (back) back.addEventListener('click', function () { dmConvoId = null; render(); });
      var asSel = q('[data-dmas]');
      if (asSel) asSel.addEventListener('change', function () { dmAsMe = asSel.value === 'me'; });
      var find = q('[data-dmfind]');
      if (find) find.addEventListener('input', function () {
        dmSearch = find.value;
        var pos = find.selectionStart;
        renderDm();
        var again = dmBox.querySelector('[data-dmfind]');
        if (again) { again.focus(); try { again.setSelectionRange(pos, pos); } catch (e) {} }
      });
      var send = q('[data-dmsend]');
      if (send) send.addEventListener('click', function () { dmSendText(loadConvos(), convoById(loadConvos(), c.id)); });
      var inp = q('[data-dmin]');
      if (inp) {
        inp.addEventListener('keydown', function (e) {
          if (e.key === 'Enter' && !e.shiftKey) { e.preventDefault(); dmSendText(loadConvos(), convoById(loadConvos(), c.id)); }
        });
        inp.focus();
      }
      var rc = q('[data-dmreplycancel]');
      if (rc) rc.addEventListener('click', function () { dmReplyTo = null; render(); });
      dmBox.querySelectorAll('[data-dmrep]').forEach(function (b) {
        b.addEventListener('click', function () { dmReplyTo = b.getAttribute('data-dmrep'); renderDm(); });
      });
      dmBox.querySelectorAll('[data-dmdelmsg]').forEach(function (b) {
        b.addEventListener('click', function () {
          var all = loadConvos();
          var cc = convoById(all, c.id);
          if (cc) cc.msgs = cc.msgs.filter(function (m) { return m.id !== b.getAttribute('data-dmdelmsg'); });
          dmPersistAndRender(all);
        });
      });
      dmBox.querySelectorAll('[data-dmfwd]').forEach(function (b) {
        b.addEventListener('click', function () {
          var cc = convoById(loadConvos(), c.id) || c;
          var m = cc.msgs.filter(function (x) { return x.id === b.getAttribute('data-dmfwd'); })[0];
          if (!m || !m.text) return;
          mainTab = 'time';
          publishOne({ name: actorName(), message: m.text }, null);
          clearComposer();
          out.textContent = 'Im Feed geteilt.'; render();
        });
      });
      var mic = q('[data-dmmic]');
      if (mic) mic.addEventListener('click', function () { dmToggleRec(convos, c); });
    }
    function dmToggleRec(convos, c) {
      var label = dmBox.querySelector('[data-dmrect]');
      if (dmRec) {
        try { dmRec.stop(); } catch (e) {}
        return;
      }
      if (!navigator.mediaDevices || !navigator.mediaDevices.getUserMedia || typeof MediaRecorder === 'undefined') {
        out.textContent = 'Sprachnachrichten werden von diesem Browser nicht unterstützt.';
        mainTab = 'time'; render();
        return;
      }
      navigator.mediaDevices.getUserMedia({ audio: true }).then(function (stream) {
        try {
          dmRecChunks = [];
          dmRec = new MediaRecorder(stream);
        } catch (e) {
          stream.getTracks().forEach(function (t) { t.stop(); });
          out.textContent = 'Aufnahme fehlgeschlagen.';
          return;
        }
        dmRecStart = Date.now();
        dmRec.ondataavailable = function (ev) { if (ev.data && ev.data.size) dmRecChunks.push(ev.data); };
        dmRec.onstop = function () {
          stream.getTracks().forEach(function (t) { t.stop(); });
          if (dmRecTimer) { clearInterval(dmRecTimer); dmRecTimer = null; }
          var dur = Math.round((Date.now() - dmRecStart) / 1000);
          var mime = (dmRec && dmRec.mimeType) || 'audio/webm';
          dmRec = null;
          if (label) label.textContent = '';
          if (!dmRecChunks.length || dur < 1) { render(); return; }
          var blob = new Blob(dmRecChunks, { type: mime });
          if (blob.size > 1500000) {
            out.textContent = 'Zu lang — Sprachnachrichten sind auf ~60s begrenzt (Speicherplatz).';
            mainTab = 'time'; render();
            return;
          }
          var fr = new FileReader();
          fr.onload = function () {
            var all = loadConvos();
            var cc = convoById(all, c.id);
            if (!cc) return;
            cc.msgs.push({ id: dmId(), from: dmAsMe ? 'me' : cc.name, text: '', audio: String(fr.result), dur: dur, ts: Date.now(), read: dmAsMe, replyTo: dmReplyTo });
            dmReplyTo = null;
            dmPersistAndRender(all);
          };
          fr.readAsDataURL(blob);
        };
        dmRec.start();
        if (label) {
          label.textContent = '● 0s (zum Stoppen erneut 🎤)';
          dmRecTimer = setInterval(function () {
            if (label) label.textContent = '● ' + Math.round((Date.now() - dmRecStart) / 1000) + 's (zum Stoppen erneut 🎤)';
          }, 500);
        }
      }).catch(function () {
        out.textContent = 'Mikrofon verweigert oder nicht verfügbar.';
      });
    }
    function actorName() { return name.value.trim() || me || 'Anonym'; }
    function copyText(txt, okMsg) {
      function done() { out.textContent = okMsg || 'Link kopiert.'; }
      function fallback() {
        var ta = document.createElement('textarea');
        ta.value = txt; document.body.appendChild(ta); ta.select();
        try { document.execCommand('copy'); done(); }
        catch (e2) { out.textContent = 'Kopieren fehlgeschlagen: ' + txt; }
        document.body.removeChild(ta);
      }
      try {
        if (navigator.clipboard && navigator.clipboard.writeText) {
          navigator.clipboard.writeText(txt).then(done, fallback);
          return;
        }
        fallback();
      } catch (e) { fallback(); }
    }
    function sharePost(en) {
      var url = postUrl(en.id);
      try {
        if (navigator.share) {
          navigator.share({ title: 'd5 Guestbook', text: excerpt(en.message, 100), url: url }).catch(function () {});
          return;
        }
      } catch (e) {}
      copyText(url, 'Link kopiert (Teilen nicht verfügbar).');
    }
    function refreshBell() {
      var unread = loadNames('gbnotifs').filter(function (n) { return !n.read; }).length;
      bellCount.textContent = unread ? unread + ' neu' : '';
    }
    function renderNotifs(show) {
      var notifs = loadNames('gbnotifs');
      if (!show) { notifBox.innerHTML = ''; return; }
      notifBox.innerHTML = '<p class="meta">Mitteilungen (' + notifs.length + ') ' +
        '<button type="button" data-nread="1">Alle als gelesen</button></p>' +
        (notifs.map(function (n) {
          var what = n.type === 'like' ? 'mag deinen Post' : (n.type === 'repost' ? 'hat deinen Post geteilt' : 'hat geantwortet');
          return '<p class="meta">' + (n.read ? '' : '<strong>neu</strong> ') + esc(n.by) + ' ' + what +
            ' <span class="meta">' + esc(new Date(n.ts).toLocaleString()) + '</span></p>';
        }).join('') || '<p class="meta">Keine Mitteilungen.</p>');
      var mark = notifBox.querySelector('[data-nread]');
      if (mark) mark.addEventListener('click', function () {
        store.set('gbnotifs', notifs.map(function (n) { n.read = true; return n; }));
        refreshBell(); renderNotifs(true);
      });
    }
    var notifsOpen = false;
    bell.addEventListener('click', function () { notifsOpen = !notifsOpen; renderNotifs(notifsOpen); });
    btnAll.addEventListener('click', function () { scope = 'all'; page = 1; render(); });
    btnFol.addEventListener('click', function () { scope = 'following'; page = 1; render(); });
    btnBm.addEventListener('click', function () { scope = 'bookmarks'; page = 1; render(); });
    function refreshListSel() {
      lists = loadNames('gblists');
      listSel.innerHTML = '<option value="">Liste…</option>' + lists.map(function (l) {
        return '<option value="' + l.id + '"' + (scope === 'list:' + l.id ? ' selected' : '') + '>' + esc(l.name) + '</option>';
      }).join('');
    }
    listSel.addEventListener('change', function () {
      scope = listSel.value ? 'list:' + listSel.value : 'all';
      page = 1; render();
    });
    var listsOpen = false;
    listsBtn.addEventListener('click', function () { listsOpen = !listsOpen; renderLists(); });
    function renderLists() {
      listsBox.style.display = listsOpen ? 'block' : 'none';
      if (!listsOpen) return;
      lists = loadNames('gblists');
      listsBox.innerHTML = '<p class="meta">Listen: eigene Timelines aus Autoren.</p>' +
        '<p><input data-lnew="" placeholder="Neue Liste"> <button type="button" data-lcreate="1">Anlegen</button></p>' +
        lists.map(function (l) {
          return '<div><p><strong>' + esc(l.name) + '</strong> (' + l.members.length + ') ' +
            '<button type="button" data-lview="' + l.id + '">Ansehen</button> ' +
            '<button type="button" data-ldel="' + l.id + '">Löschen</button></p>' +
            '<p>' + (l.members.map(function (m) {
              return esc(m) + ' <button type="button" data-lrm="' + l.id + ':' + esc(m) + '">x</button>';
            }).join(' ') || '<span class="meta">leer</span>') + '</p>' +
            '<p><input data-ladd="' + l.id + '" placeholder="Autor hinzufügen"> ' +
            '<button type="button" data-laddbtn="' + l.id + '">＋</button></p></div>';
        }).join('');
      function q(s) { return listsBox.querySelector(s); }
      function qa(s) { return listsBox.querySelectorAll(s); }
      var c = q('[data-lcreate]');
      if (c) c.addEventListener('click', function () {
        var inp = q('[data-lnew]');
        var nm = inp ? inp.value.trim().slice(0, 30) : '';
        if (!nm) return;
        lists.push({ id: socialId(), name: nm, members: [] });
        store.set('gblists', lists); refreshListSel(); renderLists();
      });
      qa('[data-ldel]').forEach(function (b) {
        b.addEventListener('click', function () {
          lists = lists.filter(function (x) { return x.id !== b.getAttribute('data-ldel'); });
          store.set('gblists', lists);
          if (scope === 'list:' + b.getAttribute('data-ldel')) scope = 'all';
          refreshListSel(); renderLists(); render();
        });
      });
      qa('[data-lview]').forEach(function (b) {
        b.addEventListener('click', function () { scope = 'list:' + b.getAttribute('data-lview'); page = 1; render(); });
      });
      qa('[data-laddbtn]').forEach(function (b) {
        b.addEventListener('click', function () {
          var id = b.getAttribute('data-laddbtn');
          var inp = q('[data-ladd="' + id + '"]');
          var nm = inp ? inp.value.trim().slice(0, 40) : '';
          if (!nm) return;
          lists = loadNames('gblists');
          var li = lists.filter(function (x) { return x.id === id; })[0];
          if (li && li.members.indexOf(nm) < 0) li.members.push(nm);
          store.set('gblists', lists); renderLists();
        });
      });
      qa('[data-lrm]').forEach(function (b) {
        b.addEventListener('click', function () {
          var parts = b.getAttribute('data-lrm').split(':');
          lists = loadNames('gblists');
          var li = lists.filter(function (x) { return x.id === parts[0]; })[0];
          if (li) li.members = li.members.filter(function (m) { return m !== parts.slice(1).join(':'); });
          store.set('gblists', lists); renderLists(); render();
        });
      });
    }
    function renderMuted() {
      muted = loadNames('gbmuted');
      muteBox.innerHTML = muted.length
        ? '<p class="meta">Stumm: ' + muted.map(function (m) {
          return esc(m) + ' <button type="button" data-unmute="' + esc(m) + '">x</button>';
        }).join(' ') + '</p>'
        : '';
      muteBox.querySelectorAll('[data-unmute]').forEach(function (b) {
        b.addEventListener('click', function () {
          muted = muted.filter(function (m) { return m !== b.getAttribute('data-unmute'); });
          store.set('gbmuted', muted); render();
        });
      });
    }
    function pendingSched() { return loadNames('gbsched').sort(function (a, b) { return a.postAt - b.postAt; }); }
    function renderSched() {
      var all = pendingSched();
      schedToggle.textContent = 'Geplant (' + all.length + ')';
      if (schedBox.style.display === 'none') return;
      schedBox.innerHTML = all.length
        ? all.map(function (s) {
          return '<p class="meta">' + esc(new Date(s.postAt).toLocaleString()) + ' — <strong>' + esc(s.name) +
            '</strong>: ' + esc(excerpt(s.message, 60)) +
            ' <button type="button" data-schedcancel="' + s.id + '">Abbrechen</button></p>';
        }).join('')
        : '<p class="meta">Nichts geplant.</p>';
      schedBox.querySelectorAll('[data-schedcancel]').forEach(function (b) {
        b.addEventListener('click', function () {
          store.set('gbsched', loadNames('gbsched').filter(function (x) { return x.id !== b.getAttribute('data-schedcancel'); }));
          renderSched();
        });
      });
    }
    schedToggle.addEventListener('click', function () {
      schedBox.style.display = schedBox.style.display === 'none' ? 'block' : 'none';
      renderSched();
    });
    schedBtn.addEventListener('click', function () {
      if (mode !== 'post') { out.textContent = 'Planen geht nur im Post-Modus.'; return; }
      var fd = { name: name.value.trim(), email: email.value.trim(), message: message.value.trim() };
      var err = validPost(fd.name, fd.email, fd.message);
      if (err) { out.textContent = err; return; }
      var when = new Date(schedInput.value).getTime();
      if (!when || when <= Date.now()) { out.textContent = 'Bitte einen Zeitpunkt in der Zukunft wählen.'; return; }
      var all = loadNames('gbsched');
      all.push({ id: socialId(), name: fd.name, message: fd.message, postAt: when });
      store.set('gbsched', all);
      message.value = ''; counter.textContent = '0/1000'; saveDraft();
      out.textContent = 'Geplant für ' + new Date(when).toLocaleString() + '.'; renderSched();
    });
    function saveDraft() {
      if (mode !== 'post') return;
      var d = { name: name.value, email: email.value, message: message.value };
      if (d.name || d.email || d.message) {
        store.set('gbdraft', d);
        draftNote.innerHTML = '<p class="meta">Entwurf gespeichert. <button type="button" data-draftdrop="1">Verwerfen</button></p>';
      } else {
        store.set('gbdraft', null);
        draftNote.innerHTML = '';
      }
      var drop = draftNote.querySelector('[data-draftdrop]');
      if (drop) drop.addEventListener('click', function () {
        store.set('gbdraft', null); draftNote.innerHTML = '';
      });
    }
    (function restoreDraft() {
      var d = store.get('gbdraft', null);
      if (!d || typeof d !== 'object') return;
      if (!message.value && !name.value) {
        name.value = d.name || ''; email.value = d.email || ''; message.value = d.message || '';
        counter.textContent = message.value.length + '/1000';
        draftNote.innerHTML = '<p class="meta">Entwurf wiederhergestellt. <button type="button" data-draftdrop="1">Verwerfen</button></p>';
        var drop = draftNote.querySelector('[data-draftdrop]');
        if (drop) drop.addEventListener('click', function () {
          store.set('gbdraft', null); draftNote.innerHTML = '';
        });
      }
    })();
    function persist() { store.set('guestbook', entries); }
    function stats() {
      var likes = entries.reduce(function (a, e) { return a + e.likes; }, 0);
      var replies = entries.reduce(function (a, e) { return a + e.replies.length; }, 0);
      var bms = entries.filter(function (e) { return e.bookmarked; }).length;
      return entries.length + ' Posts · ' + likes + ' Likes · ' + replies + ' Antworten · ' + bms + ' gemerkt';
    }
    function threadInfo(en) {
      if (!en.threadId) return null;
      var sibs = entries.filter(function (x) { return x.threadId === en.threadId; })
        .sort(function (a, b) { return a.ts - b.ts; });
      for (var i = 0; i < sibs.length; i++) if (sibs[i].id === en.id) return { i: i + 1, n: sibs.length };
      return { i: 1, n: sibs.length };
    }
    function quoteHtml(en) {
      if (!en.quoteId) return '';
      var q = entries.filter(function (x) { return x.id === en.quoteId; })[0];
      if (!q) return '<p class="meta">Zitierter Post gelöscht.</p>';
      return '<div class="quoted"><p class="meta">Zitiert <strong>' + esc(q.name) + '</strong> ' +
        esc(q.handle) + '</p><p>' + tagify(bbcode(q.message)) + '</p></div>';
    }
    function pollHtml(en) {
      if (!en.poll) return '';
      var total = en.poll.opts.reduce(function (a, o) { return a + o.v; }, 0);
      return '<div class="poll"><p><strong>' + esc(en.poll.q) + '</strong></p>' +
        en.poll.opts.map(function (o, i) {
          var pct = total ? Math.round(o.v * 100 / total) : 0;
          var bar = new Array(Math.round(pct / 10) + 1).join('█');
          var mark = en.poll.voted === i ? '◉ ' : '○ ';
          return '<p>' + mark + esc(o.t) + ' — ' + pct + '% (' + o.v + ') ' + bar +
            (en.poll.voted < 0 ? ' <button type="button" data-vote="' + en.id + ':' + i + '">Stimmen</button>' : '') + '</p>';
        }).join('') + '<p class="meta">' + total + ' Stimmen</p></div>';
    }
    function visible() {
      if (highlight) return entries.filter(function (e) { return e.id === highlight; });
      var q = filter.value.trim().toLowerCase();
      var v = entries.filter(function (e) {
        if (muted.indexOf(e.name) >= 0) return false;
        if (profileName && e.name !== profileName) return false;
        if (profileName && profileTab === 'media' && e.message.indexOf('[img]') < 0) return false;
        if (profileName && profileTab === 'threads' && !e.threadId) return false;
        if (scope === 'following' && follows.indexOf(e.name) < 0) return false;
        if (scope === 'bookmarks' && !e.bookmarked) return false;
        if (scope.indexOf('list:') === 0) {
          var lid = scope.slice(5);
          var li = lists.filter(function (x) { return x.id === lid; })[0];
          if (!li || li.members.indexOf(e.name) < 0) return false;
        }
        if (!q) return true;
        if (q[0] === '#') return tagsOf(e.message).indexOf(q.slice(1)) >= 0;
        return e.name.toLowerCase().indexOf(q) >= 0 || e.message.toLowerCase().indexOf(q) >= 0;
      });
      v.sort(function (a, b) {
        return sort.value === 'top' ? (b.likes - a.likes) || (b.ts - a.ts) : b.ts - a.ts;
      });
      if (profileName && profileTab === 'posts') {
        v.sort(function (a, b) { return ((b.pinned ? 1 : 0) - (a.pinned ? 1 : 0)); });
      }
      return v;
    }
    function renderTrends() {
      var counts = {};
      entries.forEach(function (e) {
        tagsOf(e.message).forEach(function (t) { counts[t] = (counts[t] || 0) + 1; });
      });
      var top = Object.keys(counts).sort(function (a, b) { return counts[b] - counts[a]; }).slice(0, 5);
      trendBox.innerHTML = top.length
        ? '<p class="meta">Trends: ' + top.map(function (t) {
          return '<button type="button" data-tag="' + esc(t) + '">#' + esc(t) + ' (' + counts[t] + ')</button>';
        }).join(' ') + '</p>'
        : '';
      trendBox.querySelectorAll('[data-tag]').forEach(function (b) {
        b.addEventListener('click', function () {
          filter.value = '#' + b.getAttribute('data-tag'); page = 1; render();
        });
      });
      var sug = suggestionAuthors(entries, me, follows, muted);
      if (sug.length && !profileName && !highlight) {
        var sp = document.createElement('p');
        sp.setAttribute('class', 'meta');
        sp.innerHTML = 'Folgen vielleicht: ' + sug.map(function (n) {
          return '<button type="button" data-sug="' + esc(n) + '">' + esc(n) + '</button>';
        }).join(' ');
        trendBox.appendChild(sp);
        sp.querySelectorAll('[data-sug]').forEach(function (b) {
          b.addEventListener('click', function () { profileName = b.getAttribute('data-sug'); page = 1; render(); });
        });
      }
    }
    function renderProfile() {
      if (!profileName) { profileBox.innerHTML = ''; return; }
      var mine = entries.filter(function (e) { return e.name === profileName; });
      var likes = mine.reduce(function (a, e) { return a + e.likes; }, 0);
      var isMe = me && profileName === me;
      var following = follows.indexOf(profileName) >= 0;
      var prof = isMe ? loadProfile() : null;
      var nMedia = mine.filter(function (e) { return e.message.indexOf('[img]') >= 0; }).length;
      var nThreads = mine.filter(function (e) { return e.threadId; }).length;
      var pinned = mine.filter(function (e) { return e.pinned; })[0];
      profileBox.innerHTML =
        '<div style="height:48px;background:' + (prof ? prof.banner : '#16181c') + ';border-radius:8px"></div>' +
        '<p class="meta"><strong>' + esc(profileName) + '</strong> ' +
        esc(handleFor(profileName)) + ' · ' + mine.length + ' Posts · ' + likes + ' Likes' +
        (prof && prof.bio ? '<br>' + esc(prof.bio) : '') + '<br>' +
        (isMe ? '<span class="badge">you</span> ' : '<button type="button" data-proffol="1">' +
          (following ? 'Entfolgen' : 'Folgen') + '</button> ') +
        '<button type="button" data-proftab="posts">Posts</button> ' +
        '<button type="button" data-proftab="media">Medien (' + nMedia + ')</button> ' +
        '<button type="button" data-proftab="threads">Threads (' + nThreads + ')</button> ' +
        '<button type="button" data-profmsg="1">Nachricht</button> ' +
        '<button type="button" data-profclose="1">Zurück</button></p>' +
        (pinned && profileTab === 'posts' ? '<p class="meta">📌 Angeheftet</p>' : '');
      var f = profileBox.querySelector('[data-proffol]');
      if (f) f.addEventListener('click', function () {
        follows = loadNames('gbfollows');
        var i = follows.indexOf(profileName);
        if (i >= 0) follows.splice(i, 1); else follows.push(profileName);
        store.set('gbfollows', follows);
        render();
      });
      var c = profileBox.querySelector('[data-profclose]');
      if (c) c.addEventListener('click', function () { profileName = null; page = 1; render(); });
      var dmBtn = profileBox.querySelector('[data-profmsg]');
      if (dmBtn && profileName) dmBtn.addEventListener('click', function () { openDm(profileName); });
      profileBox.querySelectorAll('[data-proftab]').forEach(function (b) {
        b.addEventListener('click', function () { profileTab = b.getAttribute('data-proftab'); page = 1; render(); });
      });
    }
    function replyHtml(e) {
      return e.replies.map(function (r, i) {
        return '<p><strong>' + esc(r.name) + '</strong> <span class="meta">' + esc(r.date) + '</span><br>' +
          tagify(bbcode(r.message)) +
          ' <button type="button" data-repdel="' + e.id + ':' + i + '">Löschen</button></p>';
      }).join('');
    }
    function render() {
      var i, e;
      for (i = 0; i < entries.length; i++) {
        e = entries[i];
        if (!seen[e.id]) { seen[e.id] = true; e.views++; }
      }
      persist();
      refreshBell(); refreshListSel(); renderTrends(); renderProfile(); renderMuted(); renderSched(); renderDm();
      if (highlight) {
        var found = entries.filter(function (e) { return e.id === highlight; })[0];
        hlBox.innerHTML = found
          ? '<p class="meta">Permalink · <a href="#/tool/guestbook">Zurück zur Timeline</a></p>'
          : '<p class="meta">Post nicht gefunden. <a href="#/tool/guestbook">Zurück zur Timeline</a></p>';
      } else hlBox.innerHTML = '';
      var v = visible();
      var pages = Math.max(1, Math.ceil(v.length / PAGE_SIZE));
      if (page > pages) page = pages;
      var slice = v.slice((page - 1) * PAGE_SIZE, page * PAGE_SIZE);
      var cards = slice.map(function (en) {
        var badge = (me && en.name === me) ? ' <span class="badge">you</span>' : '';
        var following = follows.indexOf(en.name) >= 0;
        var avStyle = avColor(en.name) ? ' style="background:' + avColor(en.name) + '"' : '';
        var ti = threadInfo(en);
        return '<article class="feed-card" data-post="' + en.id + '">' +
          '<div class="feed-head"><div class="avatar sm"' + avStyle + '>' + esc(en.name[0].toUpperCase()) + '</div>' +
          '<div><button type="button" data-profile="' + esc(en.name) + '" class="name">' + esc(en.name) + '</button>' +
          '<span class="handle"> ' + esc(en.handle) + ' · ' + esc(en.date) + (en.edited ? ' · bearbeitet' : '') + '</span>' + badge +
          (ti ? ' <span class="badge">🧵 ' + ti.i + '/' + ti.n + '</span>' : '') +
          (en.poll ? ' <span class="badge">Umfrage</span>' : '') +
          (en.pinned ? ' <span class="badge">📌</span>' : '') +
          ((me && en.name === me) ? '' : ' <button type="button" data-follow="' + esc(en.name) + '">' +
            (following ? 'Entfolgt' : 'Folgen') + '</button>') + '</div></div>' +
          (editingId === en.id
            ? '<div class="feed-body"><textarea data-editin="' + en.id + '">' + esc(en.message) + '</textarea><br>' +
              '<button type="button" data-editsave="' + en.id + '">Speichern</button> ' +
              '<button type="button" data-editcancel="1">Abbrechen</button></div>'
            : '<div class="feed-body">' + tagify(bbcode(en.message)) + '</div>') +
          quoteHtml(en) + pollHtml(en) +
          '<div class="feed-actions"><span><button type="button" data-like="' + en.id + '">' +
          (en.liked ? '♥ ' : '♡ ') + en.likes + '</button></span>' +
          '<span><button type="button" data-repopen="' + en.id + '">💬 ' + en.replies.length + '</button></span>' +
          '<span><button type="button" data-repost="' + en.id + '">🔁 ' + en.reposts + '</button></span>' +
          '<span><button type="button" data-quote="' + en.id + '">Zitieren</button></span>' +
          '<span><button type="button" data-bm="' + en.id + '">' + (en.bookmarked ? '★' : '☆') + '</button></span>' +
          '<span><button type="button" data-pin="' + en.id + '">' + (en.pinned ? '📌' : '📍') + '</button></span>' +
          '<span><button type="button" data-edit="' + en.id + '">Edit</button></span>' +
          '<span><button type="button" data-share="' + en.id + '">Teilen</button></span>' +
          '<span><button type="button" data-copylink="' + en.id + '">🔗</button></span>' +
          ((me && en.name === me) ? '' : '<span><button type="button" data-mute="' + esc(en.name) + '">Stumm</button></span>') +
          '<span>▭ ' + en.views + '</span>' +
          '<span><button type="button" data-del="' + en.id + '">Löschen</button></span></div>' +
          '<div class="replies" data-replies="' + en.id + '" style="display:none">' + replyHtml(en) +
          '<p><input data-replyin="' + en.id + '" placeholder="Antworten … (max. 280)" maxlength="280"> ' +
          '<button type="button" data-replysend="' + en.id + '">Antworten</button></p></div>' +
          '</article>';
      }).join('');
      list.innerHTML = '<p class="meta">' + esc(stats()) + ' · Posten landet auch im Home-Feed (Folgen).</p>' +
        (cards || '<p class="meta">Noch keine Einträge.</p>') +
        (pages > 1 ? '<p class="meta"><button type="button" data-page="prev"' + (page <= 1 ? ' disabled' : '') +
        '>← Zurück</button> Seite ' + page + ' von ' + pages +
        ' <button type="button" data-page="next"' + (page >= pages ? ' disabled' : '') + '>Weiter →</button></p>' : '');
      list.querySelectorAll('[data-page]').forEach(function (b) {
        b.addEventListener('click', function () {
          page += b.getAttribute('data-page') === 'next' ? 1 : -1;
          render();
        });
      });
      list.querySelectorAll('[data-tag]').forEach(function (b) {
        b.addEventListener('click', function () {
          filter.value = '#' + b.getAttribute('data-tag'); page = 1; render();
        });
      });
      list.querySelectorAll('[data-profile]').forEach(function (b) {
        b.addEventListener('click', function () {
          profileName = b.getAttribute('data-profile'); page = 1; render();
        });
      });
      list.querySelectorAll('[data-follow]').forEach(function (b) {
        b.addEventListener('click', function () {
          var nm = b.getAttribute('data-follow');
          follows = loadNames('gbfollows');
          var i = follows.indexOf(nm);
          if (i >= 0) follows.splice(i, 1); else follows.push(nm);
          store.set('gbfollows', follows);
          render();
        });
      });
      list.querySelectorAll('[data-bm]').forEach(function (b) {
        b.addEventListener('click', function () {
          var p = entries.filter(function (x) { return x.id === b.getAttribute('data-bm'); })[0];
          if (!p) return;
          p.bookmarked = !p.bookmarked;
          persist(); render();
        });
      });
      list.querySelectorAll('[data-quote]').forEach(function (b) {
        b.addEventListener('click', function () {
          quoteTarget = b.getAttribute('data-quote');
          setMode('post'); renderQuoteBar();
          if (window.scrollTo) window.scrollTo(0, 0);
          message.focus();
        });
      });
      list.querySelectorAll('[data-vote]').forEach(function (b) {
        b.addEventListener('click', function () {
          var parts = b.getAttribute('data-vote').split(':');
          var p = entries.filter(function (x) { return x.id === parts[0]; })[0];
          if (!p || !p.poll || p.poll.voted >= 0) return;
          var idx = +parts[1];
          if (idx < 0 || idx >= p.poll.opts.length) return;
          p.poll.opts[idx].v++; p.poll.voted = idx;
          persist(); render();
        });
      });
      list.querySelectorAll('[data-like]').forEach(function (b) {
        b.addEventListener('click', function () {
          var p = entries.filter(function (x) { return x.id === b.getAttribute('data-like'); })[0];
          if (!p) return;
          p.liked = !p.liked; p.likes += p.liked ? 1 : -1;
          if (p.likes < 0) p.likes = 0;
          if (p.liked) pushNotif('like', p, actorName());
          persist(); render();
        });
      });
      list.querySelectorAll('[data-repost]').forEach(function (b) {
        b.addEventListener('click', function () {
          var p = entries.filter(function (x) { return x.id === b.getAttribute('data-repost'); })[0];
          if (!p) return;
          try {
            if (p.reposted) { p.reposted = false; p.reposts--; mirrorRemove(p.id); }
            else {
              p.reposted = true; p.reposts++;
              pushNotif('repost', p, actorName());
              var feed = readFeed();
              feed.unshift({ text: '🔁 ' + p.name + ': ' + excerpt(p.message, 120), time: Date.now(), id: 'gb-' + p.id + '-rt' });
              writeFeed(feed);
            }
            if (p.reposts < 0) p.reposts = 0;
          } catch (err) { out.textContent = 'Repost im Feed fehlgeschlagen (Speicher blockiert). Zähler gespeichert.'; }
          persist(); render();
        });
      });
      list.querySelectorAll('[data-del]').forEach(function (b) {
        b.addEventListener('click', function () {
          var id = b.getAttribute('data-del');
          entries = entries.filter(function (x) { return x.id !== id; });
          try { mirrorRemove(id); } catch (err) {}
          persist(); render();
        });
      });
      list.querySelectorAll('[data-edit]').forEach(function (b) {
        b.addEventListener('click', function () { editingId = b.getAttribute('data-edit'); render(); });
      });
      list.querySelectorAll('[data-editcancel]').forEach(function (b) {
        b.addEventListener('click', function () { editingId = null; render(); });
      });
      list.querySelectorAll('[data-editsave]').forEach(function (b) {
        b.addEventListener('click', function () {
          var id = b.getAttribute('data-editsave');
          var inp = list.querySelector('[data-editin="' + id + '"]');
          var p = entries.filter(function (x) { return x.id === id; })[0];
          var txt = inp ? inp.value.trim() : '';
          if (!p || txt.length < 10 || txt.length > 1000) {
            out.textContent = 'Message must be between 10 and 1000 characters.';
            return;
          }
          p.message = txt; p.edited = true; p.editedAt = Date.now();
          editingId = null;
          persist(); render();
        });
      });
      list.querySelectorAll('[data-pin]').forEach(function (b) {
        b.addEventListener('click', function () {
          var id = b.getAttribute('data-pin');
          entries.forEach(function (x) {
            x.pinned = (x.id === id) ? !x.pinned : false;
          });
          persist(); render();
        });
      });
      list.querySelectorAll('[data-mute]').forEach(function (b) {
        b.addEventListener('click', function () {
          var nm = b.getAttribute('data-mute');
          muted = loadNames('gbmuted');
          if (muted.indexOf(nm) < 0) muted.push(nm);
          store.set('gbmuted', muted); render();
        });
      });
      list.querySelectorAll('[data-share]').forEach(function (b) {
        b.addEventListener('click', function () {
          var p = entries.filter(function (x) { return x.id === b.getAttribute('data-share'); })[0];
          if (p) sharePost(p);
        });
      });
      list.querySelectorAll('[data-copylink]').forEach(function (b) {
        b.addEventListener('click', function () {
          copyText(postUrl(b.getAttribute('data-copylink')), 'Permalink kopiert.');
        });
      });
      list.querySelectorAll('[data-repopen]').forEach(function (b) {
        b.addEventListener('click', function () {
          var box = list.querySelector('[data-replies="' + b.getAttribute('data-repopen') + '"]');
          if (box) box.style.display = box.style.display === 'none' ? 'block' : 'none';
        });
      });
      list.querySelectorAll('[data-replysend]').forEach(function (b) {
        b.addEventListener('click', function () {
          var id = b.getAttribute('data-replysend');
          var inp = list.querySelector('[data-replyin="' + id + '"]');
          var p = entries.filter(function (x) { return x.id === id; })[0];
          var txt = inp ? inp.value.trim() : '';
          if (!p || !txt) return;
          if (txt.length > 280) { out.textContent = 'Antwort darf höchstens 280 Zeichen haben.'; return; }
          p.replies.push({ name: actorName(), message: txt, date: new Date().toLocaleString(), ts: Date.now() });
          pushNotif('reply', p, actorName());
          persist(); render();
          var box = list.querySelector('[data-replies="' + id + '"]');
          if (box) box.style.display = 'block';
        });
      });
      list.querySelectorAll('[data-repdel]').forEach(function (b) {
        b.addEventListener('click', function () {
          var parts = b.getAttribute('data-repdel').split(':');
          var p = entries.filter(function (x) { return x.id === parts[0]; })[0];
          if (p) p.replies.splice(+parts[1], 1);
          persist(); render();
        });
      });
    }
    message.addEventListener('input', function () { counter.textContent = message.value.length + '/1000'; saveDraft(); });
    name.addEventListener('input', saveDraft);
    email.addEventListener('input', saveDraft);
    filter.addEventListener('input', function () { page = 1; render(); });
    sort.addEventListener('change', function () { page = 1; render(); });
    function avColor(nm) { return (me && nm === me) ? loadProfile().color : ''; }
    function publishOne(fd, extra) {
      var base = { name: fd.name, message: fd.message, date: new Date().toLocaleString(), ts: Date.now() };
      if (extra) for (var k in extra) base[k] = extra[k];
      var e = normalizeEntry(base);
      entries.unshift(e); page = 1;
      try { mirrorAdd(e); } catch (feedErr) {
        persist(); render();
        out.textContent = 'Gespeichert (Home-Feed-Spiegel blockiert: Speicher voll oder privat).';
        return null;
      }
      persist();
      return e;
    }
    function clearComposer() {
      message.value = ''; counter.textContent = '0/1000';
      threadParts.forEach(function (ta) { ta.value = ''; });
      pollQ.value = ''; pollOpts.forEach(function (o) { o.value = ''; });
      quoteTarget = null; renderQuoteBar();
      store.set('gbdraft', null); draftNote.innerHTML = '';
    }
    send.addEventListener('click', function () {
      var fd = { name: name.value.trim(), email: email.value.trim(), message: message.value.trim() };
      if (mode === 'thread') {
        var parts = threadParts.map(function (ta) { return ta.value.trim(); }).filter(function (t) { return t; });
        if (!fd.name) { out.textContent = 'Bitte einen Namen eingeben.'; return; }
        if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(fd.email)) { out.textContent = 'Invalid email format.'; return; }
        if (parts.length < 2) { out.textContent = 'Ein Thread braucht mindestens 2 ausgefüllte Teile.'; return; }
        var bad = parts.filter(function (t) { return t.length < 10 || t.length > 1000; });
        if (bad.length) { out.textContent = 'Jeder Thread-Teil muss 10–1000 Zeichen haben.'; return; }
        var tid = socialId();
        parts.slice().reverse().forEach(function (t) { publishOne({ name: fd.name, message: t }, { threadId: tid }); });
        clearComposer();
        out.textContent = 'Thread mit ' + parts.length + ' Teilen gespeichert.'; render();
        return;
      }
      if (mode === 'poll') {
        var q = pollQ.value.trim();
        var opts = pollOpts.map(function (o) { return o.value.trim(); }).filter(function (t) { return t; });
        var errP = validPost(fd.name, fd.email, fd.message || q);
        if (errP && !q) { out.textContent = errP; return; }
        if (!fd.name) { out.textContent = 'Bitte einen Namen eingeben.'; return; }
        if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(fd.email)) { out.textContent = 'Invalid email format.'; return; }
        if (q.length < 4 || q.length > 140) { out.textContent = 'Frage muss 4–140 Zeichen haben.'; return; }
        if (opts.length < 2) { out.textContent = 'Mindestens 2 Antwortoptionen nötig.'; return; }
        var e = publishOne({ name: fd.name, message: fd.message || q }, {
          poll: { q: q, opts: opts.map(function (t) { return { t: t, v: 0 }; }), voted: -1 }
        });
        if (e) { clearComposer(); out.textContent = 'Umfrage gespeichert.'; render(); }
        return;
      }
      var err = validPost(fd.name, fd.email, fd.message);
      if (err) { out.textContent = err; return; }
      var extra = quoteTarget ? { quoteId: quoteTarget } : null;
      var one = publishOne({ name: fd.name, message: fd.message }, extra);
      if (one) {
        try {
          var qp = entries.filter(function (x) { return x.id === quoteTarget; })[0];
          if (qp) pushNotif('repost', qp, actorName());
        } catch (feedErr2) {}
        clearComposer();
        out.textContent = 'Gespeichert.'; render();
      }
    });
    render();
  }

  // ---------- Signin demo (php-signin: Benutzername/Passwort login) ----------
  // The original posts to a non-functional PHP stub; ported as a working
  // local demo auth: register, login, logout, session in sessionStorage.
  function hash(s) {
    var h1 = 0xdeadbeef, h2 = 0x41c6ce57;
    for (var i = 0; i < s.length; i++) {
      var ch = s.charCodeAt(i);
      h1 = Math.imul(h1 ^ ch, 2654435761); h2 = Math.imul(h2 ^ ch, 1597334677);
    }
    h1 = Math.imul(h1 ^ (h1 >>> 16), 2246822507) ^ Math.imul(h2 ^ (h2 >>> 13), 3266489909);
    h2 = Math.imul(h2 ^ (h2 >>> 16), 2246822507) ^ Math.imul(h1 ^ (h1 >>> 13), 3266489909);
    return (h2 >>> 0).toString(16) + (h1 >>> 0).toString(16);
  }
  function viewSignin(root) {
    var wrap = el('div', null, { 'class': 'tool-form' });
    var user = input('si-user', 'text', '', 'Benutzername');
    var pass = input('si-pass', 'password', '', 'Passwort');
    var login = el('button', 'Login', { type: 'button' });
    var reg = el('button', 'Registrieren', { type: 'button' });
    var out = el('div', null, { 'class': 'output' });
    wrap.appendChild(field('Benutzername', user)); wrap.appendChild(field('Passwort', pass));
    wrap.appendChild(login); wrap.appendChild(reg); wrap.appendChild(out);
    root.appendChild(wrap);
    function users() { return store.get('users', {}); }
    function refresh() {
      var cur = null;
      try { cur = sessionStorage.getItem('d5:session'); } catch (e) {}
      out.textContent = cur ? 'Eingeloggt als: ' + cur + ' (Logout: einfach anderen Benutzer anmelden oder Sitzung schließen)' : 'Nicht eingeloggt.';
    }
    login.addEventListener('click', function () {
      var u = users();
      if (u[user.value] && u[user.value] === hash(pass.value)) {
        try { sessionStorage.setItem('d5:session', user.value); } catch (e) {}
        out.textContent = 'Login erfolgreich: ' + user.value;
      } else out.textContent = 'Fehler: ungültige Anmeldedaten.';
      refresh();
    });
    reg.addEventListener('click', function () {
      if (!user.value || !pass.value) { out.textContent = 'Benutzername und Passwort eingeben.'; return; }
      var u = users();
      if (u[user.value]) { out.textContent = 'Benutzer existiert bereits.'; return; }
      u[user.value] = hash(pass.value); store.set('users', u);
      out.textContent = 'Registriert: ' + user.value + '. Jetzt einloggen.';
    });
    refresh();
  }

  // ---------- Link shortener (link shortener + Shortify PHP apps) ----------
  // Faithful rules: random 6-char base62 code, unique, visit counter on
  // resolve. Links resolve inside d5 (d5 cannot own a public short domain).
  var B62 = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
  function viewShortener(root) {
    var links = store.get('shortlinks', {});
    var wrap = el('div', null, { 'class': 'tool-form' });
    var url = input('sh-url', 'url', '', 'https://example.com/seite');
    var add = el('button', 'Kürzen', { type: 'button' });
    var out = el('div', null, { id: 'sh-out' });
    var list = el('div');
    wrap.appendChild(field('Original-URL', url)); wrap.appendChild(add);
    wrap.appendChild(out); wrap.appendChild(list);
    root.appendChild(wrap);
    function render() {
      var keys = Object.keys(links);
      out.innerHTML = '<p class="meta">' + keys.length + ' Kurzlinks gespeichert.</p>';
      list.innerHTML = keys.map(function (code) {
        var l = links[code];
        var href = '#/go/' + code;
        return '<article class="card"><h3><a href="' + href + '">d5:' + esc(code) + '</a></h3>' +
          '<p class="meta">' + esc(l.url) + '</p><p class="meta">Aufrufe: ' + l.visits + '</p></article>';
      }).join('') || '<p class="meta">Noch keine Links.</p>';
    }
    add.addEventListener('click', function () {
      var u = url.value.trim();
      if (!/^https?:\/\/.+\..+/.test(u)) { out.textContent = 'Bitte eine gültige http(s)-URL eingeben.'; return; }
      var code;
      do {
        code = '';
        for (var i = 0; i < 6; i++) code += B62[Math.floor(Math.random() * 62)];
      } while (links[code]);
      links[code] = { url: u, visits: 0 };
      store.set('shortlinks', links);
      url.value = '';
      out.textContent = 'Kurzlink: d5:' + code;
      render();
    });
    render();
  }
  // Resolves #/go/<code>: counts the visit and forwards to the stored URL.
  function viewGo(root, code) {
    var links = store.get('shortlinks', {});
    var l = links[code];
    if (!l) { root.innerHTML = '<p>Unbekannter Kurzlink: ' + esc(code) + '</p><p><a href="#/catalog">Zum Katalog</a></p>'; return; }
    l.visits++; store.set('shortlinks', links);
    root.innerHTML = '<h1>d5:' + esc(code) + '</h1><p class="meta">Weiterleitung zu ' + esc(l.url) + ' …</p>' +
      '<p><a href="' + esc(l.url) + '" rel="noopener">Falls nichts passiert, hier klicken</a></p>';
    setTimeout(function () { window.location.href = l.url; }, 600);
  }


  return {
    viewGuestbook: viewGuestbook, viewSignin: viewSignin,
    viewShortener: viewShortener, viewGo: viewGo
  };
})();
