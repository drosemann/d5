/* Fortune / Apocalypse / Hearth / Realms / Chall / Streuland — ported from app/mc-misc.js. */
import { createSignal, onCleanup, For } from "solid-js";
import { storeGet, storeSet } from "../store.js";

const FORTUNE_LOOT = ["Diamant", "Goldapfel", "Enderperle", "Eisenblock", "Bogen", "Verzauberungsbuch", "Netherit", "Smaragd"];
export function ViewFortune() {
  const [interval, setInterval] = createSignal("5");
  const [msg, setMsg] = createSignal("Säule aktiv. Warte auf Drops…");
  const [log, setLog] = createSignal("");
  let timer = null, n = 0;
  onCleanup(() => clearInterval(timer));
  return (
    <div class="tool-form">
      <p class="meta">Drop-Intervall (s):</p>
      <input type="number" value={interval()} onInput={(e) => setInterval(e.target.value)} />
      <button onClick={() => {
        clearInterval(timer); n = 0;
        timer = setInterval(() => {
          n++;
          const count = 1 + Math.floor(Math.random() * 3);
          const items = [];
          for (let i = 0; i < count; i++) items.push(FORTUNE_LOOT[Math.floor(Math.random() * FORTUNE_LOOT.length)]);
          setLog((l) => l + "Drop #" + n + ": " + items.join(", ") + "\n");
          try { new Audio(); } catch { /* no asset shipped */ }
          setMsg("Drop #" + n + " gefallen!");
        }, (parseInt(interval(), 10) || 5) * 1000);
      }}>Säule starten</button>
      <button onClick={() => { clearInterval(timer); setMsg("Säule gestoppt."); }}>Stopp</button>
      <p class="meta">{msg()}</p>
      <pre class="result">{log()}</pre>
    </div>
  );
}

const DISASTERS = ["Säureregen", "Asteroidenregen", "Blizzard", "Erdbeben", "Flut", "Heuschrecken", "Meteor", "Seuche", "Strahlung", "Sandsturm", "Erdloch", "Gewitter", "Tornado", "Vulkan", "Waldbrand"];
export function ViewApocalypse() {
  const [hp, setHp] = createSignal(100);
  const [active, setActive] = createSignal(null);
  const [over, setOver] = createSignal(false);
  const [survived, setSurvived] = createSignal(0);
  const [msg, setMsg] = createSignal("Apokalypse bereit. Starte und suche bei Katastrophen Schutz!");
  let timer = null;
  onCleanup(() => clearInterval(timer));
  return (
    <div class="tool-form">
      <p class="meta">HP: {hp()} · Überlebt: {survived()}</p>
      <p class="meta">{msg()}</p>
      <button onClick={() => {
        if (!active() || over()) return;
        setHp((h) => Math.min(100, h + 15));
        setActive({ ...active(), sheltered: true });
        setMsg("Du suchst Schutz vor " + active().name + "!");
      }}>Schutz suchen</button>
      <button onClick={() => {
        clearInterval(timer);
        setHp(100); setSurvived(0); setOver(false); setActive(null);
        timer = setInterval(() => {
          if (over()) { clearInterval(timer); return; }
          const act = active();
          if (!act) {
            const next = { name: DISASTERS[Math.floor(Math.random() * DISASTERS.length)], ticks: 3, sheltered: false };
            setActive(next);
            setMsg(next.name + "! Such Schutz!");
            return;
          }
          const dmg = act.sheltered ? 5 : 15 + Math.floor(Math.random() * 10);
          setHp((h) => Math.max(0, h - dmg));
          let ticks = act.ticks - 1;
          let surv = survived();
          let nextActive = { ...act, sheltered: false, ticks };
          if (ticks <= 0) {
            surv++; setSurvived(surv);
            nextActive = null;
          }
          setActive(nextActive);
          if (hp() - dmg <= 0) {
            setHp(0); setOver(true);
            const best = Math.max(storeGet("apoc-best", 0), surv); storeSet("apoc-best", best);
            setMsg("Du bist umgekommen. Überlebt: " + surv + " · Rekord: " + best);
          } else {
            setMsg(nextActive ? nextActive.name + " wütet! (-" + dmg + " HP)" : "Ruhig…");
          }
        }, 1200);
      }}>Apokalypse starten</button>
    </div>
  );
}

export function ViewHearth() {
  const [d, setD] = createSignal(storeGet("hearth", { streak: 0, last: "", pvp: 0 }));
  const today = () => new Date().toISOString().slice(0, 10);
  const yest = () => new Date(Date.now() - 864e5).toISOString().slice(0, 10);
  const can = () => d().last !== today();
  return (
    <div>
      <p class="meta">Streak: {d().streak} Tage · PvP-Siege: {d().pvp}</p>
      <button disabled={!can()} onClick={() => {
        const cur = storeGet("hearth", { streak: 0, last: "", pvp: 0 });
        if (cur.last === today()) return;
        const next = { ...cur, streak: cur.last === yest() ? cur.streak + 1 : 1, last: today() };
        storeSet("hearth", next); setD(next);
      }}>{can() ? "Tagesbelohnung abholen" : "Heute schon abgeholt"}</button>
      <button onClick={() => { const cur = { ...storeGet("hearth", { streak: 0, last: "", pvp: 0 }) }; cur.pvp++; storeSet("hearth", cur); setD(cur); }}>PvP-Sieg eintragen</button>
      <p class="meta">Bonus: +{10 + Math.min(d().streak, 7) * 5 + d().pvp * 2} Münzen (Streak + PvP).</p>
    </div>
  );
}

