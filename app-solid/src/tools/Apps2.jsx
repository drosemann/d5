/* Splitwise / Speedtest / Sorting / Todo / Notes / Dataopt — ported from app/apps2.js. */
import { createSignal, onCleanup, For, Show } from "solid-js";
import { storeGet, storeSet, esc } from "../store.js";

/* ---------- Splitwise ---------- */
export function ViewSplitwise() {
  const fresh = () => ({ users: [], groups: [], expenses: [], payments: [] });
  const [db, setDb] = createSignal(storeGet("splitwise", fresh()));
  const [uname, setUname] = createSignal("");
  const [gname, setGname] = createSignal("");
  const [desc, setDesc] = createSignal("");
  const [amount, setAmount] = createSignal("");
  const [payer, setPayer] = createSignal("");
  const [pFrom, setPFrom] = createSignal("");
  const [pTo, setPTo] = createSignal("");
  const [pAmt, setPAmt] = createSignal("");
  const save = (d) => { setDb(d); storeSet("splitwise", d); };
  function balance(u) {
    const d = db();
    let paid = 0, owed = 0, got = 0, gave = 0;
    d.expenses.forEach((x) => {
      if (x.members.indexOf(u) === -1) return;
      if (x.payer === u) paid += x.amount;
      owed += x.amount / x.members.length;
    });
    d.payments.forEach((p) => {
      if (p.from === u) gave += p.amount;
      if (p.to === u) got += p.amount;
    });
    return paid - owed - gave + got;
  }
  const users = () => db().users;
  return (
    <div>
      <div class="tool-form">
        <label>Neue Person <input value={uname()} onInput={(e) => setUname(e.target.value)} placeholder="Name" /></label>
        <button type="button" onClick={() => { const n = uname().trim(); if (!n || db().users.includes(n)) return; const d = { ...db(), users: [...db().users, n] }; save(d); setUname(""); }}>Person hinzufügen</button>
        <label>Neue Gruppe <input value={gname()} onInput={(e) => setGname(e.target.value)} placeholder="Gruppenname" /></label>
        <button type="button" onClick={() => { const n = gname().trim(); if (!n) return; const d = { ...db(), groups: [...db().groups, { name: n, members: db().users.slice() }] }; save(d); setGname(""); }}>Gruppe anlegen (alle Personen)</button>
        <label>Beschreibung <input value={desc()} onInput={(e) => setDesc(e.target.value)} placeholder="Beschreibung" /></label>
        <label>Betrag <input type="number" value={amount()} onInput={(e) => setAmount(e.target.value)} placeholder="Betrag" /></label>
        <label>Bezahlt von <select value={payer()} onChange={(e) => setPayer(e.target.value)}>
          <For each={users()}>{(u) => <option>{u}</option>}</For>
        </select></label>
        <button type="button" onClick={() => { const a = parseFloat(amount()); if (!desc().trim() || !(a > 0) || !payer()) return; save({ ...db(), expenses: [...db().expenses, { desc: desc().trim(), amount: a, payer: payer(), members: db().users.slice(), date: Date.now() }] }); setDesc(""); setAmount(""); }}>Ausgabe hinzufügen (gleichmäßig geteilt)</button>
        <label>Zahlt <select value={pFrom()} onChange={(e) => setPFrom(e.target.value)}>
          <For each={users()}>{(u) => <option>{u}</option>}</For>
        </select></label>
        <label>Empfängt <select value={pTo()} onChange={(e) => setPTo(e.target.value)}>
          <For each={users()}>{(u) => <option>{u}</option>}</For>
        </select></label>
        <label>Betrag <input type="number" value={pAmt()} onInput={(e) => setPAmt(e.target.value)} placeholder="Betrag" /></label>
        <button type="button" onClick={() => { const a = parseFloat(pAmt()); if (!pFrom() || !pTo() || pFrom() === pTo() || !(a > 0)) return; save({ ...db(), payments: [...db().payments, { from: pFrom(), to: pTo(), amount: a, date: Date.now() }] }); setPAmt(""); }}>Ausgleichszahlung</button>
      </div>
      <div>
        <h2>Personen &amp; Gruppen</h2>
        <p class="meta">Personen: {db().users.join(", ") || "—"} · Gruppen: {db().groups.map((g) => g.name).join(", ") || "—"}</p>
        <h2>Salden (gezahlt minus Anteil)</h2>
        <Show when={db().users.length} fallback={<table class="data"><tr><td>—</td><td>—</td></tr></table>}>
          <table class="data">
            <tr><th>Person</th><th>Saldo</th></tr>
            <For each={db().users}>{(u) => <tr><td>{u}</td><td>{balance(u).toFixed(2)}</td></tr>}</For>
          </table>
        </Show>
        <h2>Ausgaben</h2>
        <Show when={db().expenses.length} fallback={<table class="data"><tr><td>—</td><td>—</td><td>—</td><td>—</td></tr></table>}>
          <table class="data">
            <tr><th>Was</th><th>Betrag</th><th>Von</th><th>Geteilt mit</th></tr>
            <For each={db().expenses}>{(x) => <tr><td>{x.desc}</td><td>{x.amount.toFixed(2)}</td><td>{x.payer}</td><td>{x.members.join(", ")}</td></tr>}</For>
          </table>
        </Show>
        <h2>Ausgleichszahlungen</h2>
        <Show when={db().payments.length} fallback={<table class="data"><tr><td>—</td><td>—</td></tr></table>}>
          <table class="data">
            <tr><th>Von → An</th><th>Betrag</th></tr>
            <For each={db().payments}>{(p) => <tr><td>{p.from} → {p.to}</td><td>{p.amount.toFixed(2)}</td></tr>}</For>
          </table>
        </Show>
      </div>
    </div>
  );
}

