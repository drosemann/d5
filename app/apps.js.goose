// Goose-Port-Spiegel von: app/apps.js
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: app/apps.js");
}

// ---- Original-Code (app/apps.js), unveraendert, als Inline-Doku ----
// // In-browser ports of form/table apps. Persistence is localStorage (the
// // originals used PHP/MySQL or Flask/SQLite backends, which cannot run from a
// // static page); all validation, formatting and balance rules mirror the
// // original sources.
// window.d5Apps = (function () {
//   var store = {
//     get: function (k, d) {
//       try { var v = localStorage.getItem('d5:' + k); return v == null ? d : JSON.parse(v); }
//       catch (e) { return d; }
//     },
//     set: function (k, v) { try { localStorage.setItem('d5:' + k, JSON.stringify(v)); } catch (e) {} }
//   };
//   function el(tag, text, attrs) {
//     var e = document.createElement(tag);
//     if (text != null) e.textContent = text;
//     if (attrs) for (var k in attrs) { if (k === 'html') e.innerHTML = attrs[k]; else e.setAttribute(k, attrs[k]); }
//     return e;
//   }
//   function esc(s) {
//     return String(s).replace(/[&<>"']/g, function (c) {
//       return { '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;', "'": '&#39;' }[c];
//     });
//   }
//   function field(label, input) {
//     var l = el('label'); l.appendChild(document.createTextNode(label + ' ')); l.appendChild(input);
//     return l;
//   }
//   function input(id, type, value, placeholder) {
//     return el('input', null, { id: id, type: type || 'text', value: value == null ? '' : value, placeholder: placeholder || '' });
//   }
//
//   // ---------- Guestbook (guestbook html,css,javascript; php/* backend) ----------
//   // Keeps: validation (message 10-1000 chars, email format), BBCode toolbar
//   // (B/I/U/url/img/emoji), entry list with BBCode rendering + XSS escaping,
//   // stats. Not ported: PHP storage (localStorage instead), weather API key,
//   // voice recording, visitor map, WebSocket placeholder.
//   function bbcode(s) {
//     return esc(s)
//       .replace(/\[b\](.*?)\[\/b\]/g, '<strong>$1</strong>')
//       .replace(/\[i\](.*?)\[\/i\]/g, '<em>$1</em>')
//       .replace(/\[u\](.*?)\[\/u\]/g, '<u>$1</u>')
//       .replace(/\[url\](.*?)\[\/url\]/g, '<a href="$1" target="_blank" rel="noopener">$1</a>')
//       .replace(/\[img\](.*?)\[\/img\]/g, '<img src="$1" alt="User posted image" class="user-image">');
//   }
//   function viewGuestbook(root) {
//     var entries = store.get('guestbook', []);
//     var wrap = el('div', null, { 'class': 'tool-form' });
//     var name = input('gb-name', 'text', '', 'Your Name');
//     var email = input('gb-email', 'email', '', 'Your Email');
//     var message = el('textarea', null, { id: 'gb-msg', placeholder: 'Your Message (10-1000 Zeichen)' });
//     var toolbar = el('div');
//     [['B', '[b]', '[/b]'], ['I', '[i]', '[/i]'], ['U', '[u]', '[/u]'],
//      ['Link', '[url]', '[/url]'], ['Bild', '[img]', '[/img]'], ['Emoji', null, null]
//     ].forEach(function (b) {
//       var btn = el('button', b[0], { type: 'button' });
//       btn.addEventListener('click', function () {
//         if (!b[1]) { message.value += '😊'; message.focus(); return; }
//         var s = message.selectionStart || 0, e2 = message.selectionEnd || 0;
//         message.value = message.value.slice(0, s) + b[1] + message.value.slice(s, e2) + b[2] + message.value.slice(e2);
//         message.focus();
//       });
//       toolbar.appendChild(btn); toolbar.appendChild(document.createTextNode(' '));
//     });
//     var send = el('button', 'Submit', { type: 'button' });
//     var out = el('div', null, { id: 'gb-out' });
//     var list = el('div');
//     wrap.appendChild(field('Name', name)); wrap.appendChild(field('Email', email));
//     wrap.appendChild(field('Nachricht', message)); wrap.appendChild(toolbar);
//     wrap.appendChild(send); wrap.appendChild(out); wrap.appendChild(list);
//     root.appendChild(wrap);
//     function render() {
//       out.innerHTML = '<p class="meta">' + entries.length + ' Einträge</p>';
//       list.innerHTML = entries.map(function (en, i) {
//         return '<article class="card"><h3>' + esc(en.name) + '</h3>' +
//           '<p class="meta">' + esc(en.date) + '</p><p>' + bbcode(en.message) + '</p>' +
//           '<p class="meta"><button type="button" data-del="' + i + '">Löschen</button></p></article>';
//       }).join('') || '<p class="meta">Noch keine Einträge.</p>';
//       list.querySelectorAll('[data-del]').forEach(function (b) {
//         b.addEventListener('click', function () { entries.splice(+b.getAttribute('data-del'), 1); store.set('guestbook', entries); render(); });
//       });
//     }
//     send.addEventListener('click', function () {
//       var fd = { name: name.value.trim(), email: email.value.trim(), message: message.value.trim() };
//       if (!fd.name) { out.textContent = 'Bitte einen Namen eingeben.'; return; }
//       if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(fd.email)) { out.textContent = 'Invalid email format.'; return; }
//       if (fd.message.length < 10 || fd.message.length > 1000) { out.textContent = 'Message must be between 10 and 1000 characters.'; return; }
//       entries.unshift({ name: fd.name, message: fd.message, date: new Date().toLocaleString() });
//       store.set('guestbook', entries);
//       name.value = ''; email.value = ''; message.value = '';
//       out.textContent = 'Gespeichert.'; render();
//     });
//     render();
//   }
//
//   // ---------- Signin demo (php-signin: Benutzername/Passwort login) ----------
//   // The original posts to a non-functional PHP stub; ported as a working
//   // local demo auth: register, login, logout, session in sessionStorage.
//   function hash(s) {
//     var h1 = 0xdeadbeef, h2 = 0x41c6ce57;
//     for (var i = 0; i < s.length; i++) {
//       var ch = s.charCodeAt(i);
//       h1 = Math.imul(h1 ^ ch, 2654435761); h2 = Math.imul(h2 ^ ch, 1597334677);
//     }
//     h1 = Math.imul(h1 ^ (h1 >>> 16), 2246822507) ^ Math.imul(h2 ^ (h2 >>> 13), 3266489909);
//     h2 = Math.imul(h2 ^ (h2 >>> 16), 2246822507) ^ Math.imul(h1 ^ (h1 >>> 13), 3266489909);
//     return (h2 >>> 0).toString(16) + (h1 >>> 0).toString(16);
//   }
//   function viewSignin(root) {
//     var wrap = el('div', null, { 'class': 'tool-form' });
//     var user = input('si-user', 'text', '', 'Benutzername');
//     var pass = input('si-pass', 'password', '', 'Passwort');
//     var login = el('button', 'Login', { type: 'button' });
//     var reg = el('button', 'Registrieren', { type: 'button' });
//     var out = el('div', null, { 'class': 'output' });
//     wrap.appendChild(field('Benutzername', user)); wrap.appendChild(field('Passwort', pass));
//     wrap.appendChild(login); wrap.appendChild(reg); wrap.appendChild(out);
//     root.appendChild(wrap);
//     function users() { return store.get('users', {}); }
//     function refresh() {
//       var cur = null;
//       try { cur = sessionStorage.getItem('d5:session'); } catch (e) {}
//       out.textContent = cur ? 'Eingeloggt als: ' + cur + ' (Logout: einfach anderen Benutzer anmelden oder Sitzung schließen)' : 'Nicht eingeloggt.';
//     }
//     login.addEventListener('click', function () {
//       var u = users();
//       if (u[user.value] && u[user.value] === hash(pass.value)) {
//         try { sessionStorage.setItem('d5:session', user.value); } catch (e) {}
//         out.textContent = 'Login erfolgreich: ' + user.value;
//       } else out.textContent = 'Fehler: ungültige Anmeldedaten.';
//       refresh();
//     });
//     reg.addEventListener('click', function () {
//       if (!user.value || !pass.value) { out.textContent = 'Benutzername und Passwort eingeben.'; return; }
//       var u = users();
//       if (u[user.value]) { out.textContent = 'Benutzer existiert bereits.'; return; }
//       u[user.value] = hash(pass.value); store.set('users', u);
//       out.textContent = 'Registriert: ' + user.value + '. Jetzt einloggen.';
//     });
//     refresh();
//   }
//
//   // ---------- Link shortener (link shortener + Shortify PHP apps) ----------
//   // Faithful rules: random 6-char base62 code, unique, visit counter on
//   // resolve. Links resolve inside d5 (d5 cannot own a public short domain).
//   var B62 = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
//   function viewShortener(root) {
//     var links = store.get('shortlinks', {});
//     var wrap = el('div', null, { 'class': 'tool-form' });
//     var url = input('sh-url', 'url', '', 'https://example.com/seite');
//     var add = el('button', 'Kürzen', { type: 'button' });
//     var out = el('div', null, { id: 'sh-out' });
//     var list = el('div');
//     wrap.appendChild(field('Original-URL', url)); wrap.appendChild(add);
//     wrap.appendChild(out); wrap.appendChild(list);
//     root.appendChild(wrap);
//     function render() {
//       var keys = Object.keys(links);
//       out.innerHTML = '<p class="meta">' + keys.length + ' Kurzlinks gespeichert.</p>';
//       list.innerHTML = keys.map(function (code) {
//         var l = links[code];
//         var href = '#/go/' + code;
//         return '<article class="card"><h3><a href="' + href + '">d5:' + esc(code) + '</a></h3>' +
//           '<p class="meta">' + esc(l.url) + '</p><p class="meta">Aufrufe: ' + l.visits + '</p></article>';
//       }).join('') || '<p class="meta">Noch keine Links.</p>';
//     }
//     add.addEventListener('click', function () {
//       var u = url.value.trim();
//       if (!/^https?:\/\/.+\..+/.test(u)) { out.textContent = 'Bitte eine gültige http(s)-URL eingeben.'; return; }
//       var code;
//       do {
//         code = '';
//         for (var i = 0; i < 6; i++) code += B62[Math.floor(Math.random() * 62)];
//       } while (links[code]);
//       links[code] = { url: u, visits: 0 };
//       store.set('shortlinks', links);
//       url.value = '';
//       out.textContent = 'Kurzlink: d5:' + code;
//       render();
//     });
//     render();
//   }
//   // Resolves #/go/<code>: counts the visit and forwards to the stored URL.
//   function viewGo(root, code) {
//     var links = store.get('shortlinks', {});
//     var l = links[code];
//     if (!l) { root.innerHTML = '<p>Unbekannter Kurzlink: ' + esc(code) + '</p><p><a href="#/catalog">Zum Katalog</a></p>'; return; }
//     l.visits++; store.set('shortlinks', links);
//     root.innerHTML = '<h1>d5:' + esc(code) + '</h1><p class="meta">Weiterleitung zu ' + esc(l.url) + ' …</p>' +
//       '<p><a href="' + esc(l.url) + '" rel="noopener">Falls nichts passiert, hier klicken</a></p>';
//     setTimeout(function () { window.location.href = l.url; }, 600);
//   }
//
//   return {
//     viewGuestbook: viewGuestbook, viewSignin: viewSignin,
//     viewShortener: viewShortener, viewGo: viewGo
//   };
// })();
//
