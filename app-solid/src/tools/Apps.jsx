/* Guestbook / Signin / Shortener / Go — ported from app/apps.js. */
import { createSignal, onCleanup, createEffect } from "solid-js";
import { storeGet, storeSet, esc } from "../store.js";

export function bbcode(s) {
  return esc(s)
    .replace(/\[b\](.*?)\[\/b\]/g, "<strong>$1</strong>")
    .replace(/\[i\](.*?)\[\/i\]/g, "<em>$1</em>")
    .replace(/\[u\](.*?)\[\/u\]/g, "<u>$1</u>")
    .replace(/\[url\](.*?)\[\/url\]/g, '<a href="$1" target="_blank" rel="noopener">$1</a>')
    .replace(/\[img\](.*?)\[\/img\]/g, '<img src="$1" alt="User posted image" class="user-image">');
}

function gbId() { return "gb" + Date.now().toString(36) + Math.floor(Math.random() * 1296).toString(36); }
function gbHandle(n) { const h = String(n).toLowerCase().replace(/[^a-z0-9]+/g, "").slice(0, 15); return "@" + (h || "user"); }
function gbNorm(raw) {
  const now = Date.now();
  const e = {
    id: raw.id || gbId(),
    name: String(raw.name || "Anonym").slice(0, 40),
    message: String(raw.message || ""),
    date: raw.date || new Date(raw.ts || now).toLocaleString(),
    ts: raw.ts || now,
    likes: raw.likes | 0, liked: !!raw.liked,
    reposts: raw.reposts | 0, reposted: !!raw.reposted,
    views: raw.views | 0,
    replies: Array.isArray(raw.replies) ? raw.replies : []
  };
  e.handle = raw.handle || gbHandle(e.name);
  e.quoteId = raw.quoteId || null;
  e.threadId = raw.threadId || null;
  e.bookmarked = !!raw.bookmarked;
  e.pinned = !!raw.pinned;
  e.edited = !!raw.edited;
  e.editedAt = raw.editedAt || null;
  if (raw.poll && typeof raw.poll.q === "string" && Array.isArray(raw.poll.opts)) {
    e.poll = {
      q: raw.poll.q.slice(0, 140),
      opts: raw.poll.opts.slice(0, 4).map((o) => ({ t: String(o.t || "").slice(0, 60), v: Math.max(0, o.v | 0) })),
      voted: (typeof raw.poll.voted === "number" ? raw.poll.voted : -1)
    };
  } else e.poll = null;
  return e;
}
const GB_COLORS = ["#1d9bf0", "#e91e63", "#4caf50", "#ff9800", "#9c27b0", "#607d8b"];
function gbProfile() {
  const p = storeGet("gbprofile", {});
  const bio = p && typeof p.bio === "string" ? p.bio.slice(0, 160) : "";
  const color = p && GB_COLORS.indexOf(p.color) >= 0 ? p.color : "#1d9bf0";
  const banner = p && GB_COLORS.indexOf(p.banner) >= 0 ? p.banner : "#16181c";
  return { bio, color, banner };
}
function gbSuggest(list, me, follows, muted) {
  const score = {};
  list.forEach((e) => {
    if (e.name === me || follows.indexOf(e.name) >= 0 || muted.indexOf(e.name) >= 0) return;
    score[e.name] = (score[e.name] || 0) + 2 + e.likes + e.replies.length;
  });
  return Object.keys(score).sort((a, b) => score[b] - score[a]).slice(0, 3);
}
function gbPostUrl(id) {
  try {
    return String(window.location.href).split("#")[0] + "#/tool/guestbook/" + encodeURIComponent(id);
  } catch { return "#/tool/guestbook/" + id; }
}
function gbThreadInfo(list, en) {
  if (!en.threadId) return null;
  const sibs = list.filter((x) => x.threadId === en.threadId).slice().sort((a, b) => a.ts - b.ts);
  for (let i = 0; i < sibs.length; i++) if (sibs[i].id === en.id) return { i: i + 1, n: sibs.length };
  return { i: 1, n: sibs.length };
}
function gbFeedRead() {
  try { const v = JSON.parse(localStorage.getItem("d5_feed")); return Array.isArray(v) ? v : []; }
  catch { return []; }
}
function gbFeedWrite(feed) { localStorage.setItem("d5_feed", JSON.stringify(feed.slice(0, 50))); }
const GB_PAGE = 10;
function gbTags(text) {
  const tags = {};
  const re = /#([A-Za-z0-9_\u00e4\u00f6\u00fc\u00c4\u00d6\u00dc\u00df]{2,30})/g;
  let m;
  while ((m = re.exec(String(text)))) tags[m[1].toLowerCase()] = true;
  return Object.keys(tags);
}
function gbBody(message) {
  const html = bbcode(message);
  return String(html).split(/(<[^>]*>)/g).map((part, i) =>
    i % 2 === 1 ? part : part.replace(/#([A-Za-z0-9_\u00e4\u00f6\u00fc\u00c4\u00d6\u00dc\u00df]{2,30})/g,
      '<button type="button" data-tag="$1">#$1</button>')
  ).join("");
}
function gbLoad(key) {
  const v = storeGet(key, []);
  return Array.isArray(v) ? v : [];
}
function gbPushNotif(type, post, by) {
  if (!post || post.name === by) return;
  const notifs = gbLoad("gbnotifs");
  notifs.unshift({ id: gbId(), type, postId: post.id, by, ts: Date.now(), read: false });
  try { storeSet("gbnotifs", notifs.slice(0, 30)); } catch { /* ignore */ }
}

