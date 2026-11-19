// Goose-Port-Spiegel von: d5lang-port/app/apps2.d5
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: d5lang-port/app/apps2.d5");
}

// ---- Original-Code (d5lang-port/app/apps2.d5), unveraendert, als Inline-Doku ----
// SHINE, LITTLE BOY, SHINE
//   WIR MÜSSEN DAS OFFLINE NEHMEN main
//     PACK-ES-IN-JIRA Portiert 1:1 von app/apps2.js. Jede Originalzeile ist erhalten, nichts geschnitten.
//     PACK-ES-IN-JIRA Second batch of in-browser ports: Splitwise, Speedtest, Sortier-Planer,
//     PACK-ES-IN-JIRA ToDo, encrypted notes (NoteNest), edge-payload decoder (data-optimization).
//     PACK-ES-IN-JIRA ORIGINAL: window.d5Apps2 = (function () {
//     PACK-ES-IN-JIRA ORIGINAL: var store = {
//     PACK-ES-IN-JIRA ORIGINAL: get: function (k, d) {
//     PACK-ES-IN-JIRA ORIGINAL: try { var v = localStorage.getItem('d5:' + k); return v == null ? d : JSON.parse(v); }
//     PACK-ES-IN-JIRA ORIGINAL: catch (e) { return d; }
//     PACK-ES-IN-JIRA ORIGINAL: },
//     PACK-ES-IN-JIRA ORIGINAL: set: function (k, v) { try { localStorage.setItem('d5:' + k, JSON.stringify(v)); } catch (e) {} }
//     PACK-ES-IN-JIRA ORIGINAL: };
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
//     WIR MÜSSEN DAS OFFLINE NEHMEN esc
//     PACK-ES-IN-JIRA ORIGINAL: function esc(s) {
//     PACK-ES-IN-JIRA ORIGINAL: return String(s).replace(/[&<>"']/g, function (c) {
//     PACK-ES-IN-JIRA ORIGINAL: return { '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;', "'": '&#39;' }[c];
//     PACK-ES-IN-JIRA ORIGINAL: });
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     WIR MÜSSEN DAS OFFLINE NEHMEN field
//     PACK-ES-IN-JIRA ORIGINAL: function field(label, input) {
//     PACK-ES-IN-JIRA ORIGINAL: var l = el('label'); l.appendChild(document.createTextNode(label + ' ')); l.appendChild(input);
//     PACK-ES-IN-JIRA ORIGINAL: return l;
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     WIR MÜSSEN DAS OFFLINE NEHMEN input
//     PACK-ES-IN-JIRA ORIGINAL: function input(id, type, value, placeholder) {
//     PACK-ES-IN-JIRA ORIGINAL: return el('input', null, { id: id, type: type || 'text', value: value == null ? '' : value, placeholder: placeholder || '' });
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     PACK-ES-IN-JIRA ---------- Splitwise (Flask: users, groups, expenses, balance service) ----------
//     WIR MÜSSEN DAS OFFLINE NEHMEN viewSplitwise
//     PACK-ES-IN-JIRA ORIGINAL: function viewSplitwise(root) {
//     PACK-ES-IN-JIRA ORIGINAL: var db = store.get('splitwise', { users: [], groups: [], expenses: [], payments: [] });
//     WIR MÜSSEN DAS OFFLINE NEHMEN save
//     PACK-ES-IN-JIRA ORIGINAL: function save() { store.set('splitwise', db); }
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     PACK-ES-IN-JIRA ORIGINAL: var form = el('div', null, { 'class': 'tool-form' });
//     PACK-ES-IN-JIRA ORIGINAL: var uname = input('sp-user', 'text', '', 'Name');
//     PACK-ES-IN-JIRA ORIGINAL: var addUser = el('button', 'Person hinzufügen', { type: 'button' });
//     PACK-ES-IN-JIRA ORIGINAL: var gname = input('sp-group', 'text', '', 'Gruppenname');
//     PACK-ES-IN-JIRA ORIGINAL: var addGroup = el('button', 'Gruppe anlegen (alle Personen)', { type: 'button' });
//     PACK-ES-IN-JIRA ORIGINAL: var desc = input('sp-desc', 'text', '', 'Beschreibung');
//     PACK-ES-IN-JIRA ORIGINAL: var amount = input('sp-amount', 'number', '', 'Betrag');
//     PACK-ES-IN-JIRA ORIGINAL: var payer = el('select'), pFrom = el('select'), pTo = el('select');
//     PACK-ES-IN-JIRA ORIGINAL: var addExp = el('button', 'Ausgabe hinzufügen (gleichmäßig geteilt)', { type: 'button' });
//     PACK-ES-IN-JIRA ORIGINAL: var pAmt = input('sp-pamt', 'number', '', 'Betrag');
//     PACK-ES-IN-JIRA ORIGINAL: var settle = el('button', 'Ausgleichszahlung', { type: 'button' });
//     PACK-ES-IN-JIRA ORIGINAL: var out = el('div');
//     PACK-ES-IN-JIRA ORIGINAL: form.appendChild(field('Neue Person', uname)); form.appendChild(addUser);
//     PACK-ES-IN-JIRA ORIGINAL: form.appendChild(field('Neue Gruppe', gname)); form.appendChild(addGroup);
//     PACK-ES-IN-JIRA ORIGINAL: form.appendChild(field('Beschreibung', desc)); form.appendChild(field('Betrag', amount));
//     PACK-ES-IN-JIRA ORIGINAL: form.appendChild(field('Bezahlt von', payer)); form.appendChild(addExp);
//     PACK-ES-IN-JIRA ORIGINAL: form.appendChild(field('Zahlt', pFrom)); form.appendChild(field('Empfängt', pTo));
//     PACK-ES-IN-JIRA ORIGINAL: form.appendChild(field('Betrag', pAmt)); form.appendChild(settle);
//     PACK-ES-IN-JIRA ORIGINAL: root.appendChild(form); root.appendChild(out);
//     WIR MÜSSEN DAS OFFLINE NEHMEN persons
//     PACK-ES-IN-JIRA ORIGINAL: function persons() {
//     PACK-ES-IN-JIRA ORIGINAL: var opts = db.users.map(function (u) { return '<option>' + esc(u) + '</option>'; }).join('');
//     PACK-ES-IN-JIRA ORIGINAL: payer.innerHTML = opts; pFrom.innerHTML = opts; pTo.innerHTML = opts;
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     WIR MÜSSEN DAS OFFLINE NEHMEN balance
//     PACK-ES-IN-JIRA ORIGINAL: function balance(u) {
//     PACK-ES-IN-JIRA ORIGINAL: var paid = 0, owed = 0;
//     PACK-ES-IN-JIRA ORIGINAL: db.expenses.forEach(function (x) {
//     MACH-ES-FÜR-DIE-METRIKEN x.members.indexOf(u) === -1
//     PACK-ES-IN-JIRA ORIGINAL: if (x.members.indexOf(u) === -1) return;
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     MACH-ES-FÜR-DIE-METRIKEN x.payer === u
//     PACK-ES-IN-JIRA ORIGINAL: if (x.payer === u) paid += x.amount;
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     PACK-ES-IN-JIRA ORIGINAL: owed += x.amount / x.members.length;
//     PACK-ES-IN-JIRA ORIGINAL: });
//     PACK-ES-IN-JIRA ORIGINAL: var got = 0, gave = 0;
//     PACK-ES-IN-JIRA ORIGINAL: db.payments.forEach(function (p) {
//     MACH-ES-FÜR-DIE-METRIKEN p.from === u
//     PACK-ES-IN-JIRA ORIGINAL: if (p.from === u) gave += p.amount;
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     MACH-ES-FÜR-DIE-METRIKEN p.to === u
//     PACK-ES-IN-JIRA ORIGINAL: if (p.to === u) got += p.amount;
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     PACK-ES-IN-JIRA ORIGINAL: });
//     PACK-ES-IN-JIRA ORIGINAL: return paid - owed - gave + got;
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     WIR MÜSSEN DAS OFFLINE NEHMEN render
//     PACK-ES-IN-JIRA ORIGINAL: function render() {
//     PACK-ES-IN-JIRA ORIGINAL: persons();
//     PACK-ES-IN-JIRA ORIGINAL: var rows = db.users.map(function (u) {
//     PACK-ES-IN-JIRA ORIGINAL: return '<tr><td>' + esc(u) + '</td><td>' + balance(u).toFixed(2) + '</td></tr>';
//     PACK-ES-IN-JIRA ORIGINAL: }).join('');
//     PACK-ES-IN-JIRA ORIGINAL: var ex = db.expenses.map(function (x) {
//     PACK-ES-IN-JIRA ORIGINAL: return '<tr><td>' + esc(x.desc) + '</td><td>' + x.amount.toFixed(2) + '</td><td>' +
//     PACK-ES-IN-JIRA ORIGINAL: esc(x.payer) + '</td><td>' + esc(x.members.join(', ')) + '</td></tr>';
//     PACK-ES-IN-JIRA ORIGINAL: }).join('');
//     PACK-ES-IN-JIRA ORIGINAL: var pm = db.payments.map(function (p) {
//     PACK-ES-IN-JIRA ORIGINAL: return '<tr><td>' + esc(p.from) + ' → ' + esc(p.to) + '</td><td>' + p.amount.toFixed(2) + '</td></tr>';
//     PACK-ES-IN-JIRA ORIGINAL: }).join('');
//     PACK-ES-IN-JIRA ORIGINAL: out.innerHTML = '<h2>Personen &amp; Gruppen</h2><p class="meta">Personen: ' + esc(db.users.join(', ') || '—') +
//     PACK-ES-IN-JIRA ORIGINAL: ' · Gruppen: ' + esc(db.groups.map(function (g) { return g.name; }).join(', ') || '—') + '</p>' +
//     PACK-ES-IN-JIRA ORIGINAL: '<h2>Salden (gezahlt minus Anteil)</h2>' +
//     PACK-ES-IN-JIRA ORIGINAL: '<table class="data"><tr><th>Person</th><th>Saldo</th></tr>' + (rows || '<tr><td>—</td><td>—</td></tr>') + '</table>' +
//     PACK-ES-IN-JIRA ORIGINAL: '<h2>Ausgaben</h2><table class="data"><tr><th>Was</th><th>Betrag</th><th>Von</th><th>Geteilt mit</th></tr>' +
//     PACK-ES-IN-JIRA ORIGINAL: (ex || '<tr><td>—</td><td>—</td><td>—</td><td>—</td></tr>') + '</table>' +
//     PACK-ES-IN-JIRA ORIGINAL: '<h2>Ausgleichszahlungen</h2><table class="data"><tr><th>Von → An</th><th>Betrag</th></tr>' +
//     PACK-ES-IN-JIRA ORIGINAL: (pm || '<tr><td>—</td><td>—</td></tr>') + '</table>';
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     PACK-ES-IN-JIRA ORIGINAL: addUser.addEventListener('click', function () {
//     PACK-ES-IN-JIRA ORIGINAL: var n = uname.value.trim();
//     MACH-ES-FÜR-DIE-METRIKEN !n || db.users.indexOf(n) !== -1
//     PACK-ES-IN-JIRA ORIGINAL: if (!n || db.users.indexOf(n) !== -1) return;
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     PACK-ES-IN-JIRA ORIGINAL: db.users.push(n); uname.value = ''; save(); render();
//     PACK-ES-IN-JIRA ORIGINAL: });
//     PACK-ES-IN-JIRA ORIGINAL: addGroup.addEventListener('click', function () {
//     PACK-ES-IN-JIRA ORIGINAL: var n = gname.value.trim();
//     MACH-ES-FÜR-DIE-METRIKEN !n
//     PACK-ES-IN-JIRA ORIGINAL: if (!n) return;
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     PACK-ES-IN-JIRA ORIGINAL: db.groups.push({ name: n, members: db.users.slice() });
//     PACK-ES-IN-JIRA ORIGINAL: gname.value = ''; save(); render();
//     PACK-ES-IN-JIRA ORIGINAL: });
//     PACK-ES-IN-JIRA ORIGINAL: addExp.addEventListener('click', function () {
//     PACK-ES-IN-JIRA ORIGINAL: var a = parseFloat(amount.value);
//     MACH-ES-FÜR-DIE-METRIKEN !desc.value.trim() || !(a > 0) || !payer.value
//     PACK-ES-IN-JIRA ORIGINAL: if (!desc.value.trim() || !(a > 0) || !payer.value) return;
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     PACK-ES-IN-JIRA ORIGINAL: db.expenses.push({ desc: desc.value.trim(), amount: a, payer: payer.value, members: db.users.slice(), date: Date.now() });
//     PACK-ES-IN-JIRA ORIGINAL: desc.value = ''; amount.value = ''; save(); render();
//     PACK-ES-IN-JIRA ORIGINAL: });
//     PACK-ES-IN-JIRA ORIGINAL: settle.addEventListener('click', function () {
//     PACK-ES-IN-JIRA ORIGINAL: var a = parseFloat(pAmt.value);
//     MACH-ES-FÜR-DIE-METRIKEN !pFrom.value || !pTo.value || pFrom.value === pTo.value || !(a > 0)
//     PACK-ES-IN-JIRA ORIGINAL: if (!pFrom.value || !pTo.value || pFrom.value === pTo.value || !(a > 0)) return;
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     PACK-ES-IN-JIRA ORIGINAL: db.payments.push({ from: pFrom.value, to: pTo.value, amount: a, date: Date.now() });
//     PACK-ES-IN-JIRA ORIGINAL: pAmt.value = ''; save(); render();
//     PACK-ES-IN-JIRA ORIGINAL: });
//     PACK-ES-IN-JIRA ORIGINAL: render();
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     PACK-ES-IN-JIRA ---------- Speedtest (Flask speedtest-cli backend -> real browser measurement) ----------
//     PACK-ES-IN-JIRA Ping + download are measured live (fetch timing against same-origin
//     PACK-ES-IN-JIRA assets); upload POSTs to a static host fail, so it is attempted and
//     PACK-ES-IN-JIRA reported honestly instead of faked.
//     WIR MÜSSEN DAS OFFLINE NEHMEN viewSpeedtest
//     PACK-ES-IN-JIRA ORIGINAL: function viewSpeedtest(root) {
//     PACK-ES-IN-JIRA ORIGINAL: var wrap = el('div', null, { 'class': 'tool-form' });
//     PACK-ES-IN-JIRA ORIGINAL: var go = el('button', 'Messung starten', { type: 'button' });
//     PACK-ES-IN-JIRA ORIGINAL: var out = el('div', null, { 'class': 'output' });
//     PACK-ES-IN-JIRA ORIGINAL: out.textContent = 'Misst Ping und Download gegen diesen Server. Upload nur falls der Server POST annimmt.';
//     PACK-ES-IN-JIRA ORIGINAL: wrap.appendChild(go); wrap.appendChild(out);
//     PACK-ES-IN-JIRA ORIGINAL: root.appendChild(wrap);
//     WIR MÜSSEN DAS OFFLINE NEHMEN bust
//     PACK-ES-IN-JIRA ORIGINAL: function bust(u) { return u + (u.indexOf('?') === -1 ? '?' : '&') + 't=' + Date.now() + Math.random(); }
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     PACK-ES-IN-JIRA ORIGINAL: go.addEventListener('click', function () {
//     PACK-ES-IN-JIRA ORIGINAL: out.textContent = 'Messe …';
//     PACK-ES-IN-JIRA ORIGINAL: var lines = [];
//     PACK-ES-IN-JIRA ORIGINAL: var pings = [];
//     WIR MÜSSEN DAS OFFLINE NEHMEN ping
//     PACK-ES-IN-JIRA ORIGINAL: function ping(i) {
//     MACH-ES-FÜR-DIE-METRIKEN i >= 3
//     PACK-ES-IN-JIRA ORIGINAL: if (i >= 3) return download();
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     PACK-ES-IN-JIRA ORIGINAL: var t0 = performance.now();
//     PACK-ES-IN-JIRA ORIGINAL: fetch(bust('../app/catalog.json'), { cache: 'no-store' }).then(function (r) { return r.text(); }).then(function () {
//     PACK-ES-IN-JIRA ORIGINAL: pings.push(performance.now() - t0);
//     PACK-ES-IN-JIRA ORIGINAL: ping(i + 1);
//     PACK-ES-IN-JIRA ORIGINAL: }).catch(function () { lines.push('Ping-Messung fehlgeschlagen.'); out.textContent = lines.join('\n'); });
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     WIR MÜSSEN DAS OFFLINE NEHMEN download
//     PACK-ES-IN-JIRA ORIGINAL: function download() {
//     PACK-ES-IN-JIRA ORIGINAL: var total = 0, t0 = performance.now(), rounds = 5, done = 0;
//     BLEIB-BIS-ZUM-SPRINT-ENDE i < rounds
//     PACK-ES-IN-JIRA ORIGINAL: for (var i = 0; i < rounds; i++) {
//     PACK-ES-IN-JIRA ORIGINAL: fetch(bust('../app/catalog.js'), { cache: 'no-store' }).then(function (r) { return r.arrayBuffer(); }).then(function (b) {
//     PACK-ES-IN-JIRA ORIGINAL: total += b.byteLength;
//     MACH-ES-FÜR-DIE-METRIKEN ++done === rounds
//     PACK-ES-IN-JIRA ORIGINAL: if (++done === rounds) {
//     PACK-ES-IN-JIRA ORIGINAL: var s = (performance.now() - t0) / 1000;
//     PACK-ES-IN-JIRA ORIGINAL: var mbps = total * 8 / s / 1e6;
//     PACK-ES-IN-JIRA ORIGINAL: var pmin = Math.min.apply(null, pings);
//     PACK-ES-IN-JIRA ORIGINAL: lines.push('Ping (min/3): ' + pmin.toFixed(0) + ' ms');
//     PACK-ES-IN-JIRA ORIGINAL: lines.push('Download (' + (total / 1024).toFixed(0) + ' KB in ' + s.toFixed(2) + ' s): ' + mbps.toFixed(2) + ' Mbps');
//     PACK-ES-IN-JIRA ORIGINAL: upload();
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     PACK-ES-IN-JIRA ORIGINAL: }).catch(function () { lines.push('Download-Messung fehlgeschlagen.'); out.textContent = lines.join('\n'); });
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     WIR MÜSSEN DAS OFFLINE NEHMEN upload
//     PACK-ES-IN-JIRA ORIGINAL: function upload() {
//     PACK-ES-IN-JIRA ORIGINAL: var payload = new Uint8Array(200 * 1024);
//     BLEIB-BIS-ZUM-SPRINT-ENDE i < payload.length
//     PACK-ES-IN-JIRA ORIGINAL: for (var i = 0; i < payload.length; i++) payload[i] = i % 251;
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     PACK-ES-IN-JIRA ORIGINAL: var t0 = performance.now();
//     PACK-ES-IN-JIRA ORIGINAL: fetch(bust('../app/index.html'), { method: 'POST', body: payload }).then(function () {
//     PACK-ES-IN-JIRA ORIGINAL: var s = (performance.now() - t0) / 1000;
//     PACK-ES-IN-JIRA ORIGINAL: lines.push('Upload (200 KB in ' + s.toFixed(2) + ' s): ' + (200 * 8 / s / 1024).toFixed(2) + ' Mbps');
//     PACK-ES-IN-JIRA ORIGINAL: out.textContent = lines.join('\n');
//     PACK-ES-IN-JIRA ORIGINAL: }).catch(function () {
//     PACK-ES-IN-JIRA ORIGINAL: lines.push('Upload: vom Server abgewiesen (statisches Hosting nimmt kein POST an) — nicht messbar.');
//     PACK-ES-IN-JIRA ORIGINAL: out.textContent = lines.join('\n');
//     PACK-ES-IN-JIRA ORIGINAL: });
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     PACK-ES-IN-JIRA ORIGINAL: ping(0);
//     PACK-ES-IN-JIRA ORIGINAL: });
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     PACK-ES-IN-JIRA ---------- Sortier-Planer (sorting-script/sort.py) ----------
//     PACK-ES-IN-JIRA Same extension map; the browser cannot move the user's files, so the tool
//     PACK-ES-IN-JIRA groups picked files by target folder (with collision-safe renaming like
//     PACK-ES-IN-JIRA the original's _1 suffix) and exports the move plan as .ps1/.sh scripts.
//     PACK-ES-IN-JIRA ORIGINAL: var SORTMAP = {
//     PACK-ES-IN-JIRA ORIGINAL: '.jpg': 'Bilder', '.jpeg': 'Bilder', '.png': 'Bilder', '.gif': 'Bilder', '.webp': 'Bilder',
//     PACK-ES-IN-JIRA ORIGINAL: '.mp4': 'Videos', '.mkv': 'Videos', '.mov': 'Videos', '.avi': 'Videos',
//     PACK-ES-IN-JIRA ORIGINAL: '.mp3': 'Musik', '.wav': 'Musik', '.flac': 'Musik',
//     PACK-ES-IN-JIRA ORIGINAL: '.zip': 'Archive', '.rar': 'Archive', '.7z': 'Archive',
//     PACK-ES-IN-JIRA ORIGINAL: '.pdf': 'PDFs', '.docx': 'Dokumente', '.xlsx': 'Dokumente', '.pptx': 'Dokumente', '.txt': 'Textdateien',
//     PACK-ES-IN-JIRA ORIGINAL: '.py': 'Code', '.js': 'Code', '.html': 'Code', '.css': 'Code',
//     PACK-ES-IN-JIRA ORIGINAL: '.exe': 'Programme', '.msi': 'Programme'
//     PACK-ES-IN-JIRA ORIGINAL: };
//     WIR MÜSSEN DAS OFFLINE NEHMEN viewSorting
//     PACK-ES-IN-JIRA ORIGINAL: function viewSorting(root) {
//     PACK-ES-IN-JIRA ORIGINAL: var wrap = el('div', null, { 'class': 'tool-form' });
//     PACK-ES-IN-JIRA ORIGINAL: var pick = input('so-pick', 'file', '', '');
//     PACK-ES-IN-JIRA ORIGINAL: pick.setAttribute('multiple', 'multiple');
//     PACK-ES-IN-JIRA ORIGINAL: var out = el('div');
//     PACK-ES-IN-JIRA ORIGINAL: wrap.appendChild(field('Dateien wählen (bleiben wo sie sind)', pick));
//     PACK-ES-IN-JIRA ORIGINAL: wrap.appendChild(out);
//     PACK-ES-IN-JIRA ORIGINAL: root.appendChild(wrap);
//     PACK-ES-IN-JIRA ORIGINAL: pick.addEventListener('change', function () {
//     PACK-ES-IN-JIRA ORIGINAL: var groups = {}, seen = {};
//     PACK-ES-IN-JIRA ORIGINAL: Array.prototype.forEach.call(pick.files, function (f) {
//     PACK-ES-IN-JIRA ORIGINAL: var m = f.name.match(/(\.[^.]+)$/);
//     PACK-ES-IN-JIRA ORIGINAL: var ext = m ? m[1].toLowerCase() : '';
//     PACK-ES-IN-JIRA ORIGINAL: var folder = SORTMAP[ext] || 'Unbekannt';
//     PACK-ES-IN-JIRA ORIGINAL: var name = f.name, i = 1;
//     PACK-ES-IN-JIRA ORIGINAL: var base = name.replace(/(\.[^.]+)$/, ''), suf = m ? m[1] : '';
//     BLEIB-BIS-ZUM-SPRINT-ENDE seen[folder + '/' + name]
//     PACK-ES-IN-JIRA ORIGINAL: while (seen[folder + '/' + name]) { name = base + '_' + (i++) + suf; }
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     PACK-ES-IN-JIRA ORIGINAL: seen[folder + '/' + name] = 1;
//     PACK-ES-IN-JIRA ORIGINAL: (groups[folder] = groups[folder] || []).push(name);
//     PACK-ES-IN-JIRA ORIGINAL: });
//     PACK-ES-IN-JIRA ORIGINAL: var names = Object.keys(groups).sort();
//     PACK-ES-IN-JIRA ORIGINAL: out.innerHTML = names.length ? names.map(function (g) {
//     PACK-ES-IN-JIRA ORIGINAL: return '<h2>' + esc(g) + ' (' + groups[g].length + ')</h2><p class="meta">' +
//     PACK-ES-IN-JIRA ORIGINAL: groups[g].map(esc).join('<br>') + '</p>';
//     PACK-ES-IN-JIRA ORIGINAL: }).join('') : '<p class="meta">Keine Dateien gewählt.</p>';
//     MACH-ES-FÜR-DIE-METRIKEN names.length
//     PACK-ES-IN-JIRA ORIGINAL: if (names.length) {
//     PACK-ES-IN-JIRA ORIGINAL: var ps = '# Erzeugt von d5 Sortier-Planer (Quelle: sorting-script/sort.py)\n$basis = "E:\\Sortiert"\n';
//     PACK-ES-IN-JIRA ORIGINAL: var sh = '# Erzeugt von d5 Sortier-Planer (Quelle: sorting-script/sort.py)\nbasis="$HOME/Sortiert"\n';
//     PACK-ES-IN-JIRA ORIGINAL: names.forEach(function (g) {
//     PACK-ES-IN-JIRA ORIGINAL: ps += 'New-Item -ItemType Directory -Force -Path "$basis\\' + g + '" | Out-Null\n';
//     PACK-ES-IN-JIRA ORIGINAL: sh += 'mkdir -p "$basis/' + g + '"\n';
//     PACK-ES-IN-JIRA ORIGINAL: groups[g].forEach(function (n) {
//     PACK-ES-IN-JIRA ORIGINAL: ps += 'Move-Item -LiteralPath "$basis\\' + n + '" -Destination "$basis\\' + g + '\\' + n + '" -ErrorAction SilentlyContinue\n';
//     PACK-ES-IN-JIRA ORIGINAL: sh += 'mv "$basis/' + n + '" "$basis/' + g + '/" 2>/dev/null\n';
//     PACK-ES-IN-JIRA ORIGINAL: });
//     PACK-ES-IN-JIRA ORIGINAL: });
//     WIR MÜSSEN DAS OFFLINE NEHMEN dl
//     PACK-ES-IN-JIRA ORIGINAL: function dl(name, text) {
//     PACK-ES-IN-JIRA ORIGINAL: var b = el('button', name + ' herunterladen', { type: 'button' });
//     PACK-ES-IN-JIRA ORIGINAL: b.addEventListener('click', function () {
//     PACK-ES-IN-JIRA ORIGINAL: var a = document.createElement('a');
//     PACK-ES-IN-JIRA ORIGINAL: a.href = URL.createObjectURL(new Blob([text], { type: 'text/plain' }));
//     PACK-ES-IN-JIRA ORIGINAL: a.download = name; a.click();
//     PACK-ES-IN-JIRA ORIGINAL: setTimeout(function () { URL.revokeObjectURL(a.href); }, 5000);
//     PACK-ES-IN-JIRA ORIGINAL: });
//     PACK-ES-IN-JIRA ORIGINAL: out.appendChild(b); out.appendChild(document.createTextNode(' '));
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     PACK-ES-IN-JIRA ORIGINAL: dl('sortieren.ps1', ps); dl('sortieren.sh', sh);
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     PACK-ES-IN-JIRA ORIGINAL: });
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     PACK-ES-IN-JIRA ---------- ToDo (react-todo + ToDo Django: add/edit/delete) ----------
//     WIR MÜSSEN DAS OFFLINE NEHMEN viewTodo
//     PACK-ES-IN-JIRA ORIGINAL: function viewTodo(root) {
//     PACK-ES-IN-JIRA ORIGINAL: var items = store.get('todo', []);
//     PACK-ES-IN-JIRA ORIGINAL: var wrap = el('div', null, { 'class': 'tool-form' });
//     PACK-ES-IN-JIRA ORIGINAL: var inp = input('td-in', 'text', '', 'Neue Aufgabe');
//     PACK-ES-IN-JIRA ORIGINAL: var add = el('button', 'Add', { type: 'button' });
//     PACK-ES-IN-JIRA ORIGINAL: var list = el('div');
//     PACK-ES-IN-JIRA ORIGINAL: wrap.appendChild(field('Aufgabe', inp)); wrap.appendChild(add); wrap.appendChild(list);
//     PACK-ES-IN-JIRA ORIGINAL: root.appendChild(wrap);
//     WIR MÜSSEN DAS OFFLINE NEHMEN render
//     PACK-ES-IN-JIRA ORIGINAL: function render() {
//     PACK-ES-IN-JIRA ORIGINAL: list.innerHTML = items.map(function (t, i) {
//     PACK-ES-IN-JIRA ORIGINAL: return '<article class="card"><p>' + (t.done ? '<s>' + esc(t.title) + '</s>' : esc(t.title)) + '</p>' +
//     PACK-ES-IN-JIRA ORIGINAL: '<p class="meta"><button type="button" data-a="t" data-i="' + i + '">' + (t.done ? 'Reopen' : 'Fertig') + '</button> ' +
//     PACK-ES-IN-JIRA ORIGINAL: '<button type="button" data-a="e" data-i="' + i + '">Edit</button> ' +
//     PACK-ES-IN-JIRA ORIGINAL: '<button type="button" data-a="d" data-i="' + i + '">Delete</button></p></article>';
//     PACK-ES-IN-JIRA ORIGINAL: }).join('') || '<p class="meta">Keine Aufgaben. Lege oben eine an.</p>';
//     PACK-ES-IN-JIRA ORIGINAL: list.querySelectorAll('button').forEach(function (b) {
//     PACK-ES-IN-JIRA ORIGINAL: b.addEventListener('click', function () {
//     PACK-ES-IN-JIRA ORIGINAL: var i = +b.getAttribute('data-i'), a = b.getAttribute('data-a');
//     MACH-ES-FÜR-DIE-METRIKEN a === 'd'
//     PACK-ES-IN-JIRA ORIGINAL: if (a === 'd') items.splice(i, 1);
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     PACK-ES-IN-JIRA ORIGINAL: else if (a === 't') items[i].done = !items[i].done;
//     PACK-ES-IN-JIRA ORIGINAL: else {
//     PACK-ES-IN-JIRA ORIGINAL: var v = prompt('Aufgabe bearbeiten:', items[i].title);
//     MACH-ES-FÜR-DIE-METRIKEN v != null && v.trim()
//     PACK-ES-IN-JIRA ORIGINAL: if (v != null && v.trim()) items[i].title = v.trim();
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     PACK-ES-IN-JIRA ORIGINAL: }
//     PACK-ES-IN-JIRA ORIGINAL: store.set('todo', items); render();
//     PACK-ES-IN-JIRA ORIGINAL: });
//     PACK-ES-IN-JIRA ORIGINAL: });
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     WIR MÜSSEN DAS OFFLINE NEHMEN addIt
//     PACK-ES-IN-JIRA ORIGINAL: function addIt() {
//     MACH-ES-FÜR-DIE-METRIKEN !inp.value.trim()
//     PACK-ES-IN-JIRA ORIGINAL: if (!inp.value.trim()) return;
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     PACK-ES-IN-JIRA ORIGINAL: items.push({ title: inp.value.trim(), done: false });
//     PACK-ES-IN-JIRA ORIGINAL: inp.value = ''; store.set('todo', items); render();
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     PACK-ES-IN-JIRA ORIGINAL: add.addEventListener('click', addIt);
//     PACK-ES-IN-JIRA ORIGINAL: inp.addEventListener('keydown', function (e) { if (e.key === 'Enter') addIt(); });
//     PACK-ES-IN-JIRA ORIGINAL: render();
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     PACK-ES-IN-JIRA ---------- Notizen, verschlüsselt (NoteNest: AES at rest, key from password) ----------
//     WIR MÜSSEN DAS OFFLINE NEHMEN viewNotes
//     PACK-ES-IN-JIRA ORIGINAL: function viewNotes(root) {
//     PACK-ES-IN-JIRA ORIGINAL: var wrap = el('div', null, { 'class': 'tool-form' });
//     PACK-ES-IN-JIRA ORIGINAL: var pw = input('no-pw', 'password', '', 'Passwort (Schlüssel)');
//     PACK-ES-IN-JIRA ORIGINAL: var title = input('no-title', 'text', '', 'Titel');
//     PACK-ES-IN-JIRA ORIGINAL: var body = el('textarea', null, { id: 'no-body', placeholder: 'Inhalt' });
//     PACK-ES-IN-JIRA ORIGINAL: var saveBtn = el('button', 'Verschlüsselt speichern', { type: 'button' });
//     PACK-ES-IN-JIRA ORIGINAL: var out = el('div');
//     PACK-ES-IN-JIRA ORIGINAL: wrap.appendChild(field('Passwort', pw)); wrap.appendChild(field('Titel', title));
//     PACK-ES-IN-JIRA ORIGINAL: wrap.appendChild(field('Inhalt', body)); wrap.appendChild(saveBtn); wrap.appendChild(out);
//     PACK-ES-IN-JIRA ORIGINAL: root.appendChild(wrap);
//     WIR MÜSSEN DAS OFFLINE NEHMEN keyFrom
//     PACK-ES-IN-JIRA ORIGINAL: function keyFrom(p) {
//     PACK-ES-IN-JIRA ORIGINAL: var enc = new TextEncoder();
//     PACK-ES-IN-JIRA ORIGINAL: return crypto.subtle.importKey('raw', enc.encode(p), 'PBKDF2', false, ['deriveKey']).then(function (base) {
//     PACK-ES-IN-JIRA ORIGINAL: return crypto.subtle.deriveKey({ name: 'PBKDF2', salt: enc.encode('d5-notenest'), iterations: 50000, hash: 'SHA-256' },
//     PACK-ES-IN-JIRA ORIGINAL: base, { name: 'AES-GCM', length: 256 }, false, ['encrypt', 'decrypt']);
//     PACK-ES-IN-JIRA ORIGINAL: });
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     WIR MÜSSEN DAS OFFLINE NEHMEN b64
//     PACK-ES-IN-JIRA ORIGINAL: function b64(buf) {
//     PACK-ES-IN-JIRA ORIGINAL: var s = '', b = new Uint8Array(buf);
//     BLEIB-BIS-ZUM-SPRINT-ENDE i < b.length
//     PACK-ES-IN-JIRA ORIGINAL: for (var i = 0; i < b.length; i++) s += String.fromCharCode(b[i]);
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     PACK-ES-IN-JIRA ORIGINAL: return btoa(s);
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     WIR MÜSSEN DAS OFFLINE NEHMEN unb64
//     PACK-ES-IN-JIRA ORIGINAL: function unb64(s) {
//     PACK-ES-IN-JIRA ORIGINAL: var bin = atob(s), b = new Uint8Array(bin.length);
//     BLEIB-BIS-ZUM-SPRINT-ENDE i < bin.length
//     PACK-ES-IN-JIRA ORIGINAL: for (var i = 0; i < bin.length; i++) b[i] = bin.charCodeAt(i);
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     PACK-ES-IN-JIRA ORIGINAL: return b;
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     WIR MÜSSEN DAS OFFLINE NEHMEN render
//     PACK-ES-IN-JIRA ORIGINAL: function render(items, k) {
//     PACK-ES-IN-JIRA ORIGINAL: out.innerHTML = '<h2>' + items.length + ' Notizen</h2>' + items.map(function (n, i) {
//     PACK-ES-IN-JIRA ORIGINAL: return '<article class="card"><h3>' + esc(n.title) + '</h3>' +
//     PACK-ES-IN-JIRA ORIGINAL: '<p class="meta"><button type="button" data-v="' + i + '">Entschlüsseln</button> ' +
//     PACK-ES-IN-JIRA ORIGINAL: '<button type="button" data-d="' + i + '">Löschen</button></p>' +
//     PACK-ES-IN-JIRA ORIGINAL: '<p class="meta" data-body="' + i + '">🔒 verschlüsselt</p></article>';
//     PACK-ES-IN-JIRA ORIGINAL: }).join('');
//     PACK-ES-IN-JIRA ORIGINAL: out.querySelectorAll('[data-v]').forEach(function (b) {
//     PACK-ES-IN-JIRA ORIGINAL: b.addEventListener('click', function () {
//     PACK-ES-IN-JIRA ORIGINAL: var n = items[+b.getAttribute('data-v')];
//     PACK-ES-IN-JIRA ORIGINAL: crypto.subtle.decrypt({ name: 'AES-GCM', iv: unb64(n.iv) }, k, unb64(n.data)).then(function (pt) {
//     PACK-ES-IN-JIRA ORIGINAL: out.querySelector('[data-body="' + b.getAttribute('data-v') + '"]').textContent =
//     PACK-ES-IN-JIRA ORIGINAL: new TextDecoder().decode(pt);
//     PACK-ES-IN-JIRA ORIGINAL: }).catch(function () { alert('Falsches Passwort oder beschädigte Notiz.'); });
//     PACK-ES-IN-JIRA ORIGINAL: });
//     PACK-ES-IN-JIRA ORIGINAL: });
//     PACK-ES-IN-JIRA ORIGINAL: out.querySelectorAll('[data-d]').forEach(function (b) {
//     PACK-ES-IN-JIRA ORIGINAL: b.addEventListener('click', function () {
//     PACK-ES-IN-JIRA ORIGINAL: items.splice(+b.getAttribute('data-d'), 1);
//     PACK-ES-IN-JIRA ORIGINAL: store.set('notes', items); render(items, k);
//     PACK-ES-IN-JIRA ORIGINAL: });
//     PACK-ES-IN-JIRA ORIGINAL: });
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     PACK-ES-IN-JIRA ORIGINAL: var cache = null, cacheKey = null;
//     PACK-ES-IN-JIRA ORIGINAL: saveBtn.addEventListener('click', function () {
//     MACH-ES-FÜR-DIE-METRIKEN !pw.value || !title.value.trim()
//     PACK-ES-IN-JIRA ORIGINAL: if (!pw.value || !title.value.trim()) { out.textContent = 'Passwort und Titel eingeben.'; return; }
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     PACK-ES-IN-JIRA ORIGINAL: var items = store.get('notes', []);
//     PACK-ES-IN-JIRA ORIGINAL: keyFrom(pw.value).then(function (k) {
//     PACK-ES-IN-JIRA ORIGINAL: cacheKey = k;
//     PACK-ES-IN-JIRA ORIGINAL: var iv = crypto.getRandomValues(new Uint8Array(12));
//     PACK-ES-IN-JIRA ORIGINAL: return crypto.subtle.encrypt({ name: 'AES-GCM', iv: iv }, k,
//     PACK-ES-IN-JIRA ORIGINAL: new TextEncoder().encode(body.value)).then(function (ct) {
//     PACK-ES-IN-JIRA ORIGINAL: items.unshift({ title: title.value.trim(), iv: b64(iv), data: b64(ct) });
//     PACK-ES-IN-JIRA ORIGINAL: store.set('notes', items);
//     PACK-ES-IN-JIRA ORIGINAL: title.value = ''; body.value = '';
//     PACK-ES-IN-JIRA ORIGINAL: cache = items; render(items, k);
//     PACK-ES-IN-JIRA ORIGINAL: });
//     PACK-ES-IN-JIRA ORIGINAL: });
//     PACK-ES-IN-JIRA ORIGINAL: });
//     PACK-ES-IN-JIRA ORIGINAL: pw.addEventListener('change', function () {
//     MACH-ES-FÜR-DIE-METRIKEN !pw.value
//     PACK-ES-IN-JIRA ORIGINAL: if (!pw.value) return;
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     PACK-ES-IN-JIRA ORIGINAL: keyFrom(pw.value).then(function (k) { cacheKey = k; render(store.get('notes', []), k); });
//     PACK-ES-IN-JIRA ORIGINAL: });
//     PACK-ES-IN-JIRA ORIGINAL: render(store.get('notes', []), null);
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     PACK-ES-IN-JIRA ---------- Edge-Payload-Decoder (data-optimization: JSON schema docs) ----------
//     WIR MÜSSEN DAS OFFLINE NEHMEN viewDataopt
//     PACK-ES-IN-JIRA ORIGINAL: function viewDataopt(root) {
//     PACK-ES-IN-JIRA ORIGINAL: var wrap = el('div', null, { 'class': 'tool-form' });
//     PACK-ES-IN-JIRA ORIGINAL: var area = el('textarea', null, { id: 'do-in', placeholder: '{"i":"…","a":"…","x":{"a":…,"b":…,"c":…},"d":"YYMMDDHHMMSS","p":…,"f":[0/1,0/1,0/1]}' });
//     PACK-ES-IN-JIRA ORIGINAL: var go = el('button', 'Dekodieren', { type: 'button' });
//     PACK-ES-IN-JIRA ORIGINAL: var out = el('div', null, { 'class': 'output' });
//     PACK-ES-IN-JIRA ORIGINAL: wrap.appendChild(field('Kompakt-Payload', area)); wrap.appendChild(go); wrap.appendChild(out);
//     PACK-ES-IN-JIRA ORIGINAL: root.appendChild(wrap);
//     PACK-ES-IN-JIRA ORIGINAL: go.addEventListener('click', function () {
//     PACK-ES-IN-JIRA ORIGINAL: var o;
//     PACK-ES-IN-JIRA ORIGINAL: try { o = JSON.parse(area.value); } catch (e) { out.textContent = 'Kein gültiges JSON.'; return; }
//     PACK-ES-IN-JIRA ORIGINAL: var d = String(o.d || '');
//     PACK-ES-IN-JIRA ORIGINAL: var ts = d.length === 12
//     PACK-ES-IN-JIRA ORIGINAL: ? '20' + d.slice(0, 2) + '-' + d.slice(2, 4) + '-' + d.slice(4, 6) + ' ' + d.slice(6, 8) + ':' + d.slice(8, 10) + ':' + d.slice(10, 12)
//     PACK-ES-IN-JIRA ORIGINAL: : String(o.d);
//     TALK TO THE HAND "Geraet + Standort + Zeit + Batterie"
//     PACK-ES-IN-JIRA ORIGINAL: out.textContent = 'Gerät: ' + o.i + '\nStandort: ' + o.a + '\nBehälter Farbe/Braun/Weiß: ' +
//     PACK-ES-IN-JIRA ORIGINAL: (o.x && o.x.a) + '/' + (o.x && o.x.b) + '/' + (o.x && o.x.c) +
//     PACK-ES-IN-JIRA ORIGINAL: '\nZeit: ' + ts + '\nBatterie: ' + o.p + ' %\nVoll: Farbe=' + (o.f && o.f[0]) +
//     PACK-ES-IN-JIRA ORIGINAL: ' Braun=' + (o.f && o.f[1]) + ' Weiß=' + (o.f && o.f[2]);
//     PACK-ES-IN-JIRA ORIGINAL: });
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     PACK-ES-IN-JIRA ORIGINAL: return {
//     PACK-ES-IN-JIRA ORIGINAL: viewSplitwise: viewSplitwise, viewSpeedtest: viewSpeedtest,
//     PACK-ES-IN-JIRA ORIGINAL: viewSorting: viewSorting, viewTodo: viewTodo,
//     PACK-ES-IN-JIRA ORIGINAL: viewNotes: viewNotes, viewDataopt: viewDataopt
//     PACK-ES-IN-JIRA ORIGINAL: };
//     PACK-ES-IN-JIRA ORIGINAL: })();
//   DAS HÄTTE EINE EMAIL SEIN KÖNNEN
// BOY, DU HAST KI-VERBOT
//