/* ---------- Speedtest ---------- */
export function ViewSpeedtest() {
  const [out, setOut] = createSignal("Misst Ping und Download gegen diesen Server. Upload nur falls der Server POST annimmt.");
  const bust = (u) => u + (u.includes("?") ? "&" : "?") + "t=" + Date.now() + Math.random();
  function run() {
    setOut("Messe …");
    const lines = [];
    const pings = [];
    function ping(i) {
      if (i >= 3) return download();
      const t0 = performance.now();
      fetch(bust("./catalog.json"), { cache: "no-store" }).then((r) => r.text()).then(() => {
        pings.push(performance.now() - t0);
        ping(i + 1);
      }).catch(() => { lines.push("Ping-Messung fehlgeschlagen."); setOut(lines.join("\n")); });
    }
    function download() {
      let total = 0;
      const t0 = performance.now(), rounds = 5;
      let done = 0;
      for (let i = 0; i < rounds; i++) {
        fetch(bust("./catalog.js"), { cache: "no-store" }).then((r) => r.arrayBuffer()).then((b) => {
          total += b.byteLength;
          if (++done === rounds) {
            const s = (performance.now() - t0) / 1000;
            const mbps = total * 8 / s / 1e6;
            lines.push("Ping (min/3): " + Math.min(...pings).toFixed(0) + " ms");
            lines.push("Download (" + (total / 1024).toFixed(0) + " KB in " + s.toFixed(2) + " s): " + mbps.toFixed(2) + " Mbps");
            upload();
          }
        }).catch(() => { lines.push("Download-Messung fehlgeschlagen."); setOut(lines.join("\n")); });
      }
    }
    function upload() {
      const payload = new Uint8Array(200 * 1024);
      for (let i = 0; i < payload.length; i++) payload[i] = i % 251;
      const t0 = performance.now();
      fetch(bust("./index.html"), { method: "POST", body: payload }).then(() => {
        const s = (performance.now() - t0) / 1000;
        lines.push("Upload (200 KB in " + s.toFixed(2) + " s): " + (200 * 8 / s / 1024).toFixed(2) + " Mbps");
        setOut(lines.join("\n"));
      }).catch(() => {
        lines.push("Upload: vom Server abgewiesen (statisches Hosting nimmt kein POST an) — nicht messbar.");
        setOut(lines.join("\n"));
      });
    }
    ping(0);
  }
  return (
    <div class="tool-form">
      <button type="button" onClick={run}>Messung starten</button>
      <div class="output">{out()}</div>
    </div>
  );
}

