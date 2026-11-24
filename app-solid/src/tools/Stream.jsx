/* Stream Studio — Twitch-artiges lokales Streaming (Solid-Port von app/stream.js). */
import { createSignal, onCleanup } from "solid-js";
import { storeGet, storeSet, esc } from "../store.js";

const P = "d5stream_";
function sload(k, d) {
  try { const v = JSON.parse(localStorage.getItem(P + k)); return v == null ? d : v; }
  catch { return d; }
}
function ssave(k, v) {
  try { localStorage.setItem(P + k, JSON.stringify(v)); return true; }
  catch { return false; }
}
function sid() { return "st" + Date.now().toString(36) + Math.floor(Math.random() * 1296).toString(36); }
function gme() { try { return sessionStorage.getItem("d5:session") || ""; } catch { return ""; } }
function nameColor(n) {
  let h = 0;
  for (let i = 0; i < n.length; i++) h = ((h * 31) + n.charCodeAt(i)) >>> 0;
  return "hsl(" + (h % 360) + ",70%,45%)";
}
const EMOTES = {
  Kappa: "😎", PogChamp: "😲", LUL: "😂", KEKW: "🤣", FeelsGoodMan: "🐸👍",
  FeelsBadMan: "🐸👎", MonkaS: "😰", PepeHands: "😭", HYPE: "🎉", F: "🇫",
  EZ: "😏", GG: "🤝", RIP: "⚰️", POGGERS: "🤩"
};
function emoteify(html) {
  return String(html).split(/(<[^>]*>)/g).map((part, i) => {
    if (i % 2 === 1) return part;
    Object.keys(EMOTES).forEach((code) => { part = part.split(code).join(EMOTES[code]); });
    return part;
  }).join("");
}
function vipOf(nm) { return sload("vips", []).indexOf(nm) >= 0; }
function chatLevel(nm) {
  const c = (sload("counts", {})[nm] || 0);
  if (c >= 200) return ' <span class="badge">👑 Stammgast</span>';
  if (c >= 50) return ' <span class="badge">💎 aktiv</span>';
  if (c >= 10) return ' <span class="badge">⭐ bekannt</span>';
  return '';
}
function chatLine(m) {
  return "<button type=\"button\" data-ucc=\"" + esc(m.name) + "\" style=\"background:none;border:none;padding:0;cursor:pointer;color:" + nameColor(m.name) + ";font-weight:bold\">" + esc(m.name) + "</button>" +
    (m.mod ? " <span class=\"badge\">mod</span>" : "") +
    (vipOf(m.name) ? " <span class=\"badge\">💠</span>" : "") + chatLevel(m.name) +
    " <span class=\"meta\">" + esc(new Date(m.ts).toLocaleTimeString()) + "</span><br>" +
    emoteify(esc(m.text));
}

