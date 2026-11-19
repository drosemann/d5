/* Server-system plugin ports from app/mc-tools.js — 21 tools. */
import { createSignal, onCleanup, For, Show } from "solid-js";
import { storeGet, storeSet } from "../store.js";
import { runPseudo } from "../logic.js";

export function ViewLock() {
  const [msg, setMsg] = createSignal(storeGet("lock-pin", "1234") === "1234" ? "Default-PIN: 1234 — setze deine PIN." : "Gesperrt. PIN eingeben.");
  const [pin, setPin] = createSignal("");
  return (
    <div class="tool-form">
      <p class="meta">{msg()}</p>
      <input type="password" placeholder="PIN" value={pin()} onInput={(e) => setPin(e.target.value)} />
      <button onClick={() => {
        if (!pin()) return;
        if (storeGet("lock-pin", "1234") === "1234" && msg().startsWith("Default")) {
          storeSet("lock-pin", pin()); setMsg("PIN gesetzt. Gesperrt — PIN eingeben.");
        } else if (pin() === storeGet("lock-pin", "")) setMsg("Entsperrt. Sitzung aktiv.");
        else setMsg("Falsche PIN.");
        setPin("");
      }}>Entsperren / Setzen</button>
    </div>
  );
}

export function ViewTablist() {
  const [list, setList] = createSignal(storeGet("tablist", [{ n: "Steve", ping: 42 }, { n: "Alex", ping: 87 }]));
  const [inp, setInp] = createSignal("");
  const sorted = () => list().slice().sort((a, b) => a.ping - b.ping);
  function save(next) { setList(next); storeSet("tablist", next); }
  return (
    <div>
      <h3>Tabliste ({list().length})</h3>
      <For each={sorted()}>{(p) => (
        <p class="meta">{p.n} — {p.ping}ms
          <button onClick={() => save(storeGet("tablist", []).filter((q) => q.n !== p.n))}>x</button>
        </p>
      )}</For>
      <input placeholder="Spielername" value={inp()} onInput={(e) => setInp(e.target.value)} />
      <button onClick={() => {
        const n = inp().trim(); if (!n) return;
        const l = storeGet("tablist", []);
        l.push({ n, ping: 20 + Math.floor(Math.random() * 120) });
        save(l); setInp("");
      }}>Hinzufügen</button>
    </div>
  );
}

export function ViewAutosave() {
  const [secs, setSecs] = createSignal("60");
  const [msg, setMsg] = createSignal("Bereit.");
  const [log, setLog] = createSignal("");
  let timer = null, left = 0;
  onCleanup(() => clearInterval(timer));
  function tick() {
    if (--left <= 0) {
      const n = storeGet("autosave-n", 0) + 1; storeSet("autosave-n", n);
      setLog((l) => l + "Welt gespeichert (#" + n + ")\n");
      left = parseInt(secs(), 10) || 60;
    }
    setMsg("Nächster Autosave in " + left + "s");
  }
  return (
    <div class="tool-form">
      <p class="meta">Intervall (s):</p>
      <input type="number" value={secs()} onInput={(e) => setSecs(e.target.value)} />
      <button onClick={() => { clearInterval(timer); left = parseInt(secs(), 10) || 60; timer = setInterval(tick, 1000); }}>Start</button>
      <button onClick={() => { clearInterval(timer); setMsg("Bereit."); }}>Stopp</button>
      <p class="meta">{msg()}</p>
      <pre class="result">{log()}</pre>
    </div>
  );
}

export function ViewRestart() {
  const [secs, setSecs] = createSignal("30");
  const [msg, setMsg] = createSignal("Bereit.");
  const [log, setLog] = createSignal("");
  let timer = null, left = 0;
  onCleanup(() => clearInterval(timer));
  return (
    <div class="tool-form">
      <input type="number" value={secs()} onInput={(e) => setSecs(e.target.value)} />
      <button onClick={() => {
        clearInterval(timer); left = parseInt(secs(), 10) || 30;
        setLog((l) => l + "Restart in " + left + "s angekündigt.\n");
        timer = setInterval(() => {
          left--;
          if (left <= 0) { clearInterval(timer); setLog((l) => l + "Server startet neu … (simuliert)\n"); setMsg("Bereit."); return; }
          if (left <= 5 || left % 10 === 0) setLog((l) => l + "Broadcast: Restart in " + left + "s!\n");
          setMsg("Restart in " + left + "s");
        }, 1000);
      }}>Restart planen</button>
      <p class="meta">{msg()}</p>
      <pre class="result">{log()}</pre>
    </div>
  );
}