/* ---------- Sortier-Planer ---------- */
const SORTMAP = {
  ".jpg": "Bilder", ".jpeg": "Bilder", ".png": "Bilder", ".gif": "Bilder", ".webp": "Bilder",
  ".mp4": "Videos", ".mkv": "Videos", ".mov": "Videos", ".avi": "Videos",
  ".mp3": "Musik", ".wav": "Musik", ".flac": "Musik",
  ".zip": "Archive", ".rar": "Archive", ".7z": "Archive",
  ".pdf": "PDFs", ".docx": "Dokumente", ".xlsx": "Dokumente", ".pptx": "Dokumente", ".txt": "Textdateien",
  ".py": "Code", ".js": "Code", ".html": "Code", ".css": "Code",
  ".exe": "Programme", ".msi": "Programme",
};
export function ViewSorting() {
  const [groups, setGroups] = createSignal([]);
  const [scripts, setScripts] = createSignal(null);
  function onFiles(fileList) {
    const g = {}, seen = {};
    Array.from(fileList).forEach((f) => {
      const m = f.name.match(/(\.[^.]+)$/);
      const ext = m ? m[1].toLowerCase() : "";
      const folder = SORTMAP[ext] || "Unbekannt";
      let name = f.name, i = 1;
      const base = name.replace(/(\.[^.]+)$/, ""), suf = m ? m[1] : "";
      while (seen[folder + "/" + name]) { name = base + "_" + (i++) + suf; }
      seen[folder + "/" + name] = 1;
      (g[folder] = g[folder] || []).push(name);
    });
    const names = Object.keys(g).sort();
    setGroups(names.map((k) => [k, g[k]]));
    if (names.length) {
      let ps = '# Erzeugt von d5 Sortier-Planer (Quelle: sorting-script/sort.py)\n$basis = "E:\\Sortiert"\n';
      let sh = '# Erzeugt von d5 Sortier-Planer (Quelle: sorting-script/sort.py)\nbasis="$HOME/Sortiert"\n';
      names.forEach((k) => {
        ps += 'New-Item -ItemType Directory -Force -Path "$basis\\' + k + '" | Out-Null\n';
        sh += 'mkdir -p "$basis/' + k + '"\n';
        g[k].forEach((n) => {
          ps += 'Move-Item -LiteralPath "$basis\\' + n + '" -Destination "$basis\\' + k + '\\' + n + '" -ErrorAction SilentlyContinue\n';
          sh += 'mv "$basis/' + n + '" "$basis/' + k + '/" 2>/dev/null\n';
        });
      });
      setScripts({ ps, sh });
    } else setScripts(null);
  }
  function dl(name, text) {
    const a = document.createElement("a");
    a.href = URL.createObjectURL(new Blob([text], { type: "text/plain" }));
    a.download = name; a.click();
    setTimeout(() => URL.revokeObjectURL(a.href), 5000);
  }
  return (
    <div class="tool-form">
      <label>Dateien wählen (bleiben wo sie sind)
        <input type="file" multiple onChange={(e) => onFiles(e.target.files)} />
      </label>
      <Show when={groups().length} fallback={<p class="meta">Keine Dateien gewählt.</p>}>
        <For each={groups()}>{([k, items]) => (
          <div>
            <h2>{k} ({items.length})</h2>
            <pre class="meta">{items.join("\n")}</pre>
          </div>
        )}</For>
        <Show when={scripts()}>
          <div>
            <button type="button" onClick={() => dl("sortieren.ps1", scripts().ps)}>sortieren.ps1 herunterladen</button>{" "}
            <button type="button" onClick={() => dl("sortieren.sh", scripts().sh)}>sortieren.sh herunterladen</button>
          </div>
        </Show>
      </Show>
    </div>
  );
}

/* ---------- ToDo ---------- */
export function ViewTodo() {
  const [items, setItems] = createSignal(storeGet("todo", []));
  const [inp, setInp] = createSignal("");
  function addIt() {
    if (!inp().trim()) return;
    const next = [...items(), { title: inp().trim(), done: false }];
    setItems(next); storeSet("todo", next);
    setInp("");
  }
  function act(i, a) {
    let next = items().slice();
    if (a === "d") next.splice(i, 1);
    else if (a === "t") next[i] = { ...next[i], done: !next[i].done };
    else {
      const v = prompt("Aufgabe bearbeiten:", next[i].title);
      if (v != null && v.trim()) next[i] = { ...next[i], title: v.trim() };
    }
    setItems(next); storeSet("todo", next);
  }
  return (
    <div class="tool-form">
      <label>Aufgabe <input value={inp()} onInput={(e) => setInp(e.target.value)} placeholder="Neue Aufgabe"
        onKeyDown={(e) => { if (e.key === "Enter") addIt(); }} /></label>
      <button type="button" onClick={addIt}>Add</button>
      <div>
        <Show when={!items().length} fallback={
          <For each={items()}>{(t, i) => (
            <article class="card">
              <p>{t.done ? <s>{t.title}</s> : t.title}</p>
              <p class="meta">
                <button type="button" onClick={() => act(i(), "t")}>{t.done ? "Reopen" : "Fertig"}</button>{" "}
                <button type="button" onClick={() => act(i(), "e")}>Edit</button>{" "}
                <button type="button" onClick={() => act(i(), "d")}>Delete</button>
              </p>
            </article>
          )}</For>
        }>
          <p class="meta">Keine Aufgaben. Lege oben eine an.</p>
        </Show>
      </div>
    </div>
  );
}