const ACH = ["Erster Beitritt", "10 Kills", "5 Tode überlebt", "Reisender (3 Welten)"];
export function ViewRealms() {
  const [s, setS] = createSignal(storeGet("realms", { kills: 0, deaths: 0, worlds: 1, ach: [] }));
  const lvl = () => 1 + Math.floor(s().kills / 5);
  return (
    <div class="tool-form">
      <p class="meta">Level {lvl()} · Kills {s().kills} · Deaths {s().deaths} · Welten {s().worlds}</p>
      <For each={ACH}>{(a) => {
        const got = () => s().ach.includes(a);
        return (
          <button onClick={() => {
            const cur = { ...storeGet("realms", { kills: 0, deaths: 0, worlds: 1, ach: [] }) };
            if (a === "10 Kills") cur.kills += 10;
            else if (a === "5 Tode überlebt") cur.deaths += 5;
            else if (a.startsWith("Reisender")) cur.worlds = 3;
            if (!cur.ach.includes(a)) cur.ach = [...cur.ach, a];
            storeSet("realms", cur); setS(cur);
          }}>{got() ? "✓ " : "+ "}{a}</button>
        );
      }}</For>
      <button onClick={() => { const next = { kills: 0, deaths: 0, worlds: 1, ach: [] }; storeSet("realms", next); setS(next); }}>Reset</button>
    </div>
  );
}

const CHALLENGES = ["Kein Springen", "Kein Schaden", "Nur Holzwerkzeuge", "Speedrun 60s", "Kein Sprint"];
export function ViewChall() {
  const [msg, setMsg] = createSignal("Wähle eine Challenge und halte durch!");
  const [log, setLog] = createSignal("");
  const [done, setDone] = createSignal(0);
  let timer = null;
  onCleanup(() => clearInterval(timer));
  return (
    <div class="tool-form">
      <p class="meta">{msg()}</p>
      <For each={CHALLENGES}>{(c) => (
        <button onClick={() => {
          clearInterval(timer);
          let t = 60, n = done();
          setMsg(c + " läuft: 60s durchhalten!");
          timer = setInterval(() => {
            t--;
            if (t <= 0) {
              clearInterval(timer);
              n++; setDone(n);
              setLog((l) => l + "GESCHAFFT: " + c + "\n");
              setMsg("Challenge geschafft! (" + n + " heute)");
            } else setMsg(c + " läuft: noch " + t + "s");
          }, 1000);
        }}>{c} starten</button>
      )}</For>
      <pre class="result">{log()}</pre>
    </div>
  );
}

export function ViewStreuland() {
  const [d, setD] = createSignal(storeGet("streuland", { codes: {}, users: [] }));
  const [inp, setInp] = createSignal("");
  const [name, setName] = createSignal("");
  const [msg, setMsg] = createSignal("");
  function save(next) {
    setD(next); storeSet("streuland", next);
  }
  return (
    <div class="tool-form">
      <h3>Einladungen ({Object.keys(d().codes).length})</h3>
      <button onClick={() => {
        const cur = storeGet("streuland", { codes: {}, users: [] });
        let code = "";
        for (let i = 0; i < 8; i++) code += "ABCDEFGHJKMNPQRSTUVWXYZ23456789"[Math.floor(Math.random() * 32)];
        cur.codes[code] = { used: false, created: Date.now() };
        save(cur);
      }}>Code erzeugen</button>
      <input placeholder="CODE eingeben" value={inp()} onInput={(e) => setInp(e.target.value)} />
      <input placeholder="Benutzername" value={name()} onInput={(e) => setName(e.target.value)} />
      <button onClick={() => {
        const cur = storeGet("streuland", { codes: {}, users: [] });
        const c = (inp() || "").trim().toUpperCase();
        if (!cur.codes[c]) { setMsg("Ungültiger Code."); return; }
        if (cur.codes[c].used) { setMsg("Code bereits verwendet."); return; }
        if (!name().trim()) { setMsg("Benutzernamen eingeben."); return; }
        cur.codes[c].used = true;
        cur.users = [...cur.users, name().trim()];
        save(cur);
        setMsg("Willkommen, " + name().trim() + "!");
      }}>Registrieren</button>
      <p class="meta">{msg()}</p>
      <p class="meta">{d().users.length ? "Registriert: " + d().users.join(", ") : "Noch niemand registriert."}</p>
    </div>
  );
}