export function ViewGuestbook(props) {
  const hl = (props && props.arg) || null;
  const boot = storeGet("guestbook", []).map(gbNorm);
  const nowTs = Date.now();
  const dueSched = gbLoad("gbsched").filter((s) => s.postAt <= nowTs);
  if (dueSched.length) {
    try { storeSet("gbsched", gbLoad("gbsched").filter((s) => s.postAt > nowTs)); } catch { /* ignore */ }
    dueSched.sort((a, b) => a.postAt - b.postAt).forEach((s) => {
      const de = gbNorm({ name: s.name, message: s.message, date: new Date(s.postAt).toLocaleString(), ts: s.postAt });
      boot.unshift(de);
      try {
        const feed = gbFeedRead();
        feed.unshift({ text: de.name + ": " + (de.message.length > 140 ? de.message.slice(0, 139) + "…" : de.message), time: de.ts, id: "gb-" + de.id });
        gbFeedWrite(feed);
      } catch { /* ignore */ }
    });
  }
  boot.forEach((e) => { e.views++; });
  try { storeSet("guestbook", boot); } catch { /* ignore */ }
  const [entries, setEntries] = createSignal(boot);
  let me = "";
  try { me = sessionStorage.getItem("d5:session") || ""; } catch { /* ignore */ }
  const [name, setName] = createSignal(me);
  const [email, setEmail] = createSignal("");
  const [message, setMessage] = createSignal("");
  const [filter, setFilter] = createSignal("");
  const [sort, setSort] = createSignal("new");
  const [open, setOpen] = createSignal({});
  const [page, setPage] = createSignal(1);
  const [scope, setScope] = createSignal("all");
  const [profile, setProfile] = createSignal(null);
  const [follows, setFollows] = createSignal(gbLoad("gbfollows"));
  const [notifs, setNotifs] = createSignal(gbLoad("gbnotifs"));
  const [notifsOpen, setNotifsOpen] = createSignal(false);
  const [editing, setEditing] = createSignal(null);
  const [editText, setEditText] = createSignal("");
  const [muted, setMuted] = createSignal(gbLoad("gbmuted"));
  const [lists, setLists] = createSignal(gbLoad("gblists"));
  const [listsOpen, setListsOpen] = createSignal(false);
  const [newList, setNewList] = createSignal("");
  const [profileTab, setProfileTab] = createSignal("posts");
  const [schedAt, setSchedAt] = createSignal("");
  const [schedOpen, setSchedOpen] = createSignal(false);
  const [banner, setBanner] = createSignal(gbProfile().banner);
  const [draftRestored, setDraftRestored] = createSignal(false);
  const [out, setOut] = createSignal("");
  function actor() { return name().trim() || me || "Anonym"; }
  function reloadFollows() { setFollows(gbLoad("gbfollows")); }
  function reloadNotifs() { setNotifs(gbLoad("gbnotifs")); }
  function toggleFollow(nm) {
    const f = gbLoad("gbfollows");
    const i = f.indexOf(nm);
    if (i >= 0) f.splice(i, 1); else f.push(nm);
    try { storeSet("gbfollows", f); } catch { /* ignore */ }
    reloadFollows();
  }
  function markNotifsRead() {
    try { storeSet("gbnotifs", gbLoad("gbnotifs").map((n) => ({ ...n, read: true }))); } catch { /* ignore */ }
    reloadNotifs();
  }
  function unread() { return notifs().filter((n) => !n.read).length; }
  function trends() {
    const counts = {};
    entries().forEach((e) => gbTags(e.message).forEach((t) => { counts[t] = (counts[t] || 0) + 1; }));
    return Object.keys(counts).sort((a, b) => counts[b] - counts[a]).slice(0, 5).map((t) => ({ tag: t, n: counts[t] }));
  }
  function tagClick(ev) {
    const t = ev.target && ev.target.getAttribute ? ev.target.getAttribute("data-tag") : null;
    if (t) { setFilter("#" + t); setPage(1); }
  }
  let taRef;
  const toolbar = [["B", "[b]", "[/b]"], ["I", "[i]", "[/i]"], ["U", "[u]", "[/u]"], ["Link", "[url]", "[/url]"], ["Bild", "[img]", "[/img]"]];
  function save(next) { setEntries(next); try { storeSet("guestbook", next); } catch { /* ignore */ } }
  function insertTag(a, b) {
    if (!a) { setMessage((m) => m + "😊"); if (taRef) taRef.focus(); return; }
    setMessage((m) => {
      const s = taRef ? taRef.selectionStart || 0 : 0;
      const e2 = taRef ? taRef.selectionEnd || 0 : 0;
      return m.slice(0, s) + a + m.slice(s, e2) + b + m.slice(e2);
    });
    if (taRef) taRef.focus();
  }
  function stats() {
    const likes = entries().reduce((a, e) => a + e.likes, 0);
    const replies = entries().reduce((a, e) => a + e.replies.length, 0);
    return entries().length + " Posts · " + likes + " Likes · " + replies + " Antworten";
  }
  function visible() {
    if (hl) return entries().filter((e) => e.id === hl);
    const q = filter().trim().toLowerCase();
    const prof = profile();
    const v = entries().filter((e) => {
      if (muted().indexOf(e.name) >= 0) return false;
      if (prof && e.name !== prof) return false;
      if (prof && profileTab() === "media" && e.message.indexOf("[img]") < 0) return false;
      if (prof && profileTab() === "threads" && !e.threadId) return false;
      if (scope() === "following" && follows().indexOf(e.name) < 0) return false;
      if (scope() === "bookmarks" && !e.bookmarked) return false;
      if (scope().startsWith("list:")) {
        const li = lists().find((x) => x.id === scope().slice(5));
        if (!li || li.members.indexOf(e.name) < 0) return false;
      }
      if (!q) return true;
      if (q[0] === "#") return gbTags(e.message).indexOf(q.slice(1)) >= 0;
      return e.name.toLowerCase().includes(q) || e.message.toLowerCase().includes(q);
    });
    const s = v.slice().sort((a, b) => sort() === "top" ? (b.likes - a.likes) || (b.ts - a.ts) : b.ts - a.ts);
    if (prof && profileTab() === "posts") s.sort((a, b) => ((b.pinned ? 1 : 0) - (a.pinned ? 1 : 0)));
    return s;
  }
  function paged() {
    const v = visible();
    const pages = Math.max(1, Math.ceil(v.length / GB_PAGE));
    const p = Math.min(page(), pages);
    return { items: v.slice((p - 1) * GB_PAGE, p * GB_PAGE), page: p, pages, total: v.length };
  }
  const [mode, setMode] = createSignal("post");
  const [quote, setQuote] = createSignal(null);
  const [tparts, setTparts] = createSignal(["", ""]);
  const [pollQ, setPollQ] = createSignal("");
  const [pollOpts, setPollOpts] = createSignal(["", ""]);
  const [profOpen, setProfOpen] = createSignal(false);
  const prof0 = gbProfile();
  const [bio, setBio] = createSignal(prof0.bio);
  const [color, setColor] = createSignal(prof0.color);
  function avColor(nm) { return (me && nm === me) ? gbProfile().color : ""; }
  function validEmail(v) { return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(v); }
  function publishOne(fd, extra) {
    const base = { name: fd.name, message: fd.message, date: new Date().toLocaleString(), ts: Date.now() };
    if (extra) Object.assign(base, extra);
    const e = gbNorm(base);
    try {
      const feed = gbFeedRead();
      feed.unshift({ text: e.name + ": " + (e.message.length > 140 ? e.message.slice(0, 139) + "…" : e.message), time: e.ts, id: "gb-" + e.id });
      gbFeedWrite(feed);
    } catch { save([e, ...entries()]); setOut("Gespeichert (Home-Feed-Spiegel blockiert: Speicher voll oder privat)."); return null; }
    save([e, ...entries()]);
    setPage(1);
    return e;
  }
  function clearComposer() {
    setMessage(""); setPollQ(""); setPollOpts(["", ""]); setTparts(["", ""]); setQuote(null);
  }
  function send() {
    const fd = { name: name().trim(), email: email().trim(), message: message().trim() };
    if (mode() === "thread") {
      const parts = tparts().map((t) => t.trim()).filter(Boolean);
      if (!fd.name) { setOut("Bitte einen Namen eingeben."); return; }
      if (!validEmail(fd.email)) { setOut("Invalid email format."); return; }
      if (parts.length < 2) { setOut("Ein Thread braucht mindestens 2 ausgefüllte Teile."); return; }
      if (parts.some((t) => t.length < 10 || t.length > 1000)) { setOut("Jeder Thread-Teil muss 10–1000 Zeichen haben."); return; }
      const tid = gbId();
      parts.slice().reverse().forEach((t) => publishOne({ name: fd.name, message: t }, { threadId: tid }));
      clearComposer();
      setOut("Thread mit " + parts.length + " Teilen gespeichert.");
      return;
    }
    if (mode() === "poll") {
      const q = pollQ().trim();
      const opts = pollOpts().map((o) => o.trim()).filter(Boolean);
      if (!fd.name) { setOut("Bitte einen Namen eingeben."); return; }
      if (!validEmail(fd.email)) { setOut("Invalid email format."); return; }
      if (q.length < 4 || q.length > 140) { setOut("Frage muss 4–140 Zeichen haben."); return; }
      if (opts.length < 2) { setOut("Mindestens 2 Antwortoptionen nötig."); return; }
      const e = publishOne({ name: fd.name, message: fd.message || q }, {
        poll: { q, opts: opts.map((t) => ({ t, v: 0 })), voted: -1 }
      });
      if (e) { clearComposer(); setOut("Umfrage gespeichert."); }
      return;
    }
    if (fd.message.length < 10 || fd.message.length > 1000) {
      if (!fd.name) { setOut("Bitte einen Namen eingeben."); return; }
      if (!validEmail(fd.email)) { setOut("Invalid email format."); return; }
      setOut("Message must be between 10 and 1000 characters."); return;
    }
    if (!fd.name) { setOut("Bitte einen Namen eingeben."); return; }
    if (!validEmail(fd.email)) { setOut("Invalid email format."); return; }
    const extra = quote() ? { quoteId: quote() } : null;
    const one = publishOne({ name: fd.name, message: fd.message }, extra);
    if (one) {
      const qp = entries().find((x) => x.id === quote());
      if (qp) { gbPushNotif("repost", qp, actor()); reloadNotifs(); }
      clearComposer();
      setOut("Gespeichert.");
    }
  }
  function vote(id, idx) {
    const p = entries().find((x) => x.id === id);
    if (!p || !p.poll || p.poll.voted >= 0 || idx < 0 || idx >= p.poll.opts.length) return;
    save(entries().map((x) => x.id === id ? {
      ...x, poll: { ...x.poll, voted: idx, opts: x.poll.opts.map((o, i) => i === idx ? { ...o, v: o.v + 1 } : o) }
    } : x));
  }
  function toggleBm(id) {
    save(entries().map((x) => x.id === id ? { ...x, bookmarked: !x.bookmarked } : x));
  }
  function saveEdit(id) {
    const p = entries().find((x) => x.id === id);
    const txt = editText().trim();
    if (!p || txt.length < 10 || txt.length > 1000) { setOut("Message must be between 10 and 1000 characters."); return; }
    save(entries().map((x) => x.id === id ? { ...x, message: txt, edited: true, editedAt: Date.now() } : x));
    setEditing(null);
  }
  function togglePin(id) {
    save(entries().map((x) => ({ ...x, pinned: x.id === id ? !x.pinned : false })));
  }
  function muteAuthor(nm) {
    const m = gbLoad("gbmuted");
    if (m.indexOf(nm) < 0) m.push(nm);
    try { storeSet("gbmuted", m); } catch { /* ignore */ }
    setMuted(m);
  }
  function unmute(nm) {
    const m = gbLoad("gbmuted").filter((x) => x !== nm);
    try { storeSet("gbmuted", m); } catch { /* ignore */ }
    setMuted(m);
  }
  async function copyText(t, ok) {
    try {
      if (navigator.clipboard && navigator.clipboard.writeText) { await navigator.clipboard.writeText(t); setOut(ok || "Link kopiert."); return; }
      throw 0;
    } catch {
      const ta = document.createElement("textarea");
      ta.value = t; document.body.appendChild(ta); ta.select();
      try { document.execCommand("copy"); setOut(ok || "Link kopiert."); }
      catch { setOut("Kopieren fehlgeschlagen: " + t); }
      document.body.removeChild(ta);
    }
  }
  function sharePost(en) {
    const url = gbPostUrl(en.id);
    try {
      if (navigator.share) { navigator.share({ title: "d5 Guestbook", text: en.message.slice(0, 100), url }).catch(() => {}); return; }
    } catch { /* ignore */ }
    copyText(url, "Link kopiert (Teilen nicht verfügbar).");
  }
  function reloadLists() { setLists(gbLoad("gblists")); }
  function createList() {
    const nm = newList().trim().slice(0, 30);
    if (!nm) return;
    const all = gbLoad("gblists");
    all.push({ id: gbId(), name: nm, members: [] });
    try { storeSet("gblists", all); } catch { /* ignore */ }
    setNewList(""); reloadLists();
  }
  function saveDraft() {
    if (mode() !== "post") return;
    const d = { name: name(), email: email(), message: message() };
    try { storeSet("gbdraft", (d.name || d.email || d.message) ? d : null); } catch { /* ignore */ }
  }
  function pendSched() { return gbLoad("gbsched").slice().sort((a, b) => a.postAt - b.postAt); }
  function schedulePost() {
    if (mode() !== "post") { setOut("Planen geht nur im Post-Modus."); return; }
    const fd = { name: name().trim(), email: email().trim(), message: message().trim() };
    if (!fd.name) { setOut("Bitte einen Namen eingeben."); return; }
    if (!validEmail(fd.email)) { setOut("Invalid email format."); return; }
    if (fd.message.length < 10 || fd.message.length > 1000) { setOut("Message must be between 10 and 1000 characters."); return; }
    const when = new Date(schedAt()).getTime();
    if (!when || when <= Date.now()) { setOut("Bitte einen Zeitpunkt in der Zukunft wählen."); return; }
    const all = gbLoad("gbsched");
    all.push({ id: gbId(), name: fd.name, message: fd.message, postAt: when });
    try { storeSet("gbsched", all); } catch { /* ignore */ }
    setMessage(""); saveDraft();
    setOut("Geplant für " + new Date(when).toLocaleString() + ".");
  }
  if (!draftRestored()) {
    setDraftRestored(true);
    const d = storeGet("gbdraft", null);
    if (d && typeof d === "object" && !message() && !name()) {
      setName(d.name || ""); setEmail(d.email || ""); setMessage(d.message || "");
    }
  }
  function saveProfile() {
    try { storeSet("gbprofile", { bio: bio().trim().slice(0, 160), color: color(), banner: banner() }); } catch { /* ignore */ }
    setOut("Profil gespeichert.");
  }
  function quotedEntry() {
    return entries().find((x) => x.id === quote()) || null;
  }
  const [mainTab, setMainTab] = createSignal("time");
  const [dmConvo, setDmConvo] = createSignal(null);
  const [dmAsMe, setDmAsMe] = createSignal(true);
  const [dmReply, setDmReply] = createSignal(null);
  const [dmFind, setDmFind] = createSignal("");
  const [dmShowArch, setDmShowArch] = createSignal(false);
  const [dmNew, setDmNew] = createSignal("");
  const [dmText, setDmText] = createSignal("");
  const [dmTick, setDmTick] = createSignal(0);
  const [recLabel, setRecLabel] = createSignal("");
  let dmRec = null, dmRecChunks = [], dmRecTimer = null, dmRecStart = 0;
  function dmList() { dmTick(); const v = storeGet("gbdms", []); return Array.isArray(v) ? v : []; }
  function dmSave(c) { try { storeSet("gbdms", c); } catch { /* ignore */ } setDmTick((t) => t + 1); }
  function dmOpen(name) {
    const all = dmList();
    let c = all.find((x) => x.name === name);
    if (!c) { c = { id: gbId(), name, msgs: [], pinned: false, archived: false, created: Date.now() }; all.unshift(c); }
    dmSave(all);
    setDmConvo(c.id); setDmAsMe(true); setDmReply(null); setDmFind("");
    setMainTab("dm");
  }
  function dmPreview(m) {
    if (!m) return "Noch keine Nachrichten.";
    if (m.audio) return "🎤 Sprachnachricht (" + Math.round(m.dur || 0) + "s)";
    return m.text && m.text.length > 60 ? m.text.slice(0, 59) + "…" : (m.text || "");
  }
  function dmTicks(m) { return m.from === "me" ? "✓" : (m.read ? "✓✓" : "✓"); }
  function dmSend(id) {
    const all = dmList();
    const c = all.find((x) => x.id === id);
    const txt = dmText().trim();
    if (!c || !txt || txt.length > 2000) { setOut("Nachricht muss 1–2000 Zeichen haben."); return; }
    c.msgs.push({ id: gbId(), from: dmAsMe() ? "me" : c.name, text: txt, ts: Date.now(), read: dmAsMe(), replyTo: dmReply() });
    setDmReply(null); setDmText("");
    dmSave(all);
  }
  function dmToggleRec(id) {
    if (dmRec) { try { dmRec.stop(); } catch { /* ignore */ } return; }
    if (!navigator.mediaDevices || !navigator.mediaDevices.getUserMedia || typeof MediaRecorder === "undefined") {
      setOut("Sprachnachrichten werden von diesem Browser nicht unterstützt."); return;
    }
    navigator.mediaDevices.getUserMedia({ audio: true }).then((stream) => {
      dmRecChunks = [];
      try { dmRec = new MediaRecorder(stream); }
      catch { stream.getTracks().forEach((t) => t.stop()); setOut("Aufnahme fehlgeschlagen."); return; }
      dmRecStart = Date.now();
      dmRec.ondataavailable = (ev) => { if (ev.data && ev.data.size) dmRecChunks.push(ev.data); };
      dmRec.onstop = () => {
        stream.getTracks().forEach((t) => t.stop());
        if (dmRecTimer) { clearInterval(dmRecTimer); dmRecTimer = null; }
        const dur = Math.round((Date.now() - dmRecStart) / 1000);
        const mime = (dmRec && dmRec.mimeType) || "audio/webm";
        dmRec = null;
        setRecLabel("");
        if (!dmRecChunks.length || dur < 1) return;
        const blob = new Blob(dmRecChunks, { type: mime });
        if (blob.size > 1500000) { setOut("Zu lang — Sprachnachrichten sind auf ~60s begrenzt (Speicherplatz)."); return; }
        const fr = new FileReader();
        fr.onload = () => {
          const all = dmList();
          const cc = all.find((x) => x.id === id);
          if (!cc) return;
          cc.msgs.push({ id: gbId(), from: dmAsMe() ? "me" : cc.name, text: "", audio: String(fr.result), dur, ts: Date.now(), read: dmAsMe(), replyTo: dmReply() });
          setDmReply(null);
          dmSave(all);
        };
        fr.readAsDataURL(blob);
      };
      dmRec.start();
      setRecLabel("● 0s (zum Stoppen erneut 🎤)");
      dmRecTimer = setInterval(() => {
        setRecLabel("● " + Math.round((Date.now() - dmRecStart) / 1000) + "s (zum Stoppen erneut 🎤)");
      }, 500);
    }).catch(() => { setOut("Mikrofon verweigert oder nicht verfügbar."); });
  }
  function dmPane() {
    const all = dmList();
    const c = all.find((x) => x.id === dmConvo());
    if (!c) {
      const vis = all.filter((x) => dmShowArch() ? x.archived : !x.archived).slice().sort((a, b) => {
        if ((b.pinned ? 1 : 0) !== (a.pinned ? 1 : 0)) return (b.pinned ? 1 : 0) - (a.pinned ? 1 : 0);
        const am = a.msgs[a.msgs.length - 1], bm = b.msgs[b.msgs.length - 1];
        return ((bm && bm.ts) || a.created) - ((am && am.ts) || a.created);
      });
      const archN = all.filter((x) => x.archived).length;
      return (<div>
        <p class="meta">Private Chats — lokal auf diesem Gerät, nichts landet im Feed.</p>
        <p><input value={dmNew()} onInput={(e) => setDmNew(e.target.value)} placeholder="Name für neuen Chat" />{" "}
          <button type="button" onClick={() => {
            const nm = dmNew().trim().slice(0, 40);
            if (!nm) return;
            setDmNew(""); dmOpen(nm);
          }}>＋</button>{" "}
          <button type="button" onClick={() => setDmShowArch(!dmShowArch())}>
            {dmShowArch() ? "Aktive" : "Archiv (" + archN + ")"}</button></p>
        {vis.length === 0 ? <p class="meta">Keine Chats. Lege oben einen an — oder tippe im Profil auf „Nachricht“.</p> :
          vis.map((x) => {
            const last = x.msgs[x.msgs.length - 1];
            return (<article class="feed-card" onClick={(ev) => {
              if (ev.target && ev.target.closest && ev.target.closest("button")) return;
              setDmConvo(x.id); setDmAsMe(true); setDmReply(null); setDmFind("");
            }}>
              <div class="feed-head"><div class="avatar sm">{x.name[0].toUpperCase()}</div>
                <div><span class="name">{x.name}</span>{" "}
                  {x.pinned ? <span class="badge">📌</span> : null}
                  <span class="handle">{last ? new Date(last.ts).toLocaleString() : ""}</span></div></div>
              <div class="feed-body">{dmPreview(last)}</div>
              <div class="feed-actions">
                <span><button type="button" onClick={() => {
                  const a2 = dmList(); const t = a2.find((y) => y.id === x.id);
                  if (t) t.pinned = !t.pinned; dmSave(a2);
                }}>{x.pinned ? "📌" : "📍"}</button></span>
                <span><button type="button" onClick={() => {
                  const a2 = dmList(); const t = a2.find((y) => y.id === x.id);
                  if (t) t.archived = !t.archived; dmSave(a2);
                }}>{x.archived ? "Entarchivieren" : "Archiv"}</button></span>
                <span><button type="button" onClick={() => {
                  dmSave(dmList().filter((y) => y.id !== x.id));
                }}>Löschen</button></span></div>
            </article>);
          })}
      </div>);
    }
    let dmChanged = false;
    c.msgs.forEach((m) => { if (m.from !== "me" && !m.read) { m.read = true; dmChanged = true; } });
    if (dmChanged) dmSave(all);
    const shown = dmFind()
      ? c.msgs.filter((m) => (m.text || "").toLowerCase().includes(dmFind().toLowerCase()))
      : c.msgs;
    const rq = dmReply() ? c.msgs.find((x) => x.id === dmReply()) : null;
    return (<div>
      <p><button type="button" onClick={() => setDmConvo(null)}>← Alle Chats</button></p>
      <div class="feed-head"><div class="avatar sm">{c.name[0].toUpperCase()}</div>
        <div><span class="name">{c.name}</span> <span class="handle">{c.msgs.length} Nachrichten</span></div></div>
      <p class="meta">Ich schreibe als: <select value={dmAsMe() ? "me" : "ct"} onChange={(e) => setDmAsMe(e.target.value === "me")}>
        <option value="me">{me || "Ich"}</option>
        <option value="ct">{c.name}</option></select>{" "}
        <input value={dmFind()} onInput={(e) => setDmFind(e.target.value)} placeholder="Im Chat suchen" /></p>
      <div>{shown.length === 0 ? <p class="meta">Noch nichts hier. Schreib die erste Nachricht.</p> :
        shown.map((m) => {
          const qm = m.replyTo ? c.msgs.find((x) => x.id === m.replyTo) : null;
          return (<article class="feed-card">
            <div class="feed-head"><div class="avatar sm">{(m.from === "me" ? (me || "I") : c.name)[0].toUpperCase()}</div>
              <div><span class="name">{m.from === "me" ? (me || "Ich") : c.name}</span>{" "}
                <span class="handle">{new Date(m.ts).toLocaleString()} · {dmTicks(m)}</span></div></div>
            {m.replyTo ? <p class="meta">↩ {qm ? (qm.audio ? "🎤 Sprachnachricht" : (qm.text || "").slice(0, 60)) : "(gelöscht)"}</p> : null}
            {m.audio ? <audio controls src={m.audio}></audio> :
              <p><span innerHTML={gbBody(m.text || "")} onClick={tagClick} /></p>}
            <div class="feed-actions">
              <span><button type="button" onClick={() => setDmReply(m.id)}>Antworten</button></span>{" "}
              {m.text ? <span><button type="button" onClick={() => {
                publishOne({ name: actor(), message: m.text }, null);
                clearComposer(); setMainTab("time"); setOut("Im Feed geteilt.");
              }}>Teilen</button></span> : null}{" "}
              <span><button type="button" onClick={() => {
                const a2 = dmList(); const cc = a2.find((x) => x.id === c.id);
                if (cc) cc.msgs = cc.msgs.filter((x) => x.id !== m.id);
                dmSave(a2);
              }}>Löschen</button></span></div>
          </article>);
        })}</div>
      {rq ? <p class="meta">Antwort auf: {rq.audio ? "🎤 Sprachnachricht" : (rq.text || "").slice(0, 60)}{" "}
        <button type="button" onClick={() => setDmReply(null)}>x</button></p> : null}
      <p><input value={dmText()} onInput={(e) => setDmText(e.target.value)}
        onKeyDown={(e) => { if (e.key === "Enter" && !e.shiftKey) { e.preventDefault(); dmSend(c.id); } }}
        placeholder="Nachricht (Enter = senden)" />{" "}
        <button type="button" onClick={() => dmSend(c.id)}>Senden</button>{" "}
        <button type="button" onClick={() => dmToggleRec(c.id)}>🎤</button>{" "}
        <span class="meta">{recLabel()}</span></p>
    </div>);
  }
  function toggleLike(id) {
    const p = entries().find((x) => x.id === id);
    if (p && !p.liked) { gbPushNotif("like", p, actor()); reloadNotifs(); }
    save(entries().map((x) => {
      if (x.id !== id) return x;
      const liked = !x.liked;
      return { ...x, liked, likes: Math.max(0, x.likes + (liked ? 1 : -1)) };
    }));
  }
  function toggleRepost(id) {
    const p = entries().find((x) => x.id === id);
    if (!p) return;
    try {
      if (p.reposted) {
        gbFeedWrite(gbFeedRead().filter((x) => x.id !== "gb-" + id));
        save(entries().map((x) => x.id === id ? { ...x, reposted: false, reposts: Math.max(0, x.reposts - 1) } : x));
      } else {
        gbPushNotif("repost", p, actor()); reloadNotifs();
        const feed = gbFeedRead();
        feed.unshift({ text: "🔁 " + p.name + ": " + (p.message.length > 120 ? p.message.slice(0, 119) + "…" : p.message), time: Date.now(), id: "gb-" + id + "-rt" });
        gbFeedWrite(feed);
        save(entries().map((x) => x.id === id ? { ...x, reposted: true, reposts: x.reposts + 1 } : x));
      }
    } catch { setOut("Repost im Feed fehlgeschlagen (Speicher blockiert). Zähler gespeichert."); }
  }
  function removePost(id) {
    try { gbFeedWrite(gbFeedRead().filter((x) => x.id !== "gb-" + id)); } catch { /* ignore */ }
    save(entries().filter((x) => x.id !== id));
  }
  function toggleOpen(id) { setOpen((o) => ({ ...o, [id]: !o[id] })); }
  function sendReply(id, ev) {
    const box = ev.currentTarget.parentElement;
    const inp = box ? box.querySelector("input") : null;
    const txt = inp ? inp.value.trim() : "";
    if (!txt) return;
    if (txt.length > 280) { setOut("Antwort darf höchstens 280 Zeichen haben."); return; }
    const p = entries().find((x) => x.id === id);
    if (p) { gbPushNotif("reply", p, actor()); reloadNotifs(); }
    save(entries().map((x) => x.id === id
      ? { ...x, replies: [...x.replies, { name: actor(), message: txt, date: new Date().toLocaleString(), ts: Date.now() }] }
      : x));
    setOpen((o) => ({ ...o, [id]: true }));
  }
  function removeReply(id, i) {
    save(entries().map((x) => x.id === id ? { ...x, replies: x.replies.filter((_, j) => j !== i) } : x));
  }
  return (
    <div class="tool-form">
      <label>Name <input value={name()} onInput={(e) => { setName(e.target.value); saveDraft(); }} placeholder="Your Name" /></label>
      <label>Email <input type="email" value={email()} onInput={(e) => { setEmail(e.target.value); saveDraft(); }} placeholder="Your Email" /></label>
      {mode() !== "thread" ? <label>Nachricht <textarea ref={taRef} value={message()} onInput={(e) => { setMessage(e.target.value); saveDraft(); }} placeholder="Your Message (10-1000 Zeichen)" /></label> : null}
      <div>
        {toolbar.map((b) => (
          <>
            <button type="button" onClick={() => insertTag(b[1], b[2])}>{b[0]}</button>{" "}
          </>
        ))}
        <button type="button" onClick={() => insertTag(null, null)}>Emoji</button>
      </div>
      {quote() && quotedEntry() ? <p class="meta">Zitiert <strong>{quotedEntry().name}</strong>: {quotedEntry().message.slice(0, 80)}…{" "}
        <button type="button" onClick={() => setQuote(null)}>Abbrechen</button></p> : null}
      <div>
        <button type="button" onClick={() => setMode("post")}>Post</button>{" "}
        <button type="button" onClick={() => setMode("thread")}>Thread</button>{" "}
        <button type="button" onClick={() => setMode("poll")}>Umfrage</button>{" "}
        <button type="button" title="Bio und Avatarfarbe" onClick={() => setProfOpen(!profOpen())}>Profil</button>
      </div>
      {mode() === "thread" ? <div>
        {tparts().map((t, i) => (
          <p><textarea value={t} onInput={(e) => { const n = tparts().slice(); n[i] = e.target.value; setTparts(n); }} placeholder={"Teil " + (i + 1) + " (10-1000 Zeichen)"} /></p>
        ))}
        {tparts().length < 8 ? <button type="button" onClick={() => setTparts([...tparts(), ""])}>＋ Teil</button> : null}
      </div> : null}
      {mode() === "poll" ? <div>
        <label>Frage <input value={pollQ()} onInput={(e) => setPollQ(e.target.value)} placeholder="Frage (max. 140)" /></label>
        {pollOpts().map((o, i) => (
          <label>Option {i + 1} <input value={o} onInput={(e) => { const n = pollOpts().slice(); n[i] = e.target.value; setPollOpts(n); }} placeholder={"Option " + (i + 1)} /></label>
        ))}
        {pollOpts().length < 4 ? <button type="button" onClick={() => setPollOpts([...pollOpts(), ""])}>+ Option</button> : null}
      </div> : null}
      {profOpen() ? <div>
        <label>Bio <input value={bio()} onInput={(e) => setBio(e.target.value)} placeholder="Bio (max. 160)" /></label>
        <label>Avatarfarbe <select value={color()} onChange={(e) => setColor(e.target.value)}>
          {GB_COLORS.map((c) => <option value={c}>{c}</option>)}
        </select></label>
        <label>Banner <select value={banner()} onChange={(e) => setBanner(e.target.value)}>
          {GB_COLORS.map((c) => <option value={c}>{c}</option>)}
        </select></label>
        <button type="button" onClick={saveProfile}>Speichern</button>
      </div> : null}
      <div>
        <button type="button" onClick={send}>Posten</button> <span class="meta">{message().length}/1000</span>
      </div>
      <div>{out()}</div>
      <div>
        <button type="button" onClick={() => setMainTab("time")}>Timeline</button>{" "}
        <button type="button" onClick={() => { setMainTab("dm"); setDmConvo(null); }}>Nachrichten</button>
      </div>
      {mainTab() !== "dm" ? <>
      <div>
        <button type="button" onClick={() => { setScope("all"); setPage(1); }}>Alle</button>{" "}
        <button type="button" onClick={() => { setScope("following"); setPage(1); }}>Folgen</button>{" "}
        <button type="button" onClick={() => { setScope("bookmarks"); setPage(1); }}>Gemerkt</button>{" "}
        <select value={scope().startsWith("list:") ? scope().slice(5) : ""} onChange={(e) => { setScope(e.target.value ? "list:" + e.target.value : "all"); setPage(1); }}>
          <option value="">Liste…</option>
          {lists().map((l) => <option value={l.id}>{l.name}</option>)}
        </select>{" "}
        <button type="button" onClick={() => setListsOpen(!listsOpen())}>Listen</button>{" "}
        <button type="button" title="Mitteilungen" onClick={() => setNotifsOpen(!notifsOpen())}>🔔</button>{" "}
        <span class="meta">{unread() ? unread() + " neu" : ""}</span>
      </div>
      {hl ? <p class="meta">{entries().some((e) => e.id === hl) ? "Permalink" : "Post nicht gefunden."}{" "}
        <a href="#/tool/guestbook">Zurück zur Timeline</a></p> : null}
      {listsOpen() ? <div>
        <p class="meta">Listen: eigene Timelines aus Autoren.</p>
        <p><input value={newList()} onInput={(e) => setNewList(e.target.value)} placeholder="Neue Liste" />{" "}
          <button type="button" onClick={createList}>Anlegen</button></p>
        {lists().map((l) => (
          <div><p><strong>{l.name}</strong> ({l.members.length}){" "}
            <button type="button" onClick={() => { setScope("list:" + l.id); setPage(1); }}>Ansehen</button>{" "}
            <button type="button" onClick={() => {
              const rest = gbLoad("gblists").filter((x) => x.id !== l.id);
              try { storeSet("gblists", rest); } catch { /* ignore */ }
              if (scope() === "list:" + l.id) setScope("all");
              reloadLists();
            }}>Löschen</button></p>
            <p>{l.members.length === 0 ? <span class="meta">leer</span> : l.members.map((m) => (
              <><span>{m}</span> <button type="button" onClick={() => {
                const all = gbLoad("gblists");
                const li = all.find((x) => x.id === l.id);
                if (li) li.members = li.members.filter((x) => x !== m);
                try { storeSet("gblists", all); } catch { /* ignore */ }
                reloadLists();
              }}>x</button>{" "}</>
            ))}</p>
            <p><input placeholder="Autor hinzufügen" />{" "}
              <button type="button" onClick={(ev) => {
                const box = ev.currentTarget.parentElement;
                const inp = box ? box.querySelector("input") : null;
                const nm = inp ? inp.value.trim().slice(0, 40) : "";
                if (!nm) return;
                const all = gbLoad("gblists");
                const li = all.find((x) => x.id === l.id);
                if (li && li.members.indexOf(nm) < 0) li.members.push(nm);
                try { storeSet("gblists", all); } catch { /* ignore */ }
                reloadLists();
              }}>＋</button></p></div>
        ))}
      </div> : null}
      {muted().length > 0 ? <p class="meta">Stumm:{" "}
        {muted().map((m) => <><span>{m}</span> <button type="button" onClick={() => unmute(m)}>x</button>{" "}</>)}
      </p> : null}
      <div>
        <input type="datetime-local" value={schedAt()} onInput={(e) => setSchedAt(e.target.value)} />{" "}
        <button type="button" onClick={schedulePost}>Planen</button>{" "}
        <button type="button" onClick={() => setSchedOpen(!schedOpen())}>Geplant ({pendSched().length})</button>
      </div>
      {schedOpen() ? <div>
        {pendSched().length === 0 ? <p class="meta">Nichts geplant.</p> : pendSched().map((s) => (
          <p class="meta">{new Date(s.postAt).toLocaleString()} — <strong>{s.name}</strong>: {s.message.slice(0, 60)}{" "}
            <button type="button" onClick={() => {
              try { storeSet("gbsched", gbLoad("gbsched").filter((x) => x.id !== s.id)); } catch { /* ignore */ }
            }}>Abbrechen</button></p>
        ))}
      </div> : null}
      {notifsOpen() ? <div>
        <p class="meta">Mitteilungen ({notifs().length}){" "}
          <button type="button" onClick={markNotifsRead}>Alle als gelesen</button></p>
        {notifs().length === 0 ? <p class="meta">Keine Mitteilungen.</p> : notifs().map((n) => (
          <p class="meta">{!n.read ? <><strong>neu</strong> </> : null}{n.by}{" "}
            {n.type === "like" ? "mag deinen Post" : n.type === "repost" ? "hat deinen Post geteilt" : "hat geantwortet"}{" "}
            <span class="meta">{new Date(n.ts).toLocaleString()}</span></p>
        ))}
      </div> : null}
      {trends().length > 0 ? <p class="meta">Trends:{" "}
        {trends().map((t) => (
          <><button type="button" onClick={() => { setFilter("#" + t.tag); setPage(1); }}>#{t.tag} ({t.n})</button>{" "}</>
        ))}</p> : null}
      {profile() ? (() => {
        const nm = profile();
        const mine = entries().filter((e) => e.name === nm);
        const isMe = me && nm === me;
        const prof = isMe ? gbProfile() : null;
        const nMedia = mine.filter((e) => e.message.indexOf("[img]") >= 0).length;
        const nThreads = mine.filter((e) => e.threadId).length;
        return (<>
          <div style={{ height: "48px", background: prof ? prof.banner : "#16181c", "border-radius": "8px" }}></div>
          <p class="meta"><strong>{nm}</strong> {gbHandle(nm)} · {mine.length} Posts · {mine.reduce((a, e) => a + e.likes, 0)} Likes
            {prof && prof.bio ? <><br />{prof.bio}<br /></> : " "}
            {isMe ? <span class="badge">you</span> :
              <button type="button" onClick={() => toggleFollow(nm)}>
                {follows().indexOf(nm) >= 0 ? "Entfolgen" : "Folgen"}</button>}{" "}
            <button type="button" onClick={() => { setProfileTab("posts"); setPage(1); }}>Posts</button>{" "}
            <button type="button" onClick={() => { setProfileTab("media"); setPage(1); }}>Medien ({nMedia})</button>{" "}
            <button type="button" onClick={() => { setProfileTab("threads"); setPage(1); }}>Threads ({nThreads})</button>{" "}
            <button type="button" onClick={() => dmOpen(nm)}>Nachricht</button>{" "}
          <button type="button" onClick={() => { setProfile(null); setPage(1); }}>Zurück</button></p>
        </>);
      })() : null}
      {!profile() && !hl ? (() => {
        const sug = gbSuggest(entries(), me, follows(), muted());
        return sug.length ? <p class="meta">Folgen vielleicht:{" "}
          {sug.map((n) => <><button type="button" onClick={() => { setProfile(n); setPage(1); }}>{n}</button>{" "}</>)}
        </p> : null;
      })() : null}
      <label>Filter <input type="search" value={filter()} onInput={(e) => { setFilter(e.target.value); setPage(1); }} placeholder="Suchen … (#tag geht auch)" /></label>
      <label>Sortierung <select value={sort()} onChange={(e) => { setSort(e.target.value); setPage(1); }}>
        <option value="new">Neueste zuerst</option>
        <option value="top">Beliebt zuerst</option>
      </select></label>
      <div>
        <p class="meta">{stats()} · Posten landet auch im Home-Feed (Folgen).</p>
        {(() => { const pg = paged(); return (<>
          {pg.items.length === 0 ? <p class="meta">Noch keine Einträge.</p> : pg.items.map((en) => (
          <article class="feed-card">
            <div class="feed-head"><div class="avatar sm" style={avColor(en.name) ? { background: avColor(en.name) } : null}>{en.name[0].toUpperCase()}</div>
              <div><button type="button" class="name" onClick={() => { setProfile(en.name); setProfileTab("posts"); setPage(1); }}>{en.name}</button>
                <span class="handle"> {en.handle} · {en.date}{en.edited ? " · bearbeitet" : ""}</span>
                {me && en.name === me ? <> <span class="badge">you</span></> :
                  <> <button type="button" onClick={() => toggleFollow(en.name)}>
                    {follows().indexOf(en.name) >= 0 ? "Entfolgt" : "Folgen"}</button></>}
                {(() => { const ti = gbThreadInfo(entries(), en); return ti ? <> <span class="badge">🧵 {ti.i}/{ti.n}</span></> : null; })()}
                {en.poll ? <> <span class="badge">Umfrage</span></> : null}
                {en.pinned ? <> <span class="badge">📌</span></> : null}</div></div>
            {editing() === en.id ? <div class="feed-body">
              <textarea value={editText()} onInput={(e) => setEditText(e.target.value)} />
              <p><button type="button" onClick={() => saveEdit(en.id)}>Speichern</button>{" "}
                <button type="button" onClick={() => setEditing(null)}>Abbrechen</button></p>
            </div> : <div class="feed-body" innerHTML={gbBody(en.message)} onClick={tagClick} />}
            {en.quoteId ? (() => { const q = entries().find((x) => x.id === en.quoteId);
              if (!q) return <p class="meta">Zitierter Post gelöscht.</p>;
              return <div class="quoted"><p class="meta">Zitiert <strong>{q.name}</strong> {q.handle}</p>
                <p><span innerHTML={gbBody(q.message)} onClick={tagClick} /></p></div>; })() : null}
            {en.poll ? <div class="poll">
              <p><strong>{en.poll.q}</strong></p>
              {en.poll.opts.map((o, i) => {
                const total = en.poll.opts.reduce((a, x) => a + x.v, 0);
                const pct = total ? Math.round(o.v * 100 / total) : 0;
                return <p>{en.poll.voted === i ? "◉ " : "○ "}{o.t} — {pct}% ({o.v}){" "}
                  {en.poll.voted < 0 ? <button type="button" onClick={() => vote(en.id, i)}>Stimmen</button> : null}</p>;
              })}
              <p class="meta">{en.poll.opts.reduce((a, x) => a + x.v, 0)} Stimmen</p>
            </div> : null}
            <div class="feed-actions">
              <span><button type="button" onClick={() => toggleLike(en.id)}>{en.liked ? "♥ " : "♡ "}{en.likes}</button></span>
              <span><button type="button" onClick={() => toggleOpen(en.id)}>💬 {en.replies.length}</button></span>
              <span><button type="button" onClick={() => toggleRepost(en.id)}>🔁 {en.reposts}</button></span>
              <span><button type="button" onClick={() => { setQuote(en.id); setMode("post"); }}>Zitieren</button></span>
              <span><button type="button" onClick={() => toggleBm(en.id)}>{en.bookmarked ? "★" : "☆"}</button></span>
              <span><button type="button" onClick={() => togglePin(en.id)}>{en.pinned ? "📌" : "📍"}</button></span>
              <span><button type="button" onClick={() => { setEditing(en.id); setEditText(en.message); }}>Edit</button></span>
              <span><button type="button" onClick={() => sharePost(en)}>Teilen</button></span>
              <span><button type="button" onClick={() => copyText(gbPostUrl(en.id), "Permalink kopiert.")}>🔗</button></span>
              {me && en.name === me ? null :
                <span><button type="button" onClick={() => muteAuthor(en.name)}>Stumm</button></span>}
              <span>▭ {en.views}</span>
              <span><button type="button" onClick={() => removePost(en.id)}>Löschen</button></span>
            </div>
            {open()[en.id] ? <div class="replies">
              {en.replies.map((r, i) => (
                <p><strong>{r.name}</strong> <span class="meta">{r.date}</span><br />
                  <span innerHTML={gbBody(r.message)} onClick={tagClick} />
                  {" "}<button type="button" onClick={() => removeReply(en.id, i)}>Löschen</button></p>
              ))}
              <p><input placeholder="Antworten … (max. 280)" maxLength={280} />{" "}
                <button type="button" onClick={(ev) => sendReply(en.id, ev)}>Antworten</button></p>
            </div> : null}
          </article>
          ))}
          {pg.pages > 1 ? <p class="meta">
            <button type="button" disabled={pg.page <= 1} onClick={() => setPage(pg.page - 1)}>← Zurück</button>{" "}
            Seite {pg.page} von {pg.pages}{" "}
            <button type="button" disabled={pg.page >= pg.pages} onClick={() => setPage(pg.page + 1)}>Weiter →</button>
          </p> : null}
        </>); })()}
      </div>
      </> : dmPane()}
    </div>
  );
}