const LOOT = ["Holzschwert", "Eisenbrust", "Goldapfel", "Bogen", "Enderperle", "Diamant", "Verzauberungsbuch", "Netheritbarren"];
export function ViewChest() {
  const [out, setOut] = createSignal([]);
  function open() {
    const n = 3 + Math.floor(Math.random() * 3);
    const arr = [];
    for (let i = 0; i < n; i++) {
      const r = Math.random();
      arr.push("[" + (r < 0.6 ? "common" : r < 0.9 ? "rare" : "EPIC") + "] " + LOOT[Math.floor(Math.random() * LOOT.length)]);
    }
    setOut(arr);
  }
  return (
    <div>
      <button onClick={open}>Kiste öffnen</button>
      <div><For each={out()}>{(it) => <p class="meta">{it}</p>}</For></div>
    </div>
  );
}

export function ViewRanditem() {
  const [inv, setInv] = createSignal(storeGet("randitem", []));
  return (
    <div class="tool-form">
      <button onClick={() => { const n = [...inv(), LOOT[Math.floor(Math.random() * LOOT.length)]]; setInv(n); storeSet("randitem", n); }}>Zufalls-Item</button>
      <button onClick={() => { setInv([]); storeSet("randitem", []); }}>Inventar leeren</button>
      <div>
        <Show when={inv().length} fallback={<p class="meta">Inventar leer.</p>}>
          <For each={inv()}>{(it) => <p class="meta">{it}</p>}</For>
        </Show>
      </div>
    </div>
  );
}

const QUESTS = [
  { id: "q1", name: "Baue 10 Blöcke ab", need: 10 },
  { id: "q2", name: "Besiege 5 Gegner", need: 5 },
  { id: "q3", name: "Sammle 3 Diamanten", need: 3 },
];
export function ViewQuests() {
  const [state, setState] = createSignal(storeGet("quests", {}));
  function save(next) { setState(next); storeSet("quests", next); }
  return (
    <div>
      <For each={QUESTS}>{(q) => {
        const p = () => state()[q.id] || 0;
        return (
          <>
            <p class="meta">{q.name} — {Math.min(p(), q.need)}/{q.need}{p() >= q.need ? " ABGESCHLOSSEN" : ""}</p>
            {p() < q.need && <button onClick={() => { const s = { ...storeGet("quests", {}) }; s[q.id] = (s[q.id] || 0) + 1; save(s); }}>+1 {q.id}</button>}
          </>
        );
      }}</For>
      <button onClick={() => save({})}>Zurücksetzen</button>
    </div>
  );
}

export function ViewLobby() {
  const [msg, setMsg] = createSignal("Wähle einen Server.");
  return (
    <div>
      <p class="meta">{msg()}</p>
      <For each={[["Lobby", 124], ["BedWars-1", 16], ["BuildFFA", 9], ["ClanWars-Arena", 23]]}>{(s) => (
        <button onClick={() => setMsg("Verbinde mit " + s[0] + " … verbunden! (simuliert)")} style={{ margin: "2px" }}>
          {s[0]} ({s[1]} online)
        </button>
      )}</For>
    </div>
  );
}

export function ViewDirect() {
  const [host, setHost] = createSignal("localhost");
  const [port, setPort] = createSignal("25565");
  const [msg, setMsg] = createSignal("");
  return (
    <div class="tool-form">
      <input placeholder="Host" value={host()} onInput={(e) => setHost(e.target.value)} />
      <input type="number" placeholder="Port" value={port()} onInput={(e) => setPort(e.target.value)} />
      <button onClick={() => {
        const ms = 15 + Math.floor(Math.random() * 120);
        setMsg("Ping " + (host() || "localhost") + ":" + (port() || "25565") + " — " + ms + "ms, Server online (simuliert).");
      }}>Verbinden</button>
      <p class="meta">{msg()}</p>
    </div>
  );
}

