// Goose-Port-Spiegel von: app/app.js
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: app/app.js");
}

// ---- Original-Code (app/app.js), unveraendert, als Inline-Doku ----
// /* d5 super-app shell: hash router + catalog + tool registry.
//    Serves the whole repo statically (serve the repo root, not app/). */
// (function () {
// "use strict";
// var CATALOG = window.D5_CATALOG || window.SHADOWCORE_CATALOG || [];
// var view = document.getElementById('view');
//
// function el(tag, text, attrs) {
//   var e = document.createElement(tag);
//   if (text != null) e.textContent = text;
//   if (attrs) for (var k in attrs) {
//     if (k === 'html') e.innerHTML = attrs[k];
//     else e.setAttribute(k, attrs[k]);
//   }
//   return e;
// }
// function esc(s) { return String(s).replace(/[&<>"']/g, function (c) {
//   return { '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;', "'": '&#39;' }[c]; }); }
// function bySlug(s) {
//   for (var i = 0; i < CATALOG.length; i++) if (CATALOG[i].slug === s) return CATALOG[i];
//   return null;
// }
//
// /* Entry files verified readable (no build stubs, no server templates). */
// var RUNNABLE = {
//   'github-repos-stranded-horizons': 'game.html',
//   'cloud,-hosting-&-saas-uptime-site': 'public/index.html',
//   'utilities-&-desktop-tools-clearcall': 'client/index.html',
//   'startup-business-concepts-securestream-vpn': 'client/index.html',
//   'startup-business-concepts-zapfile-html-css-javascript': 'indexs.html',
//   'browser-games-color-cascade-browser-video-game': 'color-cascade/index.html',
//   'archive-unsorted-cascadeprojects': 'windsurf-project/index.html',
//   'browser-games-browser-game': 'index.html',
//   'personal-client-websites-volcan-chico': 'index.html'
// };
//
// /* slug -> native tool id */
// var PORTED = {
//   'archive-unsorted-calculator': 'calc',
//   'archive-unsorted-bodymassindex': 'bmi',
//   'archive-unsorted-die_klasse_bruch': 'bruch',
//   'archive-unsorted-tokyo-metro-pricing': 'tokyo',
//   'archive-unsorted-kilometerz-hler': 'verbrauch',
//   'archive-unsorted-kilometerzähler': 'verbrauch',
//   'archive-unsorted-wetter-daten-analyse': 'wetter',
//   'browser-games-snake': 'snake',
//   'browser-games-tic-tac-toe': 'tictactoe',
//   'browser-games-ping-pong': 'pong',
//   'archive-unsorted-guestbook-html-css-javascript': 'guestbook',
//   'productivity-&-sharing-apps-link-shortener': 'shortener',
//   'productivity-&-sharing-apps-shortify': 'shortener',
//   'productivity-sharing-apps-splitwise': 'splitwise',
//   'productivity-sharing-apps-todo': 'todo',
//   'utilities-desktop-tools-speedtest': 'speedtest',
//   'utilities-desktop-tools-speedsnap': 'speedtest',
//   'utilities-desktop-tools-sorting-script': 'sorting',
//   'minecraft-plugins-&-server-systems-bedwars': 'bedwars',
//   'minecraft-plugins-&-server-systems-buildffa-revamp': 'buildffa',
//   'minecraft-plugins-&-server-systems-clan-wars': 'clanwars',
//   'minecraft-plugins-server-systems-automatic-login-plugin': 'signin',
//   'minecraft-plugins-server-systems-autosaver-minecraft': 'autosave',
//   'minecraft-plugins-server-systems-broadcast-restart-plugin': 'restart',
//   'minecraft-plugins-server-systems-chestspawner': 'chest',
//   'minecraft-plugins-server-systems-connecthub-java-mc-plugin': 'lobby',
//   'minecraft-plugins-server-systems-directserverconnect': 'direct',
//   'minecraft-plugins-server-systems-elytra-plugin': 'elytra',
//   'minecraft-plugins-server-systems-horden-plugin': 'horde',
//   'minecraft-plugins-server-systems-lobby-system-minecraft': 'lobby',
//   'minecraft-plugins-server-systems-minecraft-minigame-template': 'template',
//   'minecraft-plugins-server-systems-minecraft-anticheat': 'anticheat',
//   'minecraft-plugins-server-systems-minigametemplate-java': 'template',
//   'minecraft-plugins-server-systems-questsystem': 'quests',
//   'minecraft-plugins-server-systems-randomitem': 'randitem',
//   'minecraft-plugins-server-systems-rolesync': 'rolesync',
//   'minecraft-plugins-server-systems-sandstone-remover-pocketmine': 'sandstone',
//   'minecraft-plugins-server-systems-sessionlockplugin': 'lock',
//   'minecraft-plugins-server-systems-tablist': 'tablist',
//   'minecraft-plugins-server-systems-voicechat': 'voice',
//   'minecraft-plugins-&-server-systems-arena-auto-reset': 'arena',
//   'minecraft-plugins-&-server-systems-locate-structure-minecraft': 'locate',
//   'minecraft-plugins-&-server-systems-tnt-remover': 'tnt',
//   'utilities-desktop-tools-sessionlock': 'lock',
//   'archive-unsorted-helloworld': 'hello',
//   'learning-projects-pseudocode': 'pseudo',
//   'archive-unsorted-pillars-of-fortune': 'fortune',
//   'minecraft-game-concepts-apocalypseunleashed': 'apocalypse',
//   'minecraft-game-concepts-challenges-source': 'chall',
//   'startup-business-concepts-hearthrift': 'hearth',
//   'browser-games-browser-game-open-world-minigame': 'realms',
//   'github-repos-streuland': 'streuland',
//   'browser-games-hangmen': 'hangman',
//   'browser-games-guess-the-number': 'guess',
//   'browser-games-2048': 'play2048',
//   'browser-games-tank-shooter-browser': 'tank',
//   'browser-games-tamagotchi-game': 'tama',
//   'utilities-&-desktop-tools-audio_visualizer': 'viz'
// };
//
// function sourceWhy(e) {
//   var s = (e.stack || '') + ' ' + (e.status || '');
//   if (/Minecraft|Bukkit|Spigot|Java/i.test(s))
//     return 'Runs on a Java/Minecraft server (Bukkit/Spigot API) — a browser cannot load it. Play the native rewrite under Tools instead.';
//   if (/Flutter|Dart/.test(s)) return 'Needs the Flutter/Dart toolchain to build — not runnable from a static page.';
//   if (/Flask|Django|PHP|MySQL|backend/i.test(s))
//     return 'Needs a server backend (or database) — the static app replaces it with an in-browser port where one exists.';
//   if (/Discord bot/i.test(s)) return 'A Discord bot needs tokens and a live gateway connection — kept as source.';
//   return 'Kept as source: no browser entry point (desktop tooling, scripts, or data).';
// }
//
// /* ---------- tiny form helpers for logic-tool views ---------- */
// function numInput(id, ph) { return el('input', null, { id: id, type: 'number', placeholder: ph || '' }); }
// function out(text) { return el('pre', text, { 'class': 'result' }); }
// function toolForm(root, fields, onRun) {
//   var wrap = el('div', null, { 'class': 'tool-form' });
//   fields.forEach(function (f) { wrap.appendChild(f); });
//   var btn = el('button', 'Run'); var res = out('');
//   btn.addEventListener('click', function () { res.textContent = onRun(); });
//   wrap.appendChild(btn); wrap.appendChild(res);
//   root.appendChild(wrap);
// }
//
// /* ---------- tool views built on window.d5Tools logic ---------- */
// var T = window.d5Tools;
// function viewCalc(root) {
//   var wrap = el('div', null, { 'class': 'tool-form' });
//   var sel = el('select');
//   T.CALC_OPS.forEach(function (o) {
//     var op = el('option', o[0] + '. ' + o[1], { value: o[0] }); sel.appendChild(op);
//   });
//   var a = numInput('a', 'a'), b = numInput('b', 'b');
//   var res = out('');
//   wrap.appendChild(sel); wrap.appendChild(a); wrap.appendChild(b);
//   var btn = el('button', 'Run');
//   btn.addEventListener('click', function () {
//     res.textContent = String(T.calc(sel.value, parseFloat(a.value), parseFloat(b.value)));
//   });
//   wrap.appendChild(btn); wrap.appendChild(res); root.appendChild(wrap);
// }
// function viewBmi(root) {
//   toolForm(root, [numInput('w', 'weight kg'), numInput('h', 'height m')], function () {
//     var f = root.querySelectorAll('input');
//     return T.bmi(parseFloat(f[0].value), parseFloat(f[1].value));
//   });
// }
// function viewBruch(root) {
//   toolForm(root, [numInput('z', 'Zähler'), numInput('n', 'Nenner')], function () {
//     var f = root.querySelectorAll('input');
//     T.bruch.set(parseInt(f[0].value, 10) || 0, parseInt(f[1].value, 10) || 1);
//     T.bruch.reduce();
//     return T.bruch.text();
//   });
// }
// function viewTokyo(root) {
//   toolForm(root, [numInput('km', 'km')], function () {
//     return T.tokyo(parseFloat(root.querySelector('input').value));
//   });
// }
// function viewVerbrauch(root) {
//   toolForm(root, [numInput('p', 'km vorher'), numInput('n', 'km jetzt'), numInput('l', 'Liter')], function () {
//     var f = root.querySelectorAll('input');
//     return T.verbrauch(parseFloat(f[0].value), parseFloat(f[1].value), parseFloat(f[2].value));
//   });
// }
// function viewWetter(root) {
//   var wrap = el('div', null, { 'class': 'tool-form' });
//   var ta = el('textarea', null, { rows: '6', cols: '50' }); ta.value = T.WETTER_SAMPLE;
//   var res = out('');
//   var btn = el('button', 'Parse + sort');
//   btn.addEventListener('click', function () {
//     var r = T.parseWetter(ta.value);
//     res.textContent = r.records.map(function (x) {
//       return x.id + ' | ' + x.name + ' | ' + x.date + ' | ' + x.value;
//     }).join('\n') + (r.errors.length ? '\n--- errors ---\n' + r.errors.join('\n') : '');
//   });
//   wrap.appendChild(ta); wrap.appendChild(btn); wrap.appendChild(res); root.appendChild(wrap);
// }
//
// var G = null, MG = null, MT = null, MX = null, A = null, A2 = null, TR = null;
// function mods() { G = window.d5Games; MG = window.d5McGames; MT = window.d5McTools; MX = window.d5McMisc; A = window.d5Apps; A2 = window.d5Apps2; TR = window.d5Trip; }
//
// var TOOLS = [
//   { id: 'calc', title: 'Calculator', desc: '25 ops, mirrors archive-unsorted-calculator.', run: viewCalc },
//   { id: 'bmi', title: 'BMI Rechner', desc: 'Mirrors bodymassindex thresholds verbatim.', run: viewBmi },
//   { id: 'bruch', title: 'Klasse Bruch', desc: 'Fraction reduce via gcd.', run: viewBruch },
//   { id: 'tokyo', title: 'Tokyo Metro Pricing', desc: 'Fare table by distance.', run: viewTokyo },
//   { id: 'verbrauch', title: 'Kilometerzähler', desc: 'Fuel consumption per 100 km.', run: viewVerbrauch },
//   { id: 'wetter', title: 'Wetter Daten Analyse', desc: 'Record parser + sort.', run: viewWetter },
//   { id: 'snake', title: 'Snake', desc: 'Port of browser-games-snake.', run: function (r) { G.viewSnake(r); } },
//   { id: 'tictactoe', title: 'Tic-Tac-Toe', desc: 'Human X vs random bot O + tally.', run: function (r) { G.viewTictactoe(r); } },
//   { id: 'pong', title: 'Ping Pong', desc: 'W/S vs AI, first to 5, points shop.', run: function (r) { G.viewPong(r); } },
//   { id: 'hangman', title: 'Hangman', desc: 'Port of browser-games-hangmen: German words, 7 tries.', run: function (r) { G.viewHangman(r); } },
//   { id: 'guess', title: 'Guess the Number', desc: 'Port of guess-the-number: 1-100, 10 tries.', run: function (r) { G.viewGuess(r); } },
//   { id: 'play2048', title: '2048', desc: 'Port of browser-games-2048: slide and merge to 2048.', run: function (r) { G.view2048(r); } },
//   { id: 'tank', title: 'TankBlaster', desc: 'Port of tank-shooter-browser: dodge and shoot.', run: function (r) { G.viewTank(r); } },
//   { id: 'tama', title: 'Tamagotchi', desc: 'Port of tamagotchi-game backend: feed/play/sleep, localStorage.', run: function (r) { G.viewTama(r); } },
//   { id: 'viz', title: 'Audio Visualizer', desc: 'Port of audio_visualizer: mic or demo tone bars.', run: function (r) { G.viewViz(r); } },
//   { id: 'trip', title: 'Trip to the Makers', desc: 'Meta HQ pilgrimage: timed days, checklist, budget, sights, videos.', run: function (r, a) { TR.viewTrip(r, a); } },
//   { id: 'park', title: 'Theme Park Tycoon', desc: 'Build rides, attract visitors, reach €5000.', run: function (r) { G.viewPark(r); } },
//   { id: 'bedwars', title: 'BedWars (web)', desc: 'Native rewrite of the Java BedWars plugin: generators, shop tiers, bed armor, events.', run: function (r) { MG.viewBedwars(r); } },
//   { id: 'buildffa', title: 'BuildFFA (web)', desc: 'Native rewrite of the Java BuildFFA plugin: arena FFA, kills/deaths/KD.', run: function (r) { MG.viewBuildffa(r); } },
//   { id: 'clanwars', title: 'ClanWars (web)', desc: 'Native rewrite of the Java ClanWars plugin: clans, battles, ratings.', run: function (r) { MG.viewClanwars(r); } },
//   { id: 'guestbook', title: 'Guestbook', desc: 'BBCode + validation, localStorage backend.', run: function (r) { A.viewGuestbook(r); } },
//   { id: 'signin', title: 'Login Demo', desc: 'Local auth demo.', run: function (r) { A.viewSignin(r); } },
//   { id: 'shortener', title: 'Link Shortener', desc: 'Base62 + visit counter.', run: function (r) { A.viewShortener(r); } },
//   { id: 'splitwise', title: 'Splitwise', desc: 'Equal splits, balances, settle-up.', run: function (r) { A2.viewSplitwise(r); } },
//   { id: 'speedtest', title: 'Speedtest', desc: 'Live ping + download.', run: function (r) { A2.viewSpeedtest(r); } },
//   { id: 'sorting', title: 'Sortier-Planer', desc: 'Extension map, exports move scripts.', run: function (r) { A2.viewSorting(r); } },
//   { id: 'todo', title: 'ToDo', desc: 'Task list with localStorage.', run: function (r) { A2.viewTodo(r); } },
//   { id: 'notes', title: 'NoteNest', desc: 'AES-GCM encrypted notes.', run: function (r) { A2.viewNotes(r); } },
//   { id: 'dataopt', title: 'Edge-Payload-Decoder', desc: 'Payload decoder.', run: function (r) { A2.viewDataopt(r); } },
//   { id: 'lock', title: 'SessionLock', desc: 'Port of SessionLock/sessionlockplugin: PIN lock screen.', run: function (r) { MT.viewLock(r); } },
//   { id: 'tablist', title: 'Tablist', desc: 'Port of tablist: player list with ping.', run: function (r) { MT.viewTablist(r); } },
//   { id: 'autosave', title: 'Autosaver', desc: 'Port of autosaver-minecraft: interval world saves.', run: function (r) { MT.viewAutosave(r); } },
//   { id: 'restart', title: 'BroadcastRestart', desc: 'Port of broadcast-restart-plugin: restart countdown.', run: function (r) { MT.viewRestart(r); } },
//   { id: 'chest', title: 'ChestSpawner', desc: 'Port of chestspawner: loot chest generator.', run: function (r) { MT.viewChest(r); } },
//   { id: 'randitem', title: 'RandomItem', desc: 'Port of randomitem: timed random drops.', run: function (r) { MT.viewRanditem(r); } },
//   { id: 'quests', title: 'QuestSystem', desc: 'Port of questsystem: quest tracker.', run: function (r) { MT.viewQuests(r); } },
//   { id: 'lobby', title: 'Lobby + ConnectHub', desc: 'Port of lobby-system/connecthub: server selector.', run: function (r) { MT.viewLobby(r); } },
//   { id: 'direct', title: 'DirectServerConnect', desc: 'Port of directserverconnect: host/port ping.', run: function (r) { MT.viewDirect(r); } },
//   { id: 'elytra', title: 'Elytra', desc: 'Port of elytra-plugin: glide calculator.', run: function (r) { MT.viewElytra(r); } },
//   { id: 'horde', title: 'Horden', desc: 'Port of horden-plugin: horde waves.', run: function (r) { MT.viewHorde(r); } },
//   { id: 'template', title: 'MinigameTemplate', desc: 'Port of minigame-template(s): starter-kit generator.', run: function (r) { MT.viewTemplate(r); } },
//   { id: 'anticheat', title: 'AntiCheat', desc: 'Port of minecraft-anticheat: CPS detector demo.', run: function (r) { MT.viewAnticheat(r); } },
//   { id: 'rolesync', title: 'RoleSync', desc: 'Port of rolesync: MC/Discord role mapper.', run: function (r) { MT.viewRolesync(r); } },
//   { id: 'sandstone', title: 'SandstoneRemover', desc: 'Port of sandstone-remover: block filter sim.', run: function (r) { MT.viewSandstone(r); } },
//   { id: 'arena', title: 'ArenaAutoReset', desc: 'Port of arena-auto-reset: reset timer.', run: function (r) { MT.viewArena(r); } },
//   { id: 'locate', title: 'LocateStructure', desc: 'Port of locate-structure: seed-based finder.', run: function (r) { MT.viewLocate(r); } },
//   { id: 'tnt', title: 'TNTRemover', desc: 'Port of tnt-remover: blast toggle.', run: function (r) { MT.viewTnt(r); } },
//   { id: 'voice', title: 'VoiceChat', desc: 'Port of voicechat: channel sim.', run: function (r) { MT.viewVoice(r); } },
//   { id: 'hello', title: 'HelloWorld', desc: 'Port of archive-unsorted-helloworld.', run: function (r) { MT.viewHello(r); } },
//   { id: 'pseudo', title: 'Pseudocode Runner', desc: 'Tiny SET/ADD/PRINT/LOOP interpreter.', run: function (r) { MT.viewPseudo(r); } },
//   { id: 'fortune', title: 'PillarsOfFortune', desc: 'Port of pillars-of-fortune: timed loot pillar.', run: function (r) { MX.viewFortune(r); } },
//   { id: 'apocalypse', title: 'ApocalypseUnleashed', desc: 'Port of apocalypseunleashed: survive 15 disasters.', run: function (r) { MX.viewApocalypse(r); } },
//   { id: 'hearth', title: 'Hearthrift', desc: 'Port of hearthrift: daily + PvP rewards.', run: function (r) { MX.viewHearth(r); } },
//   { id: 'realms', title: 'RealmOfWonders', desc: 'Port of open-world-minigame: stats + achievements.', run: function (r) { MX.viewRealms(r); } },
//   { id: 'chall', title: 'Challenges', desc: 'Port of challenges-source: timed challenge runner.', run: function (r) { MX.viewChall(r); } },
//   { id: 'streuland', title: 'Streuland Invites', desc: 'Port of streuland invite-code signup flow.', run: function (r) { MX.viewStreuland(r); } }
// ];
// function toolById(id) {
//   for (var i = 0; i < TOOLS.length; i++) if (TOOLS[i].id === id) return TOOLS[i];
//   return null;
// }
//
// /* ---------- super-app shell: recents, favorites, sections, unified search ---------- */
// var SECTIONS = [
//   { id: 'everyday', title: 'Everyday', ids: ['calc', 'bmi', 'bruch', 'tokyo', 'verbrauch', 'wetter', 'todo', 'notes', 'shortener', 'splitwise', 'guestbook', 'signin', 'speedtest', 'sorting', 'dataopt', 'lock'] },
//   { id: 'play', title: 'Play', ids: ['snake', 'tictactoe', 'pong', 'hangman', 'guess', 'play2048', 'tank', 'tama', 'viz', 'park', 'trip'] },
//   { id: 'minecraft', title: 'Minecraft & servers', ids: ['bedwars', 'buildffa', 'clanwars', 'lobby', 'direct', 'quests', 'chest', 'randitem', 'arena', 'locate', 'tnt', 'voice', 'autosave', 'restart', 'tablist', 'elytra', 'horde', 'template', 'anticheat', 'rolesync', 'sandstone'] },
//   { id: 'stories', title: 'Worlds & stories', ids: ['hello', 'pseudo', 'fortune', 'apocalypse', 'hearth', 'realms', 'chall', 'streuland'] }
// ];
// function storeGet(k, fb) { try { var v = JSON.parse(localStorage.getItem(k)); return v == null ? fb : v; } catch (e) { return fb; } }
// function storeSet(k, v) { try { localStorage.setItem(k, JSON.stringify(v)); } catch (e) {} }
// function favs() { return storeGet('d5_fav', []); }
// function isFav(id) { return favs().indexOf(id) >= 0; }
// function toggleFav(id) { var f = favs(); var i = f.indexOf(id); if (i >= 0) f.splice(i, 1); else f.push(id); storeSet('d5_fav', f); }
// function pushRecent(id) {
//   var r = storeGet('d5_recent', []).filter(function (x) { return x !== id; });
//   r.unshift(id); storeSet('d5_recent', r.slice(0, 8));
// }
// function toolCard(t, withFav) {
//   var c = el('div', null, { 'class': 'card' });
//   c.appendChild(el('strong', t.title));
//   c.appendChild(el('p', t.desc, { 'class': 'meta' }));
//   var row = el('div', null, { 'class': 'card-row' });
//   row.appendChild(el('a', 'Open', { href: '#/tool/' + t.id, 'class': 'btn' }));
//   if (withFav !== false) {
//     var f = el('button', isFav(t.id) ? '★' : '☆', { 'class': 'fav', title: 'Favorite' });
//     (function (id, btn) { btn.addEventListener('click', function () { toggleFav(id); btn.textContent = isFav(id) ? '★' : '☆'; }); })(t.id, f);
//     row.appendChild(f);
//   }
//   c.appendChild(row);
//   return c;
// }
// function searchAll(q) {
//   q = (q || '').toLowerCase().trim();
//   if (!q) return { tools: [], entries: [] };
//   var tools = TOOLS.filter(function (t) { return (t.id + ' ' + t.title + ' ' + t.desc).toLowerCase().indexOf(q) >= 0; }).slice(0, 8);
//   var entries = CATALOG.filter(function (e) { return (e.slug + ' ' + e.name + ' ' + e.category + ' ' + e.stack).toLowerCase().indexOf(q) >= 0; });
//   entries.sort(function (a, b) {
//     var ra = PORTED[a.slug] ? 0 : (RUNNABLE[a.slug] ? 1 : 2);
//     var rb = PORTED[b.slug] ? 0 : (RUNNABLE[b.slug] ? 1 : 2);
//     return ra - rb;
//   });
//   return { tools: tools, entries: entries.slice(0, 12) };
// }
//
// /* ---------- page views ---------- */
// function page(title, sub) {
//   view.innerHTML = '';
//   view.appendChild(el('h2', title));
//   if (sub) view.appendChild(el('p', sub, { 'class': 'meta' }));
// }
// function viewHome() {
//   mods();
//   page('d5', TOOLS.length + ' tools · ' + CATALOG.length + ' library entries · static, no backend.');
//   var box = el('input', null, { type: 'search', placeholder: 'Search tools and library…', 'class': 'search' });
//   var res = el('div', null, { 'class': 'cards' });
//   function drawRes() {
//     res.innerHTML = '';
//     var r = searchAll(box.value);
//     if (!box.value.trim()) return;
//     if (!r.tools.length && !r.entries.length) { res.appendChild(el('p', 'No matches. Try the full library below.', { 'class': 'meta' })); return; }
//     r.tools.forEach(function (t) { res.appendChild(toolCard(t)); });
//     r.entries.forEach(function (e) {
//       var c = el('div', null, { 'class': 'card' });
//       c.appendChild(el('strong', e.name));
//       c.appendChild(el('p', e.category + ' · ' + e.stack, { 'class': 'meta' }));
//       c.appendChild(el('a', PORTED[e.slug] ? 'Open native port' : (RUNNABLE[e.slug] ? 'Open embed' : 'Library entry'), { href: PORTED[e.slug] ? '#/tool/' + PORTED[e.slug] : '#/project/' + encodeURIComponent(e.slug) }));
//       res.appendChild(c);
//     });
//   }
//   box.addEventListener('input', drawRes);
//   view.appendChild(box); view.appendChild(res);
//
//   var recent = storeGet('d5_recent', []).map(toolById).filter(Boolean);
//   if (recent.length) {
//     view.appendChild(el('h3', 'Continue'));
//     var rl = el('div', null, { 'class': 'cards' });
//     recent.forEach(function (t) { rl.appendChild(toolCard(t)); });
//     view.appendChild(rl);
//   }
//   var fv = favs().map(toolById).filter(Boolean);
//   if (fv.length) {
//     view.appendChild(el('h3', 'Favorites'));
//     var fl = el('div', null, { 'class': 'cards' });
//     fv.forEach(function (t) { fl.appendChild(toolCard(t)); });
//     view.appendChild(fl);
//   }
//   SECTIONS.forEach(function (s) {
//     view.appendChild(el('h3', s.title));
//     var list = el('div', null, { 'class': 'cards' });
//     s.ids.map(toolById).filter(Boolean).forEach(function (t) { list.appendChild(toolCard(t)); });
//     view.appendChild(list);
//   });
//   var lib = el('p', null, { 'class': 'meta' });
//   lib.appendChild(el('a', 'Browse the full ' + CATALOG.length + '-entry library (source + embeds) →', { href: '#/catalog' }));
//   view.appendChild(lib);
// }
// function viewCatalog(q) {
//   page('Library', CATALOG.length + ' entries. Native ports open directly — this shelf keeps every source project and embed.');
//   var box = el('input', null, { type: 'search', placeholder: 'filter…', value: q || '' });
//   var list = el('div', null, { 'class': 'cards' });
//   function draw() {
//     list.innerHTML = '';
//     var f = box.value.toLowerCase();
//     CATALOG.slice().sort(function (a, b) {
//       var ra = PORTED[a.slug] ? 0 : (RUNNABLE[a.slug] ? 1 : 2);
//       var rb = PORTED[b.slug] ? 0 : (RUNNABLE[b.slug] ? 1 : 2);
//       return ra - rb;
//     }).forEach(function (e) {
//       if (f && (e.slug + ' ' + e.name + ' ' + e.category + ' ' + e.stack).toLowerCase().indexOf(f) < 0) return;
//       var c = el('div', null, { 'class': 'card' });
//       c.appendChild(el('strong', e.name));
//       c.appendChild(el('p', e.category + ' · ' + e.stack, { 'class': 'meta' }));
//       c.appendChild(el('a', PORTED[e.slug] ? 'Open native port' : 'Details', { href: PORTED[e.slug] ? '#/tool/' + PORTED[e.slug] : '#/project/' + encodeURIComponent(e.slug) }));
//       list.appendChild(c);
//     });
//   }
//   box.addEventListener('input', draw);
//   view.appendChild(box); view.appendChild(list); draw();
// }
// function viewProject(slug) {
//   var e = bySlug(slug);
//   if (!e) { page('Not found', 'No project with slug ' + slug); return; }
//   page(e.name, e.category + ' · ' + e.stack);
//   view.appendChild(el('p', e.status, { 'class': 'meta' }));
//   if (PORTED[e.slug]) {
//     var t = toolById(PORTED[e.slug]);
//     view.appendChild(el('p', 'Native web port: ' + (t ? t.title : PORTED[e.slug])));
//     view.appendChild(el('a', 'Open the working port', { href: '#/tool/' + PORTED[e.slug], 'class': 'btn' }));
//   } else if (RUNNABLE[e.slug]) {
//     var f = el('iframe', null, { src: '../' + e.path + '/' + RUNNABLE[e.slug], 'class': 'embed' });
//     view.appendChild(f);
//     view.appendChild(el('p', 'Embedded from ' + e.path + '/' + RUNNABLE[e.slug], { 'class': 'meta' }));
//   } else {
//     view.appendChild(el('p', sourceWhy(e)));
//     view.appendChild(el('p', 'Source lives in ' + e.path + ' — open it from the repo checkout.', { 'class': 'meta' }));
//   }
//   var readme = el('div', 'Loading README…', { 'class': 'meta' });
//   view.appendChild(readme);
//   fetch('../' + e.path + '/README.md').then(function (r) {
//     if (!r.ok) throw 0; return r.text();
//   }).then(function (t) {
//     readme.innerHTML = '<pre>' + esc(t.slice(0, 4000)) + '</pre>';
//   }).catch(function () { readme.textContent = e.hasReadme ? 'README present in repo (fetch blocked from file:// — serve the repo root).' : 'No README in repo.'; });
// }
// function viewTools() {
//   mods(); page('Tools', TOOLS.length + ' working in-browser tools. Star your favorites — they surface on Home.');
//   SECTIONS.forEach(function (s) {
//     view.appendChild(el('h3', s.title));
//     var list = el('div', null, { 'class': 'cards' });
//     s.ids.map(toolById).filter(Boolean).forEach(function (t) { list.appendChild(toolCard(t)); });
//     view.appendChild(list);
//   });
// }
// function viewTool(id, arg) {
//   mods(); var t = toolById(id);
//   if (!t) { page('No such tool', id); return; }
//   pushRecent(id);
//   page(t.title, t.desc);
//   var back = el('a', '← all tools', { href: '#/tools' });
//   view.appendChild(back);
//   var favBtn = el('button', isFav(id) ? '★ Favorited' : '☆ Favorite', { 'class': 'fav-wide' });
//   favBtn.addEventListener('click', function () { toggleFav(id); favBtn.textContent = isFav(id) ? '★ Favorited' : '☆ Favorite'; });
//   view.appendChild(favBtn);
//   var root = el('div'); view.appendChild(root);
//   try { t.run(root, arg); }
//   catch (err) { root.appendChild(el('p', 'Tool failed to start: ' + err.message)); }
// }
//
// /* ---------- router ---------- */
// function route() {
//   mods();
//   var h = location.hash || '#/';
//   var m;
//   if (h === '#/' || h === '') viewHome();
//   else if (h.indexOf('#/catalog') === 0) viewCatalog(decodeURIComponent(h.slice(10) || ''));
//   else if (h.indexOf('#/project/') === 0) viewProject(decodeURIComponent(h.slice(10)));
//   else if (h.indexOf('#/tool/') === 0) {
//     var rest = h.slice(7).split('/');
//     viewTool(rest[0], rest[1] && decodeURIComponent(rest[1]));
//   }
//   else if (h.indexOf('#/go/') === 0) {
//     page('Kurzlink', 'Resolving…');
//     var gr = el('div'); view.appendChild(gr);
//     A.viewGo(gr, decodeURIComponent(h.slice(5)));
//   }
//   else if (h === '#/library') viewCatalog('');
//   else if (h === '#/tools') viewTools();
//   else page('Not found', h);
//   window.scrollTo(0, 0);
// }
// window.addEventListener('hashchange', route);
// route();
// })();
//