function hash(s) {
  let h1 = 0xdeadbeef, h2 = 0x41c6ce57;
  for (let i = 0; i < s.length; i++) {
    const ch = s.charCodeAt(i);
    h1 = Math.imul(h1 ^ ch, 2654435761); h2 = Math.imul(h2 ^ ch, 1597334677);
  }
  h1 = Math.imul(h1 ^ (h1 >>> 16), 2246822507) ^ Math.imul(h2 ^ (h2 >>> 13), 3266489909);
  h2 = Math.imul(h2 ^ (h2 >>> 16), 2246822507) ^ Math.imul(h1 ^ (h1 >>> 13), 3266489909);
  return (h2 >>> 0).toString(16) + (h1 >>> 0).toString(16);
}

export function ViewSignin() {
  const [user, setUser] = createSignal("");
  const [pass, setPass] = createSignal("");
  const [out, setOut] = createSignal("");
  const users = () => storeGet("users", {});
  function refresh() {
    let cur = null;
    try { cur = sessionStorage.getItem("d5:session"); } catch { /* ignore */ }
    setOut(cur ? "Eingeloggt als: " + cur + " (Logout: einfach anderen Benutzer anmelden oder Sitzung schließen)" : "Nicht eingeloggt.");
  }
  createEffect(refresh);
  return (
    <div class="tool-form">
      <label>Benutzername <input value={user()} onInput={(e) => setUser(e.target.value)} placeholder="Benutzername" /></label>
      <label>Passwort <input type="password" value={pass()} onInput={(e) => setPass(e.target.value)} placeholder="Passwort" /></label>
      <button type="button" onClick={() => {
        const u = users();
        if (u[user()] && u[user()] === hash(pass())) {
          try { sessionStorage.setItem("d5:session", user()); } catch { /* ignore */ }
          setOut("Login erfolgreich: " + user());
        } else setOut("Fehler: ungültige Anmeldedaten.");
        refresh();
      }}>Login</button>
      <button type="button" onClick={() => {
        if (!user() || !pass()) { setOut("Benutzername und Passwort eingeben."); return; }
        const u = users();
        if (u[user()]) { setOut("Benutzer existiert bereits."); return; }
        u[user()] = hash(pass()); storeSet("users", u);
        setOut("Registriert: " + user() + ". Jetzt einloggen.");
      }}>Registrieren</button>
      <div class="output">{out()}</div>
    </div>
  );
}