export function ViewElytra() {
  const [boost, setBoost] = createSignal("1.5");
  const [angle, setAngle] = createSignal("20");
  const [msg, setMsg] = createSignal("");
  return (
    <div class="tool-form">
      <p class="meta">Boost-Faktor:</p>
      <input type="number" value={boost()} onInput={(e) => setBoost(e.target.value)} />
      <p class="meta">Gleitwinkel (Grad):</p>
      <input type="number" value={angle()} onInput={(e) => setAngle(e.target.value)} />
      <button onClick={() => {
        const b = parseFloat(boost()) || 1, a = parseFloat(angle()) || 0;
        const dist = Math.round(100 * b * Math.cos(a * Math.PI / 180));
        setMsg("Reichweite: ~" + dist + " Blöcke · Speed: ~" + (12 * b).toFixed(1) + " m/s (Näherung).");
      }}>Berechnen</button>
      <p class="meta">{msg()}</p>
    </div>
  );
}

export function ViewHorde() {
  const [wave, setWave] = createSignal(storeGet("horde-wave", 1));
  const [hp, setHp] = createSignal(0);
  const [msg, setMsg] = createSignal("");
  function startWave(w) {
    setWave(w); storeSet("horde-wave", w);
    const h = 10 + w * 5;
    setHp(h);
    setMsg("Welle " + w + ": Gegner-HP " + h + " — klicken zum Schlagen (5 DMG).");
  }
  startWave(wave());
  return (
    <div class="tool-form">
      <p class="meta">{msg()}</p>
      <button onClick={() => {
        const h = hp() - 5;
        if (h <= 0) startWave(wave() + 1);
        else { setHp(h); setMsg("Welle " + wave() + ": Gegner-HP " + h); }
      }}>Schlagen</button>
      <button onClick={() => startWave(1)}>Reset</button>
    </div>
  );
}

export function ViewTemplate() {
  const [name, setName] = createSignal("MyGame");
  const [out, setOut] = createSignal("");
  return (
    <div class="tool-form">
      <input placeholder="Minigame-Name" value={name()} onInput={(e) => setName(e.target.value)} />
      <button onClick={() => {
        const n = (name() || "MyGame").trim();
        setOut("name: " + n + "\nversion: 1.0.0\nmain: com.example." + n.toLowerCase() + "." + n + "\narenas:\n  - name: arena1\n    spawns: 8\n    min-players: 2");
      }}>Generieren</button>
      <pre class="result">{out()}</pre>
      <button onClick={() => {
        const blob = new Blob([out() || "# erst Generieren klicken"], { type: "text/yaml" });
        const a = document.createElement("a");
        a.href = URL.createObjectURL(blob);
        a.download = "plugin.yml";
        document.body.appendChild(a); a.click();
        setTimeout(() => document.body.removeChild(a), 100);
      }}>Download .yml</button>
    </div>
  );
}

export function ViewAnticheat() {
  const [msg, setMsg] = createSignal("Klicke so schnell du kannst (5s-Fenster).");
  let clicks = [], timer = null;
  onCleanup(() => { if (timer) clearTimeout(timer); });
  return (
    <div class="tool-form">
      <p class="meta">{msg()}</p>
      <button onClick={() => {
        if (!timer) timer = setTimeout(() => {
          const cps = (clicks.length / 5).toFixed(1);
          setMsg(clicks.length + " Klicks = " + cps + " CPS — " + (cps > 12 ? "FLAG: Autoclicker-Verdacht!" : "OK: menschlich."));
          clicks = []; timer = null;
        }, 5000);
        clicks.push(Date.now());
        setMsg("Klicks: " + clicks.length + " …");
      }}>Klicken</button>
    </div>
  );
}

export function ViewRolesync() {
  const [map, setMap] = createSignal(storeGet("rolesync", { Owner: "Admin", Member: "Spieler" }));
  const [a, setA] = createSignal("");
  const [b, setB] = createSignal("");
  function save(next) { setMap(next); storeSet("rolesync", next); }
  return (
    <div>
      <For each={Object.keys(map())}>{(mc) => (
        <p class="meta">MC: {mc} ⇄ Discord: {map()[mc]} {""}
          <button onClick={() => { const d = { ...map() }; delete d[mc]; save(d); }}>x</button>
        </p>
      )}</For>
      <input placeholder="MC-Rang" value={a()} onInput={(e) => setA(e.target.value)} />
      <input placeholder="Discord-Rolle" value={b()} onInput={(e) => setB(e.target.value)} />
      <button onClick={() => {
        if (!a().trim()) return;
        save({ ...map(), [a().trim()]: b().trim() || a().trim() });
        setA(""); setB("");
      }}>Mappen</button>
    </div>
  );
}

