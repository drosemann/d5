// Goose-Port-Spiegel von: app/mc-misc.js
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: app/mc-misc.js");
}

// ---- Original-Code (app/mc-misc.js), unveraendert, als Inline-Doku ----
// // Final Java-port batch: game concepts + streuland invite flow.
// // PillarsOfFortune: timed item drops (interval/min/max, title+chat+sound).
// // ApocalypseUnleashed: 15 disasters via DisasterManager. Hearthrift: worlds,
// // DailyReward streaks, PvPReward. RealmOfWonders: PlayerStats/achievements.
// // Challenges: timed challenge runner. Streuland: invite-code signup flow
// // (InviteCode/validate-invitation/SignupService, sqlite -> localStorage).
// window.d5McMisc = (function () {
//   function el(tag, text, attrs) {
//     var e = document.createElement(tag);
//     if (text != null) e.textContent = text;
//     if (attrs) for (var k in attrs) e.setAttribute(k, attrs[k]);
//     return e;
//   }
//   function store(k, d) {
//     try { var v = localStorage.getItem('d5:' + k); return v == null ? d : JSON.parse(v); }
//     catch (e) { return d; }
//   }
//   function save(k, v) { try { localStorage.setItem('d5:' + k, JSON.stringify(v)); } catch (e) {} }
//   function btn(label, fn) {
//     var b = el('button', label);
//     b.addEventListener('click', fn);
//     return b;
//   }
//
//   // PillarsOfFortune: fortune pillar drops loot on an interval.
//   var FORTUNE_LOOT = ['Diamant', 'Goldapfel', 'Enderperle', 'Eisenblock', 'Bogen', 'Verzauberungsbuch', 'Netherit', 'Smaragd'];
//   function viewFortune(root) {
//     var wrap = el('div', null, { 'class': 'tool-form' });
//     var interval = el('input', null, { type: 'number', value: '5' });
//     var msg = el('p', 'Säule aktiv. Warte auf Drops…', { 'class': 'meta' });
//     var log = el('pre', '', { 'class': 'result' });
//     var timer = null, n = 0;
//     wrap.appendChild(el('p', 'Drop-Intervall (s):', { 'class': 'meta' })); wrap.appendChild(interval);
//     wrap.appendChild(btn('Säule starten', function () {
//       clearInterval(timer); n = 0;
//       timer = setInterval(function () {
//         if (!document.body.contains(wrap)) { clearInterval(timer); return; }
//         n++;
//         var count = 1 + Math.floor(Math.random() * 3); // min/max-items-per-drop
//         var items = [];
//         for (var i = 0; i < count; i++) items.push(FORTUNE_LOOT[Math.floor(Math.random() * FORTUNE_LOOT.length)]);
//         log.textContent += 'Drop #' + n + ': ' + items.join(', ') + '\n'; // title+chat message
//         try { new Audio(); } catch (e) {} // play-sound hook (no asset shipped)
//         msg.textContent = 'Drop #' + n + ' gefallen!';
//       }, (parseInt(interval.value, 10) || 5) * 1000);
//     }));
//     wrap.appendChild(btn('Stopp', function () { clearInterval(timer); msg.textContent = 'Säule gestoppt.'; }));
//     wrap.appendChild(msg); wrap.appendChild(log); root.appendChild(wrap);
//   }
//
//   // ApocalypseUnleashed: survive random disasters.
//   var DISASTERS = ['Säureregen', 'Asteroidenregen', 'Blizzard', 'Erdbeben', 'Flut', 'Heuschrecken', 'Meteor', 'Seuche', 'Strahlung', 'Sandsturm', 'Erdloch', 'Gewitter', 'Tornado', 'Vulkan', 'Waldbrand'];
//   function viewApocalypse(root) {
//     var wrap = el('div', null, { 'class': 'tool-form' });
//     var hp = 100, active = null, over = false, survived = 0, timer = null;
//     var msg = el('p', 'Apokalypse bereit. Starte und suche bei Katastrophen Schutz!', { 'class': 'meta' });
//     var bar = el('p', 'HP: 100 · Überlebt: 0', { 'class': 'meta' });
//     var shelter = btn('Schutz suchen', function () {
//       if (!active || over) return;
//       hp = Math.min(100, hp + 15); // shelter halves next tick via flag
//       active.sheltered = true;
//       msg.textContent = 'Du suchst Schutz vor ' + active.name + '!';
//     });
//     wrap.appendChild(bar); wrap.appendChild(msg); wrap.appendChild(shelter);
//     wrap.appendChild(btn('Apokalypse starten', function () {
//       clearInterval(timer); hp = 100; survived = 0; over = false;
//       timer = setInterval(function () {
//         if (!document.body.contains(wrap) || over) { clearInterval(timer); return; }
//         if (!active) {
//           active = { name: DISASTERS[Math.floor(Math.random() * DISASTERS.length)], ticks: 3, sheltered: false };
//           msg.textContent = active.name + '! Such Schutz!';
//         } else {
//           var dmg = active.sheltered ? 5 : 15 + Math.floor(Math.random() * 10);
//           hp -= dmg; active.sheltered = false;
//           if (--active.ticks <= 0) { survived++; active = null; }
//           if (hp <= 0) {
//             hp = 0; over = true;
//             var best = Math.max(store('apoc-best', 0), survived); save('apoc-best', best);
//             msg.textContent = 'Du bist umgekommen. Überlebt: ' + survived + ' · Rekord: ' + best;
//           } else msg.textContent = (active ? active.name + ' wütet! (-' + dmg + ' HP)' : 'Ruhig…');
//         }
//         bar.textContent = 'HP: ' + hp + ' · Überlebt: ' + survived;
//       }, 1200);
//     }));
//     root.appendChild(wrap);
//   }
//
//   // Hearthrift: daily reward streaks + PvP rewards.
//   function viewHearth(root) {
//     var wrap = el('div'); root.appendChild(wrap);
//     function render() {
//       wrap.innerHTML = '';
//       var d = store('hearth', { streak: 0, last: '', pvp: 0 });
//       var today = new Date().toISOString().slice(0, 10);
//       var yest = new Date(Date.now() - 864e5).toISOString().slice(0, 10);
//       wrap.appendChild(el('p', 'Streak: ' + d.streak + ' Tage · PvP-Siege: ' + d.pvp, { 'class': 'meta' }));
//       var can = d.last !== today;
//       var claim = btn(can ? 'Tagesbelohnung abholen' : 'Heute schon abgeholt', function () {
//         var dd = store('hearth', { streak: 0, last: '', pvp: 0 });
//         if (dd.last === today) return;
//         dd.streak = (dd.last === yest) ? dd.streak + 1 : 1;
//         dd.last = today; save('hearth', dd); render();
//       });
//       claim.disabled = !can;
//       wrap.appendChild(claim);
//       wrap.appendChild(btn('PvP-Sieg eintragen', function () {
//         var dd = store('hearth', { streak: 0, last: '', pvp: 0 });
//         dd.pvp++; save('hearth', dd); render();
//       }));
//       var bonus = 10 + Math.min(d.streak, 7) * 5 + d.pvp * 2;
//       wrap.appendChild(el('p', 'Bonus: +' + bonus + ' Münzen (Streak + PvP).', { 'class': 'meta' }));
//     }
//     render();
//   }
//
//   // RealmOfWonders: PlayerStats + achievements.
//   var ACH = ['Erster Beitritt', '10 Kills', '5 Tode überlebt', 'Reisender (3 Welten)'];
//   function viewRealms(root) {
//     var wrap = el('div', null, { 'class': 'tool-form' }); root.appendChild(wrap);
//     function render() {
//       wrap.innerHTML = '';
//       var s = store('realms', { kills: 0, deaths: 0, worlds: 1, ach: [] });
//       var lvl = 1 + Math.floor(s.kills / 5);
//       wrap.appendChild(el('p', 'Level ' + lvl + ' · Kills ' + s.kills + ' · Deaths ' + s.deaths + ' · Welten ' + s.worlds, { 'class': 'meta' }));
//       ACH.forEach(function (a) {
//         var got = s.ach.indexOf(a) >= 0;
//         var row = btn((got ? '✓ ' : '+ ') + a, function () {
//           var d = store('realms', { kills: 0, deaths: 0, worlds: 1, ach: [] });
//           if (a === '10 Kills') d.kills += 10; else if (a === '5 Tode überlebt') d.deaths += 5;
//           else if (a === 'Reisender (3 Welten)') d.worlds = 3;
//           if (d.ach.indexOf(a) < 0) d.ach.push(a);
//           save('realms', d); render();
//         });
//         wrap.appendChild(row);
//       });
//       wrap.appendChild(btn('Reset', function () { save('realms', { kills: 0, deaths: 0, worlds: 1, ach: [] }); render(); }));
//     }
//     render();
//   }
//
//   // Challenges: timed challenge runner (codingarea-style).
//   var CHALLENGES = ['Kein Springen', 'Kein Schaden', 'Nur Holzwerkzeuge', 'Speedrun 60s', 'Kein Sprint'];
//   function viewChall(root) {
//     var wrap = el('div', null, { 'class': 'tool-form' });
//     var msg = el('p', 'Wähle eine Challenge und halte durch!', { 'class': 'meta' });
//     var log = el('pre', '', { 'class': 'result' });
//     wrap.appendChild(msg);
//     CHALLENGES.forEach(function (c) {
//       wrap.appendChild(btn(c + ' starten', function () {
//         var t = 60, done = 0;
//         msg.textContent = c + ' läuft: 60s durchhalten!';
//         var timer = setInterval(function () {
//           if (!document.body.contains(wrap)) { clearInterval(timer); return; }
//           if (--t <= 0) {
//             clearInterval(timer); done++;
//             log.textContent += 'GESCHAFFT: ' + c + '\n';
//             msg.textContent = 'Challenge geschafft! (' + done + ' heute)';
//           } else msg.textContent = c + ' läuft: noch ' + t + 's';
//         }, 1000);
//       }));
//     });
//     wrap.appendChild(log); root.appendChild(wrap);
//   }
//
//   // Streuland: invite-code signup flow (create/validate/redeem).
//   function viewStreuland(root) {
//     var wrap = el('div', null, { 'class': 'tool-form' }); root.appendChild(wrap);
//     function render() {
//       wrap.innerHTML = '';
//       var d = store('streuland', { codes: {}, users: [] });
//       wrap.appendChild(el('h3', 'Einladungen (' + Object.keys(d.codes).length + ')'));
//       wrap.appendChild(btn('Code erzeugen', function () {
//         var dd = store('streuland', { codes: {}, users: [] });
//         var code = '';
//         for (var i = 0; i < 8; i++) code += 'ABCDEFGHJKMNPQRSTUVWXYZ23456789'[Math.floor(Math.random() * 32)];
//         dd.codes[code] = { used: false, created: Date.now() };
//         save('streuland', dd); render();
//       }));
//       var inp = el('input', null, { placeholder: 'CODE eingeben' });
//       var name = el('input', null, { placeholder: 'Benutzername' });
//       var msg = el('p', '', { 'class': 'meta' });
//       wrap.appendChild(inp); wrap.appendChild(name);
//       wrap.appendChild(btn('Registrieren', function () {
//         var dd = store('streuland', { codes: {}, users: [] });
//         var c = (inp.value || '').trim().toUpperCase();
//         if (!dd.codes[c]) { msg.textContent = 'Ungültiger Code.'; return; }
//         if (dd.codes[c].used) { msg.textContent = 'Code bereits verwendet.'; return; }
//         if (!name.value.trim()) { msg.textContent = 'Benutzernamen eingeben.'; return; }
//         dd.codes[c].used = true; dd.users.push(name.value.trim());
//         save('streuland', dd); msg.textContent = 'Willkommen, ' + name.value.trim() + '!';
//         render(); wrap.appendChild(msg);
//       }));
//       wrap.appendChild(msg);
//       wrap.appendChild(el('p', d.users.length ? 'Registriert: ' + d.users.join(', ') : 'Noch niemand registriert.', { 'class': 'meta' }));
//     }
//     render();
//   }
//
//   return {
//     viewFortune: viewFortune, viewApocalypse: viewApocalypse, viewHearth: viewHearth,
//     viewRealms: viewRealms, viewChall: viewChall, viewStreuland: viewStreuland
//   };
// })();
//