/* ---------- NoteNest (AES-GCM) ---------- */
const ENC = new TextEncoder();
const DEC = new TextDecoder();
function keyFrom(p) {
  return crypto.subtle.importKey("raw", ENC.encode(p), "PBKDF2", false, ["deriveKey"]).then((base) =>
    crypto.subtle.deriveKey({ name: "PBKDF2", salt: ENC.encode("d5-notenest"), iterations: 50000, hash: "SHA-256" },
      base, { name: "AES-GCM", length: 256 }, false, ["encrypt", "decrypt"]));
}
const b64 = (buf) => { const b = new Uint8Array(buf); let s = ""; for (let i = 0; i < b.length; i++) s += String.fromCharCode(b[i]); return btoa(s); };
const unb64 = (s) => { const bin = atob(s); const b = new Uint8Array(bin.length); for (let i = 0; i < bin.length; i++) b[i] = bin.charCodeAt(i); return b; };
export function ViewNotes() {
  const [pw, setPw] = createSignal("");
  const [title, setTitle] = createSignal("");
  const [body, setBody] = createSignal("");
  const [items, setItems] = createSignal(storeGet("notes", []));
  const [key, setKey] = createSignal(null);
  const [out, setOut] = createSignal("");
  const [plain, setPlain] = createSignal({});
  function saveNote() {
    if (!pw() || !title().trim()) { setOut("Passwort und Titel eingeben."); return; }
    keyFrom(pw()).then((k) => {
      setKey(() => k);
      const iv = crypto.getRandomValues(new Uint8Array(12));
      return crypto.subtle.encrypt({ name: "AES-GCM", iv }, k, ENC.encode(body())).then((ct) => {
        const next = [{ title: title().trim(), iv: b64(iv), data: b64(ct) }, ...items()];
        setItems(next); storeSet("notes", next);
        setTitle(""); setBody("");
      });
    });
  }
  return (
    <div class="tool-form">
      <label>Passwort <input type="password" value={pw()} onInput={(e) => setPw(e.target.value)} placeholder="Passwort (Schlüssel)"
        onChange={() => { if (!pw()) return; keyFrom(pw()).then((k) => { setKey(() => k); setItems(storeGet("notes", [])); }); }} /></label>
      <label>Titel <input value={title()} onInput={(e) => setTitle(e.target.value)} placeholder="Titel" /></label>
      <label>Inhalt <textarea value={body()} onInput={(e) => setBody(e.target.value)} placeholder="Inhalt" /></label>
      <button type="button" onClick={saveNote}>Verschlüsselt speichern</button>
      <div>
        <h2>{items().length} Notizen</h2>
        {out() && <p>{out()}</p>}
        <For each={items()}>{(n, i) => (
          <article class="card">
            <h3>{n.title}</h3>
            <p class="meta">
              <button type="button" onClick={() => {
                const k = key();
                if (!k) { setOut("Erst Passwort eingeben."); return; }
                crypto.subtle.decrypt({ name: "AES-GCM", iv: unb64(n.iv) }, k, unb64(n.data)).then((pt) => {
                  setPlain({ ...plain(), [i()]: DEC.decode(pt) });
                }).catch(() => alert("Falsches Passwort oder beschädigte Notiz."));
              }}>Entschlüsseln</button>{" "}
              <button type="button" onClick={() => { const next = items().slice(); next.splice(i(), 1); setItems(next); storeSet("notes", next); }}>Löschen</button>
            </p>
            <p class="meta">{plain()[i()] || "🔒 verschlüsselt"}</p>
          </article>
        )}</For>
      </div>
    </div>
  );
}

/* ---------- Edge-Payload-Decoder ---------- */
export function ViewDataopt() {
  const [text, setText] = createSignal("");
  const [out, setOut] = createSignal("");
  function run() {
    let o;
    try { o = JSON.parse(text()); } catch { setOut("Kein gültiges JSON."); return; }
    const d = String(o.d || "");
    const ts = d.length === 12
      ? "20" + d.slice(0,2) + "-" + d.slice(2,4) + "-" + d.slice(4,6) + " " + d.slice(6,8) + ":" + d.slice(8,10) + ":" + d.slice(10,12)
      : String(o.d);
    setOut("Gerät: " + o.i + "\nStandort: " + o.a + "\nBehälter Farbe/Braun/Weiß: " +
      (o.x && o.x.a) + "/" + (o.x && o.x.b) + "/" + (o.x && o.x.c) +
      "\nZeit: " + ts + "\nBatterie: " + o.p + " %\nVoll: Farbe=" + (o.f && o.f[0]) +
      " Braun=" + (o.f && o.f[1]) + " Weiß=" + (o.f && o.f[2]));
  }
  return (
    <div class="tool-form">
      <label>Kompakt-Payload <textarea value={text()} onInput={(e) => setText(e.target.value)} placeholder='{"i":"…","a":"…","x":{"a":…,"b":…,"c":…},"d":"YYMMDDHHMMSS","p":…,"f":[0/1,0/1,0/1]}' /></label>
      <button type="button" onClick={run}>Dekodieren</button>
      <div class="output">{out()}</div>
    </div>
  );
}