const B62 = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
export function ViewShortener() {
  const [links, setLinks] = createSignal(storeGet("shortlinks", {}));
  const [url, setUrl] = createSignal("");
  const [out, setOut] = createSignal("");
  function add() {
    const u = url().trim();
    if (!/^https?:\/\/.+\..+/.test(u)) { setOut("Bitte eine gültige http(s)-URL eingeben."); return; }
    let code;
    do {
      code = "";
      for (let i = 0; i < 6; i++) code += B62[Math.floor(Math.random() * 62)];
    } while (links()[code]);
    const next = { ...links(), [code]: { url: u, visits: 0 } };
    setLinks(next); storeSet("shortlinks", next);
    setUrl("");
    setOut("Kurzlink: d5:" + code);
  }
  return (
    <div class="tool-form">
      <label>Original-URL <input type="url" value={url()} onInput={(e) => setUrl(e.target.value)} placeholder="https://example.com/seite" /></label>
      <button type="button" onClick={add}>Kürzen</button>
      <div>{out()}</div>
      <div>
        <p class="meta">{Object.keys(links()).length} Kurzlinks gespeichert.</p>
        {Object.keys(links()).length === 0 ? <p class="meta">Noch keine Links.</p> : Object.keys(links()).map((code) => {
          const l = links()[code];
          return (
            <article class="card">
              <h3><a href={"#/go/" + code}>d5:{code}</a></h3>
              <p class="meta">{l.url}</p>
              <p class="meta">Aufrufe: {l.visits}</p>
            </article>
          );
        })}
      </div>
    </div>
  );
}

export function ViewGo({ code }) {
  const links = storeGet("shortlinks", {});
  const l = links[code];
  if (!l) {
    return <div><p>Unbekannter Kurzlink: {code}</p><p><a href="#/catalog">Zum Katalog</a></p></div>;
  }
  l.visits++; storeSet("shortlinks", links);
  createEffect(() => {
    const t = setTimeout(() => { window.location.href = l.url; }, 600);
    onCleanup(() => clearTimeout(t));
  });
  return (
    <div>
      <h1>d5:{code}</h1>
      <p class="meta">Weiterleitung zu {l.url} …</p>
      <p><a href={l.url} rel="noopener">Falls nichts passiert, hier klicken</a></p>
    </div>
  );
}