export function ViewStream() {
  const [chan, setChan] = createSignal(sload("chan", { title: "d5 Live", category: "Just Chatting" }));
  const [live, setLive] = createSignal(sload("live", { on: false, startedAt: 0 }));
  const [tick, setTick] = createSignal(0);
  const [chatName, setChatName] = createSignal(gme());
  const [chatMsg, setChatMsg] = createSignal("");
  const [audioOnly, setAudioOnly] = createSignal(false);
  const [camOn, setCamOn] = createSignal(false);
  const [recLabel, setRecLabel] = createSignal("");
  const [out, setOut] = createSignal("");
  const [schedName, setSchedName] = createSignal("");
  const [schedCat, setSchedCat] = createSignal("");
  const [schedAt, setSchedAt] = createSignal("");
  const [selUser, setSelUser] = createSignal(null);
  const [chatFind, setChatFind] = createSignal("");
  const [termIn, setTermIn] = createSignal("");
  const [upSec, setUpSec] = createSignal(0);
  let videoRef, chatBoxRef;
  let stream = null, rec = null, recChunks = [], recMime = "video/webm", recStart = 0, recTimer = null;
  let upTimer = null, earnTimer = null;
  const me = gme();
  const lastSent = {};
  function bump() { setTick((t) => t + 1); }
  function persistLive(v) { try { storeSet("live", v); } catch { /* ignore */ } }
  // Views zaehlen (echte lokale Kanalaufrufe)
  try {
    const vv = parseInt(localStorage.getItem(P + "views") || "0", 10) || 0;
    localStorage.setItem(P + "views", JSON.stringify(vv + 1));
  } catch { /* ignore */ }
  function views() { tick(); return sload("views", 0); }
  function stats() { tick(); return sload("stats", { streams: 0, liveMinutes: 0, chats: 0 }); }
  function chat() { tick(); const v = sload("chat", []); return Array.isArray(v) ? v : []; }
  function vods() { tick(); const v = sload("vods", []); return Array.isArray(v) ? v : []; }
  function sched() { tick(); const v = sload("sched", []); return Array.isArray(v) ? v : []; }
  function hasCam() {
    return !!(navigator.mediaDevices && navigator.mediaDevices.getUserMedia && typeof MediaRecorder !== "undefined");
  }
  function stopTracks() {
    if (stream) { stream.getTracks().forEach((t) => t.stop()); stream = null; }
    if (videoRef) { try { videoRef.srcObject = null; } catch { /* ignore */ } }
    setCamOn(false);
  }
  onCleanup(() => {
    if (upTimer) clearInterval(upTimer);
    if (earnTimer) clearInterval(earnTimer);
    if (recTimer) clearInterval(recTimer);
    try { if (rec) rec.stop(); } catch { /* ignore */ }
    stopTracks();
  });
  function armUptime() {
    if (upTimer) { clearInterval(upTimer); upTimer = null; }
    if (!live().on) return;
    setUpSec(Math.floor((Date.now() - live().startedAt) / 1000));
    upTimer = setInterval(() => {
      if (!live().on) { clearInterval(upTimer); upTimer = null; return; }
      setUpSec(Math.floor((Date.now() - live().startedAt) / 1000));
      checkExpiry();
    }, 1000);
  }
  armUptime();
  earnTimer = setInterval(() => { const nm = myName(); if (nm) { addPoints(nm, 10); bump(); } }, 60000);
  // ---- Tiefe: Follows, Punkte, AutoMod, VIPs, Usercards, Hype ----
  function myName() { return (chatName().trim() || me || "Gast").slice(0, 30); }
  function followers() { tick(); const v = sload("streamfollows", []); return Array.isArray(v) ? v : []; }
  function addPoints(nm, n) { const p = sload("points", {}); p[nm] = Math.max(0, (p[nm] || 0) + n); ssave("points", p); return p[nm]; }
  function isVip(nm) { return sload("vips", []).indexOf(nm) >= 0; }
  function levelBadge(nm) {
    const c = (sload("counts", {})[nm] || 0);
    if (c >= 200) return ' <span class="badge">👑 Stammgast</span>';
    if (c >= 50) return ' <span class="badge">💎 aktiv</span>';
    if (c >= 10) return ' <span class="badge">⭐ bekannt</span>';
    return '';
  }
  let hype = null;
  const hypeWin = [];
  function hypeHit() {
    const now = Date.now();
    while (hypeWin.length && now - hypeWin[0] > 60000) hypeWin.shift();
    hypeWin.push(now);
    if (hype && now > hype.until) hype = null;
    if (!hype && hypeWin.length >= 10) {
      hype = { level: 1, until: now + 300000 };
      botSay("🚂 HYPE-ZUG Level 1! Weiter chatten für Level 2!");
      return;
    }
    if (hype && hype.level < 5 && hypeWin.length >= (hype.level + 1) * 15) {
      hype.level++;
      hype.until = now + 300000;
      botSay("🚂 HYPE-ZUG Level " + hype.level + "!");
    }
  }
  function toggleFollow() {
    const nm = myName();
    if (!nm) return;
    const f = followers().slice();
    const i = f.indexOf(nm);
    if (i >= 0) f.splice(i, 1); else f.push(nm);
    ssave("streamfollows", f);
    setOut(i >= 0 ? "Entfolgt." : "Du folgst dem Kanal. 🎉");
    bump();
  }
  function myPoints() { tick(); return (sload("points", {})[myName()] || 0); }
  function holdList() { tick(); const v = sload("holds", []); return Array.isArray(v) ? v : []; }
  function modTerms() { tick(); const v = sload("automod", []); return Array.isArray(v) ? v : []; }
  function saveVod(blob, title, durSec, markers) {
    if (!blob || !blob.size) { setOut("Leere Aufnahme, nichts gespeichert."); return; }
    if (blob.size > 8000000) {
      setOut("VOD zu groß für localStorage (" + Math.round(blob.size / 1048576) + " MB) — verworfen.");
      return;
    }
    const fr = new FileReader();
    fr.onload = () => {
      const v = vods();
      v.unshift({ id: sid(), title, ts: Date.now(), dur: durSec || 0, src: String(fr.result), markers: markers || [] });
      if (!ssave("vods", v.slice(0, 10))) setOut("Speicher voll — VOD verworfen.");
      else { setOut("VOD gespeichert."); bump(); }
    };
    fr.readAsDataURL(blob);
  }
  function startRec() {
    recChunks = [];
    try { rec = new MediaRecorder(stream); recMime = rec.mimeType || "video/webm"; }
    catch { rec = null; return false; }
    recStart = Date.now();
    rec.ondataavailable = (ev) => { if (ev.data && ev.data.size) recChunks.push(ev.data); };
    try { rec.start(1000); } catch { rec = null; return false; }
    return true;
  }
  function stopRec() {
    if (!rec) return null;
    const dur = Math.round((Date.now() - recStart) / 1000);
    try { rec.stop(); } catch { /* ignore */ }
    const chunks = recChunks; rec = null;
    if (!chunks.length) return null;
    return { blob: new Blob(chunks, { type: recMime }), dur };
  }
  async function ensureStream() {
    if (stream) return true;
    if (!hasCam()) { setOut("Kamera/Mikrofon werden von diesem Browser nicht unterstützt."); return false; }
    try {
      stream = await navigator.mediaDevices.getUserMedia(audioOnly() ? { audio: true } : { video: true, audio: true });
      if (videoRef) { try { videoRef.srcObject = stream; videoRef.play(); } catch { /* ignore */ } }
      setCamOn(true);
      return true;
    } catch { setOut("Kamera/Mikrofon verweigert oder nicht verfügbar."); return false; }
  }
  function toggleCam() {
    if (stream) {
      stopTracks();
      setOut("Vorschau aus.");
      return;
    }
    ensureStream().then((ok) => { if (ok) setOut(audioOnly() ? "Mikrofon aktiv (nur Audio)." : "Vorschau aktiv."); });
  }
  function toggleLive() {
    if (live().on) {
      const mins = Math.round((Date.now() - live().startedAt) / 60000);
      const st = stats();
      st.liveMinutes += mins;
      ssave("stats", st);
      const fin = stopRec();
      const nl = { on: false, startedAt: 0 };
      setLive(nl); persistLive(nl);
      stopTracks();
      const mks = sload("streammarkers", []);
      ssave("streammarkers", []);
      if (fin) saveVod(fin.blob, chan().title + " (VOD)", fin.dur, mks);
      else setOut("Stream beendet (keine Aufnahme).");
      bump();
      return;
    }
    ensureStream().then((ok) => {
      if (!ok) return;
      const nl = { on: true, startedAt: Date.now() };
      setLive(nl); persistLive(nl);
      ssave("streammarkers", []);
      const st = stats();
      st.streams++;
      ssave("stats", st);
      if (!startRec()) setOut("Live! (Aufnahme fehlgeschlagen — kein VOD.)");
      else setOut("Live! Aufnahme läuft.");
      armUptime();
      bump();
    });
  }
  function takeClip() {
    if (!stream) { setOut("Erst Kamera starten, dann Clip aufnehmen."); return; }
    let r;
    const chunks = [];
    try { r = new MediaRecorder(stream); } catch { setOut("Clip fehlgeschlagen."); return; }
    r.ondataavailable = (ev) => { if (ev.data && ev.data.size) chunks.push(ev.data); };
    r.onstop = () => {
      if (!chunks.length) { setOut("Clip leer."); return; }
      saveVod(new Blob(chunks, { type: r.mimeType || "video/webm" }), chan().title + " (Clip)", 30);
    };
    try { r.start(1000); } catch { setOut("Clip fehlgeschlagen."); return; }
    setOut("Clip läuft (30s)…");
    setTimeout(() => { try { r.stop(); } catch { /* ignore */ } }, 30000);
  }
  function owner() { return me; }
  function isMod(nm) {
    if (nm && nm === owner() && owner() !== "") return true;
    return sload("mods", []).indexOf(nm) >= 0;
  }
  function botSay(text) {
    const c = sload("chat", []);
    c.push({ id: sid(), name: "Nachtbot", text, ts: Date.now(), mod: true });
    ssave("chat", c.slice(-150));
    const st = stats();
    st.chats++;
    ssave("stats", st);
    bump();
  }
  function pushChat(nm, text, mod) {
    const c = sload("chat", []);
    c.push({ id: sid(), name: nm, text: text.slice(0, 500), ts: Date.now(), mod: !!mod });
    ssave("chat", c.slice(-150));
    const st = stats();
    st.chats++;
    ssave("stats", st);
    const counts = sload("counts", {});
    counts[nm] = (counts[nm] || 0) + 1;
    ssave("counts", counts);
    addPoints(nm, 2);
    hypeHit();
    bump();
  }
  function handleCmd(nm, raw, mod) {
    const parts = raw.trim().split(/\s+/);
    const cmd = (parts[0] || "").toLowerCase();
    const rest = raw.slice(parts[0].length).trim();
    const needMod = ["/slow", "/slowoff", "/ban", "/unban", "/timeout", "/mod", "/unmod", "/title", "/category", "/vip", "/unvip", "/predict", "/resolve", "/refund", "/poll", "/endpoll", "/marker"].indexOf(cmd) >= 0;
    if (needMod && !mod) { setOut("Nur für Mods."); return true; }
    if (cmd === "/slow") {
      const n = parseInt(parts[1], 10);
      if (!n || n < 1 || n > 300) { setOut("/slow <Sekunden 1-300>"); return true; }
      ssave("slow", n); botSay("Langsamer Modus: " + n + "s (von " + nm + ")");
      return true;
    }
    if (cmd === "/slowoff") { ssave("slow", 0); botSay("Langsamer Modus aus."); return true; }
    if (cmd === "/ban" || cmd === "/timeout") {
      const target = parts[1];
      if (!target) { setOut(cmd + " <Name> [Minuten]"); return true; }
      const mins = cmd === "/ban" ? 0 : (parseInt(parts[2], 10) || 10);
      const bans = sload("bans", []).filter((b) => b.name !== target);
      bans.push({ name: target, until: mins === 0 ? 0 : Date.now() + mins * 60000 });
      ssave("bans", bans);
      botSay(target + (mins === 0 ? " wurde gebannt." : " Timeout für " + mins + " Min."));
      return true;
    }
    if (cmd === "/unban") {
      ssave("bans", sload("bans", []).filter((b) => b.name !== parts[1]));
      botSay(parts[1] + " entbannt.");
      return true;
    }
    if (cmd === "/mod" || cmd === "/unmod") {
      if (nm !== owner() || owner() === "") { setOut("Nur für den Kanalbesitzer (Login Demo)."); return true; }
      let mods = sload("mods", []);
      if (cmd === "/mod") { if (parts[1] && mods.indexOf(parts[1]) < 0) mods.push(parts[1]); }
      else mods = mods.filter((m) => m !== parts[1]);
      ssave("mods", mods);
      botSay(parts[1] + (cmd === "/mod" ? " ist jetzt Mod." : " ist kein Mod mehr."));
      return true;
    }
    if (cmd === "/title") {
      if (!rest) { setOut("/title <Text>"); return true; }
      const nc = { ...chan(), title: rest.slice(0, 80) };
      setChan(nc); ssave("chan", nc);
      botSay("Titel: " + nc.title);
      return true;
    }
    if (cmd === "/category") {
      if (!rest) { setOut("/category <Text>"); return true; }
      const nc = { ...chan(), category: rest.slice(0, 40) };
      setChan(nc); ssave("chan", nc);
      botSay("Kategorie: " + nc.category);
      return true;
    }
    if (cmd === "!uptime") {
      botSay(live().on
        ? "Live seit " + Math.floor((Date.now() - live().startedAt) / 60000) + " Min — " + chan().title
        : "Gerade offline. Nächster Stream: siehe Planung.");
      return true;
    }
    if (cmd === "!title") { botSay(chan().title + " · " + chan().category); return true; }
    if (cmd === "!so") {
      if (!rest) { setOut("!so <Name>"); return true; }
      botSay("Schaut bei " + rest.slice(0, 40) + " vorbei! 🎉");
      return true;
    }
    if (cmd === "!clip") {
      if (!stream) { botSay("Kein aktiver Stream für Clips."); return true; }
      botSay("Clip läuft (30s)…");
      takeClip();
      return true;
    }
    if (cmd === "/vip" || cmd === "/unvip") {
      if (nm !== owner() || owner() === "") { setOut("Nur für den Kanalbesitzer (Login Demo)."); return true; }
      let vips = sload("vips", []);
      if (cmd === "/vip") { if (parts[1] && vips.indexOf(parts[1]) < 0) vips.push(parts[1]); }
      else vips = vips.filter((m) => m !== parts[1]);
      ssave("vips", vips);
      botSay(parts[1] + (cmd === "/vip" ? " ist jetzt VIP. 💠" : " ist kein VIP mehr."));
      return true;
    }
    if (cmd === "!points") {
      botSay(nm + ": " + ((sload("points", {})[nm]) || 0) + " Punkte. (+2 pro Nachricht, +10 pro Minute)");
      return true;
    }
    if (cmd === "/redeem") {
      const rw = (parts[1] || "").toLowerCase();
      if (rw === "highlight") {
        const bal = (sload("points", {})[nm]) || 0;
        if (bal < 50) { setOut("Braucht 50 Punkte (du hast " + bal + ")."); return true; }
        addPoints(nm, -50);
        const cc = sload("chat", []);
        const mine2 = cc.filter((m) => m.name === nm);
        if (mine2.length) { ssave("hl", mine2[mine2.length - 1].id); botSay(nm + " hebt eine Nachricht hervor. ✨"); }
        else botSay("Schreib erst eine Nachricht, dann /redeem highlight.");
        return true;
      }
      if (rw === "slowmo") {
        const bal = (sload("points", {})[nm]) || 0;
        if (bal < 200) { setOut("Braucht 200 Punkte (du hast " + bal + ")."); return true; }
        addPoints(nm, -200);
        const prevSlow = sload("slow", 0);
        ssave("slow", 15);
        botSay(nm + " löst Slow-Mo (15s) für 60 Sekunden aus! 🐌");
        setTimeout(() => { ssave("slow", prevSlow); }, 60000);
        return true;
      }
      setOut("/redeem highlight (50) | slowmo (200)");
      return true;
    }
    if (cmd === "/predict") {
      if (!mod) { setOut("Nur für Mods."); return true; }
      const pm = raw.match(/^\/predict\s+"([^"]+)"\s+"([^"]+)"\s+"([^"]+)"(?:\s+(\d+))?/);
      if (!pm) { setOut('/predict "Frage" "A" "B" [Minuten 1-5]'); return true; }
      const mins = Math.min(5, Math.max(1, parseInt(pm[4] || "2", 10) || 2));
      ssave("streampred", { id: sid(), q: pm[1].slice(0, 140), opts: [{ t: pm[2].slice(0, 60), pool: 0 }, { t: pm[3].slice(0, 60), pool: 0 }], bets: {}, endsAt: Date.now() + mins * 60000, by: nm, open: true });
      botSay("🔮 Vorhersage: " + pm[1] + " — 1) " + pm[2] + "  2) " + pm[3] + " — !bet <1|2> <Punkte> (" + mins + " Min)");
      return true;
    }
    if (cmd === "!bet") {
      const pred = sload("streampred", null);
      if (!pred || !pred.open) { setOut("Keine offene Vorhersage."); return true; }
      if (Date.now() > pred.endsAt) { closePred(); setOut("Vorhersage ist zu."); return true; }
      const oi = parseInt(parts[1], 10), amt = parseInt(parts[2], 10);
      if ((oi !== 1 && oi !== 2) || !amt || amt < 1) { setOut("!bet <1|2> <Punkte>"); return true; }
      const have = (sload("points", {})[nm]) || 0;
      if (have < amt) { setOut("Nur " + have + " Punkte."); return true; }
      if (pred.bets[nm]) { setOut("Du hast schon gesetzt."); return true; }
      addPoints(nm, -amt);
      pred.bets[nm] = { idx: oi - 1, amt };
      pred.opts[oi - 1].pool += amt;
      ssave("streampred", pred);
      botSay(nm + " setzt " + amt + " auf „" + pred.opts[oi - 1].t + "“.");
      return true;
    }
    if (cmd === "/resolve" || cmd === "/refund") {
      if (!mod) { setOut("Nur für Mods."); return true; }
      const pr = sload("streampred", null);
      if (!pr || !pr.open) { setOut("Keine offene Vorhersage."); return true; }
      const win = parseInt(parts[1], 10) - 1;
      const names = Object.keys(pr.bets);
      if (cmd === "/refund" || win < 0 || win > 1) {
        names.forEach((u) => addPoints(u, pr.bets[u].amt));
        botSay("Vorhersage abgebrochen — Einsätze zurück.");
      } else {
        let totWin = 0, totLose = 0;
        names.forEach((u) => { if (pr.bets[u].idx === win) totWin += pr.bets[u].amt; else totLose += pr.bets[u].amt; });
        names.forEach((u) => {
          if (pr.bets[u].idx === win) {
            const share = totWin ? Math.floor(pr.bets[u].amt / totWin * totLose) : 0;
            addPoints(u, pr.bets[u].amt + share);
          }
        });
        botSay("🏆 „" + pr.opts[win].t + "“ gewinnt! (" + pr.q + ")");
      }
      pr.open = false;
      ssave("streampred", pr);
      return true;
    }
    if (cmd === "/poll") {
      if (!mod) { setOut("Nur für Mods."); return true; }
      const plm = raw.match(/^\/poll\s+"([^"]+)"((?:\s+"[^"]+"){2,4})(?:\s+(\d+))?/);
      if (!plm) { setOut('/poll "Frage" "A" "B" ["C" "D"] [Sek 30-300]'); return true; }
      const popts = (plm[2].match(/"[^"]+"/g) || []).map((s) => s.slice(1, -1).slice(0, 60));
      if (popts.length < 2) { setOut("Mindestens 2 Optionen."); return true; }
      const psec = Math.min(300, Math.max(30, parseInt(plm[3] || "60", 10) || 60));
      ssave("streampoll", { id: sid(), q: plm[1].slice(0, 140), opts: popts.map((t) => ({ t, v: 0 })), voters: {}, endsAt: Date.now() + psec * 1000 });
      botSay("📊 Umfrage: " + plm[1] + " — abstimmen mit Klick (" + psec + "s)");
      return true;
    }
    if (cmd === "/endpoll") {
      if (!mod) { setOut("Nur für Mods."); return true; }
      closePoll(true);
      return true;
    }
    if (cmd === "/marker") {
      if (!mod) { setOut("Nur für Mods."); return true; }
      if (!live().on) { setOut("Nur live möglich."); return true; }
      const mk = sload("streammarkers", []);
      mk.push({ off: Math.round((Date.now() - live().startedAt) / 1000), note: rest.slice(0, 80) });
      ssave("streammarkers", mk);
      botSay("🔖 Marker gesetzt" + (rest ? ": " + rest.slice(0, 80) : "") + ".");
      return true;
    }
    if (raw[0] === "/") { setOut("Unbekannter Befehl: " + cmd); return true; }
    return false;
  }
  function closePred() {
    const pr = sload("streampred", null);
    if (!pr || !pr.open) return;
    Object.keys(pr.bets).forEach((u) => addPoints(u, pr.bets[u].amt));
    pr.open = false;
    ssave("streampred", pr);
    botSay("Vorhersage zu — Einsätze zurück.");
  }
  function closePoll(manual) {
    const po = sload("streampoll", null);
    if (!po) return;
    botSay("📊 Ergebnis (" + po.q + "): " + po.opts.map((o) => o.t + " " + o.v).join(" · "));
    ssave("streampoll", null);
  }
  function checkExpiry() {
    const pr = sload("streampred", null);
    if (pr && pr.open && Date.now() > pr.endsAt) closePred();
    const po = sload("streampoll", null);
    if (po && Date.now() > po.endsAt) closePoll(false);
  }
  function pred() { tick(); return sload("streampred", null); }
  function poll() { tick(); return sload("streampoll", null); }
  function holds() { tick(); const v = sload("holds", []); return Array.isArray(v) ? v : []; }
  function follows() { tick(); const v = sload("streamfollows", []); return Array.isArray(v) ? v : []; }
  const lastSent = {};
  function sendChat() {
    const nm = (chatName().trim() || me || "Gast").slice(0, 30);
    const txt = chatMsg().trim();
    if (!txt) return;
    const mod = isMod(nm);
    if (txt.length > 500) { setOut("Maximal 500 Zeichen."); return; }
    if (handleCmd(nm, txt, mod)) { setChatMsg(""); return; }
    const ban = sload("bans", []).find((b) => b.name === nm);
    if (ban && (ban.until === 0 || ban.until > Date.now())) {
      setOut(ban.until === 0 ? "Du bist gebannt." : "Timeoutet bis " + new Date(ban.until).toLocaleTimeString() + ".");
      return;
    }
    const slow = sload("slow", 0);
    if (slow > 0 && !mod && !isVip(nm)) {
      const last = lastSent[nm] || 0;
      if (Date.now() - last < slow * 1000) {
        setOut("Langsamer Modus: noch " + Math.ceil((slow * 1000 - (Date.now() - last)) / 1000) + "s warten.");
        return;
      }
      lastSent[nm] = Date.now();
    }
    if (sload("folonly", false) && !mod && !isVip(nm)) {
      if (followers().indexOf(nm) < 0) { setOut("Follower-Only-Chat: erst Kanal folgen (Button oben)."); return; }
    }
    const terms = sload("automod", []);
    const bad = !mod && !isVip(nm) && terms.find((t) => t && txt.toLowerCase().indexOf(t) >= 0);
    if (bad) {
      const holds = sload("holds", []);
      holds.push({ id: sid(), name: nm, text: txt.slice(0, 500), ts: Date.now() });
      ssave("holds", holds.slice(-50));
      setChatMsg("");
      setOut("AutoMod: Nachricht enthält „" + bad + "“ — zur Freigabe gehalten.");
      return;
    }
    pushChat(nm, txt, mod);
    setChatMsg("");
  }
  function fmtDur(s) {
    s = s | 0;
    const mm = Math.floor(s / 60), ss = s % 60;
    return mm + ":" + (ss < 10 ? "0" : "") + ss;
  }
  function uptime() {
    const sec = Math.floor((Date.now() - live().startedAt) / 1000);
    void upSec();
    const hh = Math.floor(sec / 3600), mm = Math.floor((sec % 3600) / 60), ss = sec % 60;
    return hh + ":" + (mm < 10 ? "0" : "") + mm + ":" + (ss < 10 ? "0" : "") + ss;
  }
  function setTitle(v) {
    const nc = { ...chan(), title: v.slice(0, 80) || "d5 Live" };
    setChan(nc); ssave("chan", nc); bump();
  }
  function setCategory(v) {
    const nc = { ...chan(), category: v.slice(0, 40) || "Just Chatting" };
    setChan(nc); ssave("chan", nc); bump();
  }
  const slow = () => sload("slow", 0);
  return (
    <div class="tool-form">
      <p><label>Titel <input value={chan().title} onInput={(e) => setTitle(e.target.value)} /></label>{" "}
        <label>Kategorie <input value={chan().category} onInput={(e) => setCategory(e.target.value)} /></label></p>
      <p class="meta">{live().on
        ? <><span class="badge">● LIVE</span> {chan().title} · {chan().category} · {uptime()}</>
        : <>Offline — {chan().title} · {chan().category}</>}</p>
      <p class="meta"><button type="button" onClick={toggleFollow}>
        {followers().indexOf(myName()) >= 0 ? "Entfolgen" : "Folgen"}</button>{" "}
        <span>{followers().length} Follower (lokal)</span> · <span>{myPoints()} Punkte</span>
        {hype ? <span> · 🚂 HYPE {hype.level}</span> : null}</p>
      <video ref={videoRef} width="480" muted playsInline style={{ "max-width": "100%", background: "#000" }}></video>
      <div>
        <button type="button" onClick={toggleCam}>{camOn() ? "Kamera aus" : "Kamera an"}</button>{" "}
        <label><input type="checkbox" checked={audioOnly()} onChange={(e) => setAudioOnly(e.target.checked)} /> Nur Audio</label>{" "}
        <button type="button" onClick={toggleLive}>{live().on ? "Stream beenden" : "Live gehen"}</button>{" "}
        <button type="button" onClick={takeClip}>Clip (30s)</button>
      </div>
      <div>{out()}</div>
      <h3>Chat</h3>
      <p class="meta">{slow() > 0 ? "Langsamer Modus: " + slow() + "s" : "Chat: Emotes mit Klick einfügen. Mod-Befehle: /slow /ban /timeout /mod /title — Bot: !uptime !so !clip"}{hype ? " · 🚂 HYPE " + hype.level : null}</p>
      <p><input value={chatFind()} onInput={(e) => setChatFind(e.target.value)} placeholder="Chat durchsuchen" /></p>
      <div style={{ "max-height": "320px", overflow: "auto" }} onClick={(ev) => {
        const b = ev.target && ev.target.closest ? ev.target.closest("[data-ucc]") : null;
        if (b) setSelUser(b.getAttribute("data-ucc"));
      }}>
        {(() => {
          const q = chatFind().trim().toLowerCase();
          const list = q ? chat().filter((m) => m.text.toLowerCase().indexOf(q) >= 0 || m.name.toLowerCase().indexOf(q) >= 0) : chat();
          const hl = sload("hl", null);
          return list.length === 0 ? <p class="meta">Noch keine Nachrichten. Schreib die erste!</p> :
            list.slice(-60).map((m) => hl && m.id === hl
              ? <div style={{ background: "#3a3000", "border-radius": "8px" }}><p innerHTML={chatLine(m)} /></div>
              : <p innerHTML={chatLine(m)} />);
        })()}
      </div>
      <div>
        <input value={chatName()} onInput={(e) => setChatName(e.target.value)} placeholder="Name" style={{ width: "110px" }} />{" "}
        <input value={chatMsg()} onInput={(e) => setChatMsg(e.target.value)}
          onKeyDown={(e) => { if (e.key === "Enter") sendChat(); }} placeholder="Nachricht (Enter = senden)" style={{ width: "220px" }} />{" "}
        <button type="button" onClick={sendChat}>Senden</button>
      </div>
      <div>
        {Object.keys(EMOTES).map((code) => (
          <><button type="button" title={code} onClick={() => {
            setChatMsg((m) => m + (m && !/\s$/.test(m) ? " " + code : code));
          }}>{EMOTES[code]} {code}</button>{" "}</>
        ))}
      </div>
      {(() => {
        const p = pred();
        if (!p || !p.open) return null;
        const left = Math.max(0, Math.round((p.endsAt - Date.now()) / 1000));
        return <div class="card"><p><strong>🔮 {p.q}</strong> <span class="meta">noch {left}s · {Object.keys(p.bets).length} Tipps</span></p>
          {p.opts.map((o, i) => <p>{i + 1}) {o.t} — Pool {o.pool}</p>)}
          <p class="meta">Tippen: !bet &lt;1|2&gt; &lt;Punkte&gt;</p></div>;
      })()}
      {(() => {
        const po = poll();
        if (!po) return null;
        if (Date.now() > po.endsAt) { closePoll(false); return null; }
        const left = Math.max(0, Math.round((po.endsAt - Date.now()) / 1000));
        const nm = myName();
        const voted = po.voters[nm];
        return <div class="card"><p><strong>📊 {po.q}</strong> <span class="meta">noch {left}s</span></p>
          {po.opts.map((o, i) => {
            const total = po.opts.reduce((a, x) => a + x.v, 0);
            const pct = total ? Math.round(o.v * 100 / total) : 0;
            return <p>{o.t} — {pct}% ({o.v}){voted == null ? <> <button type="button" onClick={() => {
              const all = sload("streampoll", null);
              if (!all || Date.now() > all.endsAt) return;
              if (all.voters[nm] != null) return;
              all.opts[i].v++; all.voters[nm] = i;
              ssave("streampoll", all); bump();
            }}>Stimmen</button></> : (voted === i ? " ◉" : "")}</p>;
          })}</div>;
      })()}
      <h3>Moderation</h3>
      <div>
        <input value={termIn()} onInput={(e) => setTermIn(e.target.value)} placeholder="Blockierter Begriff" />{" "}
        <button type="button" onClick={() => {
          const t = termIn().trim().toLowerCase().slice(0, 40);
          if (!t) return;
          const terms = sload("automod", []);
          if (terms.indexOf(t) < 0) terms.push(t);
          ssave("automod", terms); setTermIn(""); setOut("Begriff gesperrt: " + t); bump();
        }}>Wort sperren</button>{" "}
        <button type="button" onClick={() => {
          if (!isMod(myName())) { setOut("Nur für Mods."); return; }
          ssave("folonly", !sload("folonly", false)); bump();
        }}>Follower-Only: {sload("folonly", false) ? "an" : "aus"}</button>
      </div>
      <p class="meta">AutoMod-Begriffe: {modTerms().join(", ") || "keine"}</p>
      <div>{holdList().length === 0 ? <p class="meta">Freigabe-Queue leer.</p> :
        holdList().map((h) => <p><strong>{h.name}</strong>: {h.text}{" "}
          <button type="button" onClick={() => {
            const all = sload("holds", []);
            const it = all.find((x) => x.id === h.id);
            ssave("holds", all.filter((x) => x.id !== h.id));
            if (it) pushChat(it.name, it.text, isMod(it.name));
            bump();
          }}>OK</button>{" "}
          <button type="button" onClick={() => {
            ssave("holds", sload("holds", []).filter((x) => x.id !== h.id)); bump();
          }}>Weg</button></p>)}
      </div>
      {(() => {
        const nm = selUser();
        if (!nm) return null;
        const all = chat().filter((m) => m.name === nm);
        const isM = isMod(nm);
        const isV = vipOf(nm);
        const actor = myName();
        return <div class="card"><h3>{nm}</h3>
          <p class="meta">{all.length} Nachrichten · {(sload("points", {})[nm] || 0)} Punkte
            {isM ? " · Mod" : ""}{isV ? " · 💠 VIP" : ""}</p>
          <p class="meta">{all.slice(-3).map((m) => m.text.slice(0, 50)).join(" · ")}</p>
          <p><button type="button" onClick={() => {
            if (!isMod(actor)) { setOut("Nur für Mods."); return; }
            const bans = sload("bans", []).filter((b) => b.name !== nm);
            bans.push({ name: nm, until: Date.now() + 600000 });
            ssave("bans", bans);
            botSay(nm + " Timeout für 10 Min. (durch " + actor + ")");
          }}>Timeout 10m</button>{" "}
          <button type="button" onClick={() => {
            if (!isMod(actor)) { setOut("Nur für Mods."); return; }
            const bans = sload("bans", []).filter((b) => b.name !== nm);
            bans.push({ name: nm, until: 0 });
            ssave("bans", bans);
            botSay(nm + " wurde gebannt. (durch " + actor + ")");
          }}>Bann</button>{" "}
          <button type="button" onClick={() => {
            if (!isMod(actor)) { setOut("Nur für Mods."); return; }
            ssave("bans", sload("bans", []).filter((b) => b.name !== nm));
            botSay(nm + " entbannt.");
          }}>Entbannen</button>{" "}
          <button type="button" onClick={() => {
            if (actor !== owner() || owner() === "") { setOut("Nur für den Kanalbesitzer (Login Demo)."); return; }
            let vips = sload("vips", []);
            if (vips.indexOf(nm) >= 0) vips = vips.filter((x) => x !== nm); else vips.push(nm);
            ssave("vips", vips);
            botSay(nm + (vips.indexOf(nm) >= 0 ? " ist jetzt VIP. 💠" : " ist kein VIP mehr."));
          }}>VIP an/aus</button>{" "}
          <button type="button" onClick={() => {
            if (!isMod(actor)) { setOut("Nur für Mods."); return; }
            ssave("chat", sload("chat", []).filter((m) => m.name !== nm));
            botSay("Nachrichten von " + nm + " gelöscht.");
          }}>Nachrichten löschen</button>{" "}
          <button type="button" onClick={() => setSelUser(null)}>x</button></p>
        </div>;
      })()}
      <h3>Videos (VODs &amp; Clips)</h3>
      <div>
        {vods().length === 0 ? <p class="meta">Noch keine Videos. Beende einen Stream oder nimm einen Clip auf.</p> :
          vods().map((v) => (
            <article class="card">
              <h3>{v.title}</h3>
              <p class="meta">{new Date(v.ts).toLocaleString()} · {fmtDur(v.dur)} · {Math.round(String(v.src || "").length / 1024)} KB</p>
              <video controls width="320" id={"vod-" + v.id} src={v.src} style={{ "max-width": "100%" }}></video>
              {(v.markers || []).length > 0 ? <p class="meta">Kapitel:{" "}
                {(v.markers || []).map((m, i) => (
                  <><button type="button" onClick={() => {
                    const vid = document.getElementById("vod-" + v.id);
                    if (vid) { try { vid.currentTime = m.off || 0; vid.play(); } catch { /* ignore */ } }
                  }}>{fmtDur(m.off)} {(m.note || "Marker " + (i + 1))}</button>{" "}
                  </>
                ))}</p> : null}
              <p class="meta"><button type="button" onClick={() => {
                const a = document.createElement("a");
                a.href = v.src;
                a.download = (v.title || "clip").replace(/[^\w\-äöüÄÖÜß ]+/g, "").slice(0, 40) + ".webm";
                document.body.appendChild(a);
                try { a.click(); } catch { /* ignore */ }
                document.body.removeChild(a);
              }}>Download</button>{" "}
              <button type="button" onClick={() => {
                ssave("vods", vods().filter((x) => x.id !== v.id)); bump();
              }}>Löschen</button></p>
            </article>
          ))}
      </div>
      <h3>Streamplan</h3>
      <div>
        <input value={schedName()} onInput={(e) => setSchedName(e.target.value)} placeholder="Titel" />{" "}
        <input value={schedCat()} onInput={(e) => setSchedCat(e.target.value)} placeholder="Kategorie" />{" "}
        <input type="datetime-local" value={schedAt()} onInput={(e) => setSchedAt(e.target.value)} />{" "}
        <button type="button" onClick={() => {
          const when = new Date(schedAt()).getTime();
          if (!schedName().trim() || !when || when <= Date.now()) { setOut("Titel und Zukunfts-Zeitpunkt nötig."); return; }
          const all = sload("sched", []);
          all.push({ id: sid(), title: schedName().trim().slice(0, 80), category: schedCat().trim().slice(0, 40) || "Just Chatting", at: when });
          ssave("sched", all);
          setSchedName(""); setSchedCat("");
          setOut("Geplant."); bump();
        }}>Planen</button>
      </div>
      <div>
        {sched().length === 0 ? <p class="meta">Nichts geplant.</p> :
          sched().slice().sort((a, b) => a.at - b.at).map((s) => (
            <p><strong>{s.title}</strong> <span class="meta">{s.category} · {new Date(s.at).toLocaleString()}</span>{" "}
              <button type="button" onClick={() => {
                const nc = { title: s.title, category: s.category };
                setChan(nc); ssave("chan", nc);
                ssave("sched", sched().filter((x) => x.id !== s.id));
                setOut("Planung übernommen — jetzt „Live gehen“.");
                bump();
              }}>Jetzt starten</button>{" "}
              <button type="button" onClick={() => {
                ssave("sched", sched().filter((x) => x.id !== s.id)); bump();
              }}>x</button></p>
          ))}
      </div>
      <h3>Dashboard</h3>
      <p class="meta">Streams: {stats().streams} · Live-Minuten: {stats().liveMinutes} ·
        Kanalaufrufe: {views()} · Chatnachrichten: {stats().chats} · VODs: {vods().length}</p>
    </div>
  );
}