export function ViewSandstone() {
  let grid = [];
  for (let i = 0; i < 24; i++) grid.push(Math.random() < 0.3 ? "sandstone" : "stone");
  const count = () => grid.filter((g) => g === "sandstone").length;
  const [out, setOut] = createSignal("Blöcke: " + grid.length + ", davon Sandstein: " + count());
  return (
    <div>
      <p class="meta">{out()}</p>
      <button onClick={() => {
        const n = count();
        grid = grid.map(() => "stone");
        setOut(n + " Sandsteinblöcke entfernt. Übrig: " + grid.length + " stone.");
      }}>Sandstein entfernen</button>
    </div>
  );
}

export function ViewArena() {
  const [msg, setMsg] = createSignal("Arena intakt.");
  let timer = null, left = 0;
  onCleanup(() => clearInterval(timer));
  return (
    <div class="tool-form">
      <p class="meta">{msg()}</p>
      <button onClick={() => {
        clearInterval(timer); left = 60; setMsg("Match läuft. Reset in 60s.");
        timer = setInterval(() => {
          if (--left <= 0) { clearInterval(timer); setMsg("Arena zurückgesetzt. Bereit."); return; }
          setMsg("Match läuft. Reset in " + left + "s.");
        }, 1000);
      }}>Match starten (Reset in 60s)</button>
    </div>
  );
}

export function ViewLocate() {
  const [seed, setSeed] = createSignal("12345");
  const [kind, setKind] = createSignal("Village");
  const [msg, setMsg] = createSignal("");
  return (
    <div class="tool-form">
      <input placeholder="Seed" value={seed()} onInput={(e) => setSeed(e.target.value)} />
      <select value={kind()} onChange={(e) => setKind(e.target.value)}>
        <For each={["Village", "Stronghold", "Nether Fortress", "End City"]}>{(s) => <option value={s}>{s}</option>}</For>
      </select>
      <button onClick={() => {
        let h = 0;
        const str = seed() + kind();
        for (let i = 0; i < str.length; i++) h = (h * 31 + str.charCodeAt(i)) >>> 0;
        setMsg(kind() + " bei X=" + (h % 3000 - 1500) + " Z=" + ((h >> 8) % 3000 - 1500) + " (deterministisch aus Seed).");
      }}>Finden</button>
      <p class="meta">{msg()}</p>
    </div>
  );
}

export function ViewTnt() {
  const [blocked, setBlocked] = createSignal(storeGet("tnt-blocked", 0));
  const [on, setOn] = createSignal(true);
  return (
    <div>
      <p class="meta">TNT-Schaden: {on() ? "AN" : "AUS"}. Blockiert bisher: {blocked()}</p>
      <button onClick={() => {
        const next = !on();
        setOn(next);
        if (!next) { const b = blocked() + 1 + Math.floor(Math.random() * 5); setBlocked(b); storeSet("tnt-blocked", b); }
      }}>Umschalten</button>
    </div>
  );
}

export function ViewVoice() {
  const [msg, setMsg] = createSignal("Nicht verbunden.");
  return (
    <div>
      <p class="meta">{msg()}</p>
      <For each={["Lobby", "Team Rot", "Team Blau"]}>{(c) => (
        <button style={{ margin: "2px" }} onClick={() => setMsg("Im Channel: " + c + " — sprich (simuliert, Reichweite 30 Blöcke).")}>{c} beitreten</button>
      )}</For>
      <button onClick={() => setMsg("Nicht verbunden.")}>Verlassen</button>
    </div>
  );
}

export function ViewHello() {
  const [name, setName] = createSignal("Welt");
  const [msg, setMsg] = createSignal("");
  return (
    <div class="tool-form">
      <input placeholder="Name" value={name()} onInput={(e) => setName(e.target.value)} />
      <button onClick={() => setMsg("Hello, " + (name() || "Welt") + "!")}>Grüßen</button>
      <p class="meta">{msg()}</p>
    </div>
  );
}

export function ViewPseudo() {
  const [src, setSrc] = createSignal("SET x 5\nLOOP 3\n  ADD x 2\nPRINT x");
  const [out, setOut] = createSignal("");
  return (
    <div class="tool-form">
      <textarea rows="6" cols="40" value={src()} onInput={(e) => setSrc(e.target.value)} />
      <button onClick={() => setOut(runPseudo(src()))}>Ausführen</button>
      <pre class="result">{out()}</pre>
    </div>
  );
}
