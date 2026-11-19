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

export function ViewGuestbook() {
  const [entries, setEntries] = createSignal(storeGet("guestbook", []));
  const [name, setName] = createSignal("");
  const [email, setEmail] = createSignal("");
  const [message, setMessage] = createSignal("");
  const [out, setOut] = createSignal("");
  let taRef;
  const toolbar = [["B", "[b]", "[/b]"], ["I", "[i]", "[/i]"], ["U", "[u]", "[/u]"], ["Link", "[url]", "[/url]"], ["Bild", "[img]", "[/img]"]];
  function insertTag(a, b) {
    if (!a) { setMessage((m) => m + "😊"); if (taRef) taRef.focus(); return; }
    setMessage((m) => {
      const s = taRef ? taRef.selectionStart || 0 : 0;
      const e2 = taRef ? taRef.selectionEnd || 0 : 0;
      return m.slice(0, s) + a + m.slice(s, e2) + b + m.slice(e2);
    });
    if (taRef) taRef.focus();
  }
  function send() {
    const fd = { name: name().trim(), email: email().trim(), message: message().trim() };
    if (!fd.name) { setOut("Bitte einen Namen eingeben."); return; }
    if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(fd.email)) { setOut("Invalid email format."); return; }
    if (fd.message.length < 10 || fd.message.length > 1000) { setOut("Message must be between 10 and 1000 characters."); return; }
    const next = [{ name: fd.name, message: fd.message, date: new Date().toLocaleString() }, ...entries()];
    setEntries(next); storeSet("guestbook", next);
    setName(""); setEmail(""); setMessage("");
    setOut("Gespeichert.");
  }
  return (
    <div class="tool-form">
      <label>Name <input value={name()} onInput={(e) => setName(e.target.value)} placeholder="Your Name" /></label>
      <label>Email <input type="email" value={email()} onInput={(e) => setEmail(e.target.value)} placeholder="Your Email" /></label>
      <label>Nachricht <textarea ref={taRef} value={message()} onInput={(e) => setMessage(e.target.value)} placeholder="Your Message (10-1000 Zeichen)" /></label>
      <div>
        {toolbar.map((b) => (
          <>
            <button type="button" onClick={() => insertTag(b[1], b[2])}>{b[0]}</button>{" "}
          </>
        ))}
        <button type="button" onClick={() => insertTag(null, null)}>Emoji</button>
      </div>
      <button type="button" onClick={send}>Submit</button>
      <div>{out()}</div>
      <div>
        <p class="meta">{entries().length} Einträge</p>
        {entries().length === 0 ? <p class="meta">Noch keine Einträge.</p> : entries().map((en, i) => (
          <article class="card">
            <h3>{en.name}</h3>
            <p class="meta">{en.date}</p>
            <p innerHTML={bbcode(en.message)} />
            <p class="meta"><button type="button" onClick={() => { const n = entries().slice(); n.splice(i, 1); setEntries(n); storeSet("guestbook", n); }}>Löschen</button></p>
          </article>
        ))}
      </div>
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
