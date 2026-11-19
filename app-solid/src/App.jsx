/* d5 super-app shell in SolidJS — port of app/app.js (router, home, catalog, project, tools, go). */
import { createSignal, onCleanup, For, Show, createMemo } from "solid-js";
import { CATALOG } from "./catalog.js";
import { ViewCalc, ViewBmi, ViewBruch, ViewTokyo, ViewVerbrauch, ViewWetter } from "./tools/CalcTools.jsx";
import { ViewSnake, ViewTictactoe, ViewPong, ViewHangman, ViewGuess, View2048, ViewTank, ViewTama, ViewViz, ViewPark } from "./tools/Games.jsx";
import { ViewBedwars, ViewBuildffa, ViewClanwars } from "./tools/McGames.jsx";
import { ViewGuestbook, ViewSignin, ViewShortener, ViewGo } from "./tools/Apps.jsx";
import { ViewSplitwise, ViewSpeedtest, ViewSorting, ViewTodo, ViewNotes, ViewDataopt } from "./tools/Apps2.jsx";
import { ViewLock, ViewTablist, ViewAutosave, ViewRestart, ViewChest, ViewRanditem, ViewQuests, ViewLobby, ViewDirect, ViewElytra, ViewHorde, ViewTemplate, ViewAnticheat, ViewRolesync, ViewSandstone, ViewArena, ViewLocate, ViewTnt, ViewVoice, ViewHello, ViewPseudo } from "./tools/McTools.jsx";
import { ViewFortune, ViewApocalypse, ViewHearth, ViewRealms, ViewChall, ViewStreuland } from "./tools/McMisc.jsx";
import { ViewTrip } from "./tools/Trip.jsx";

const RUNNABLE = {
  "github-repos-stranded-horizons": "game.html",
  "cloud,-hosting-&-saas-uptime-site": "public/index.html",
  "utilities-&-desktop-tools-clearcall": "client/index.html",
  "startup-business-concepts-securestream-vpn": "client/index.html",
  "startup-business-concepts-zapfile-html-css-javascript": "indexs.html",
  "browser-games-color-cascade-browser-video-game": "color-cascade/index.html",
  "archive-unsorted-cascadeprojects": "windsurf-project/index.html",
  "browser-games-browser-game": "index.html",
  "personal-client-websites-volcan-chico": "index.html",
};

const PORTED = {
  "archive-unsorted-calculator": "calc",
  "archive-unsorted-bodymassindex": "bmi",
  "archive-unsorted-die_klasse_bruch": "bruch",
  "archive-unsorted-tokyo-metro-pricing": "tokyo",
  "archive-unsorted-kilometerz-hler": "verbrauch",
  "archive-unsorted-kilometerzähler": "verbrauch",
  "archive-unsorted-wetter-daten-analyse": "wetter",
  "browser-games-snake": "snake",
  "browser-games-tic-tac-toe": "tictactoe",
  "browser-games-ping-pong": "pong",
  "archive-unsorted-guestbook-html-css-javascript": "guestbook",
  "productivity-&-sharing-apps-link-shortener": "shortener",
  "productivity-&-sharing-apps-shortify": "shortener",
  "productivity-sharing-apps-splitwise": "splitwise",
  "productivity-sharing-apps-todo": "todo",
  "utilities-desktop-tools-speedtest": "speedtest",
  "utilities-desktop-tools-speedsnap": "speedtest",
  "utilities-desktop-tools-sorting-script": "sorting",
  "minecraft-plugins-&-server-systems-bedwars": "bedwars",
  "minecraft-plugins-&-server-systems-buildffa-revamp": "buildffa",
  "minecraft-plugins-&-server-systems-clan-wars": "clanwars",
  "minecraft-plugins-server-systems-automatic-login-plugin": "signin",
  "minecraft-plugins-server-systems-autosaver-minecraft": "autosave",
  "minecraft-plugins-server-systems-broadcast-restart-plugin": "restart",
  "minecraft-plugins-server-systems-chestspawner": "chest",
  "minecraft-plugins-server-systems-connecthub-java-mc-plugin": "lobby",
  "minecraft-plugins-server-systems-directserverconnect": "direct",
  "minecraft-plugins-server-systems-elytra-plugin": "elytra",
  "minecraft-plugins-server-systems-horden-plugin": "horde",
  "minecraft-plugins-server-systems-lobby-system-minecraft": "lobby",
  "minecraft-plugins-server-systems-minecraft-minigame-template": "template",
  "minecraft-plugins-server-systems-minecraft-anticheat": "anticheat",
  "minecraft-plugins-server-systems-minigametemplate-java": "template",
  "minecraft-plugins-server-systems-questsystem": "quests",
  "minecraft-plugins-server-systems-randomitem": "randitem",
  "minecraft-plugins-server-systems-rolesync": "rolesync",
  "minecraft-plugins-server-systems-sandstone-remover-pocketmine": "sandstone",
  "minecraft-plugins-server-systems-sessionlockplugin": "lock",
  "minecraft-plugins-server-systems-tablist": "tablist",
  "minecraft-plugins-server-systems-voicechat": "voice",
  "minecraft-plugins-&-server-systems-arena-auto-reset": "arena",
  "minecraft-plugins-&-server-systems-locate-structure-minecraft": "locate",
  "minecraft-plugins-&-server-systems-tnt-remover": "tnt",
  "utilities-desktop-tools-sessionlock": "lock",
  "archive-unsorted-helloworld": "hello",
  "learning-projects-pseudocode": "pseudo",
  "archive-unsorted-pillars-of-fortune": "fortune",
  "minecraft-game-concepts-apocalypseunleashed": "apocalypse",
  "minecraft-game-concepts-challenges-source": "chall",
  "startup-business-concepts-hearthrift": "hearth",
  "browser-games-browser-game-open-world-minigame": "realms",
  "github-repos-streuland": "streuland",
  "browser-games-hangmen": "hangman",
  "browser-games-guess-the-number": "guess",
  "browser-games-2048": "play2048",
  "browser-games-tank-shooter-browser": "tank",
  "browser-games-tamagotchi-game": "tama",
  "utilities-&-desktop-tools-audio_visualizer": "viz",
};

const TOOLS = [
  { id: "calc", title: "Calculator", desc: "25 ops, mirrors archive-unsorted-calculator.", View: ViewCalc },
  { id: "bmi", title: "BMI Rechner", desc: "Mirrors bodymassindex thresholds verbatim.", View: ViewBmi },
  { id: "bruch", title: "Klasse Bruch", desc: "Fraction reduce via gcd.", View: ViewBruch },
  { id: "tokyo", title: "Tokyo Metro Pricing", desc: "Fare table by distance.", View: ViewTokyo },
  { id: "verbrauch", title: "Kilometerzähler", desc: "Fuel consumption per 100 km.", View: ViewVerbrauch },
  { id: "wetter", title: "Wetter Daten Analyse", desc: "Record parser + sort.", View: ViewWetter },
  { id: "snake", title: "Snake", desc: "Port of browser-games-snake.", View: ViewSnake },
  { id: "tictactoe", title: "Tic-Tac-Toe", desc: "Human X vs random bot O + tally.", View: ViewTictactoe },
  { id: "pong", title: "Ping Pong", desc: "W/S vs AI, first to 5, points shop.", View: ViewPong },
  { id: "hangman", title: "Hangman", desc: "Port of browser-games-hangmen: German words, 7 tries.", View: ViewHangman },
  { id: "guess", title: "Guess the Number", desc: "Port of guess-the-number: 1-100, 10 tries.", View: ViewGuess },
  { id: "play2048", title: "2048", desc: "Port of browser-games-2048: slide and merge to 2048.", View: View2048 },
  { id: "tank", title: "TankBlaster", desc: "Port of tank-shooter-browser: dodge and shoot.", View: ViewTank },
  { id: "tama", title: "Tamagotchi", desc: "Port of tamagotchi-game backend: feed/play/sleep, localStorage.", View: ViewTama },
  { id: "viz", title: "Audio Visualizer", desc: "Port of audio_visualizer: mic or demo tone bars.", View: ViewViz },
  { id: "trip", title: "Trip to the Makers", desc: "Meta HQ pilgrimage: timed days, checklist, budget, sights, videos.", View: ViewTrip },
  { id: "park", title: "Theme Park Tycoon", desc: "Build rides, attract visitors, reach €5000.", View: ViewPark },
  { id: "bedwars", title: "BedWars (web)", desc: "Native rewrite of the Java BedWars plugin: generators, shop tiers, bed armor, events.", View: ViewBedwars },
  { id: "buildffa", title: "BuildFFA (web)", desc: "Native rewrite of the Java BuildFFA plugin: arena FFA, kills/deaths/KD.", View: ViewBuildffa },
  { id: "clanwars", title: "ClanWars (web)", desc: "Native rewrite of the Java ClanWars plugin: clans, battles, ratings.", View: ViewClanwars },
  { id: "guestbook", title: "Guestbook", desc: "BBCode + validation, localStorage backend.", View: ViewGuestbook },
  { id: "signin", title: "Login Demo", desc: "Local auth demo.", View: ViewSignin },
  { id: "shortener", title: "Link Shortener", desc: "Base62 + visit counter.", View: ViewShortener },
  { id: "splitwise", title: "Splitwise", desc: "Equal splits, balances, settle-up.", View: ViewSplitwise },
  { id: "speedtest", title: "Speedtest", desc: "Live ping + download.", View: ViewSpeedtest },
  { id: "sorting", title: "Sortier-Planer", desc: "Extension map, exports move scripts.", View: ViewSorting },
  { id: "todo", title: "ToDo", desc: "Task list with localStorage.", View: ViewTodo },
  { id: "notes", title: "NoteNest", desc: "AES-GCM encrypted notes.", View: ViewNotes },
  { id: "dataopt", title: "Edge-Payload-Decoder", desc: "Payload decoder.", View: ViewDataopt },
  { id: "lock", title: "SessionLock", desc: "Port of SessionLock/sessionlockplugin: PIN lock screen.", View: ViewLock },
  { id: "tablist", title: "Tablist", desc: "Port of tablist: player list with ping.", View: ViewTablist },
  { id: "autosave", title: "Autosaver", desc: "Port of autosaver-minecraft: interval world saves.", View: ViewAutosave },
  { id: "restart", title: "BroadcastRestart", desc: "Port of broadcast-restart-plugin: restart countdown.", View: ViewRestart },
  { id: "chest", title: "ChestSpawner", desc: "Port of chestspawner: loot chest generator.", View: ViewChest },
  { id: "randitem", title: "RandomItem", desc: "Port of randomitem: timed random drops.", View: ViewRanditem },
  { id: "quests", title: "QuestSystem", desc: "Port of questsystem: quest tracker.", View: ViewQuests },
  { id: "lobby", title: "Lobby + ConnectHub", desc: "Port of lobby-system/connecthub: server selector.", View: ViewLobby },
  { id: "direct", title: "DirectServerConnect", desc: "Port of directserverconnect: host/port ping.", View: ViewDirect },
  { id: "elytra", title: "Elytra", desc: "Port of elytra-plugin: glide calculator.", View: ViewElytra },
  { id: "horde", title: "Horden", desc: "Port of horden-plugin: horde waves.", View: ViewHorde },
  { id: "template", title: "MinigameTemplate", desc: "Port of minigame-template(s): starter-kit generator.", View: ViewTemplate },
  { id: "anticheat", title: "AntiCheat", desc: "Port of minecraft-anticheat: CPS detector demo.", View: ViewAnticheat },
  { id: "rolesync", title: "RoleSync", desc: "Port of rolesync: MC/Discord role mapper.", View: ViewRolesync },
  { id: "sandstone", title: "SandstoneRemover", desc: "Port of sandstone-remover: block filter sim.", View: ViewSandstone },
  { id: "arena", title: "ArenaAutoReset", desc: "Port of arena-auto-reset: reset timer.", View: ViewArena },
  { id: "locate", title: "LocateStructure", desc: "Port of locate-structure: seed-based finder.", View: ViewLocate },
  { id: "tnt", title: "TNTRemover", desc: "Port of tnt-remover: blast toggle.", View: ViewTnt },
  { id: "voice", title: "VoiceChat", desc: "Port of voicechat: channel sim.", View: ViewVoice },
  { id: "hello", title: "HelloWorld", desc: "Port of archive-unsorted-helloworld.", View: ViewHello },
  { id: "pseudo", title: "Pseudocode Runner", desc: "Tiny SET/ADD/PRINT/LOOP interpreter.", View: ViewPseudo },
  { id: "fortune", title: "PillarsOfFortune", desc: "Port of pillars-of-fortune: timed loot pillar.", View: ViewFortune },
  { id: "apocalypse", title: "ApocalypseUnleashed", desc: "Port of apocalypseunleashed: survive 15 disasters.", View: ViewApocalypse },
  { id: "hearth", title: "Hearthrift", desc: "Port of hearthrift: daily + PvP rewards.", View: ViewHearth },
  { id: "realms", title: "RealmOfWonders", desc: "Port of open-world-minigame: stats + achievements.", View: ViewRealms },
  { id: "chall", title: "Challenges", desc: "Port of challenges-source: timed challenge runner.", View: ViewChall },
  { id: "streuland", title: "Streuland Invites", desc: "Port of streuland invite-code signup flow.", View: ViewStreuland },
];

const SECTIONS = [
  { id: "everyday", title: "Everyday", ids: ["calc", "bmi", "bruch", "tokyo", "verbrauch", "wetter", "todo", "notes", "shortener", "splitwise", "guestbook", "signin", "speedtest", "sorting", "dataopt", "lock"] },
  { id: "play", title: "Play", ids: ["snake", "tictactoe", "pong", "hangman", "guess", "play2048", "tank", "tama", "viz", "park", "trip"] },
  { id: "minecraft", title: "Minecraft & servers", ids: ["bedwars", "buildffa", "clanwars", "lobby", "direct", "quests", "chest", "randitem", "arena", "locate", "tnt", "voice", "autosave", "restart", "tablist", "elytra", "horde", "template", "anticheat", "rolesync", "sandstone"] },
  { id: "stories", title: "Worlds & stories", ids: ["hello", "pseudo", "fortune", "apocalypse", "hearth", "realms", "chall", "streuland"] },
];

function storeGet(k, fb) { try { const v = JSON.parse(localStorage.getItem(k)); return v == null ? fb : v; } catch { return fb; } }
function storeSet(k, v) { try { localStorage.setItem(k, JSON.stringify(v)); } catch { /* ignore */ } }
function favs() { return storeGet("d5_fav", []); }
function isFav(id) { return favs().includes(id); }
function toggleFav(id) {
  const f = favs();
  const i = f.indexOf(id);
  if (i >= 0) f.splice(i, 1); else f.push(id);
  storeSet("d5_fav", f);
}
function pushRecent(id) {
  const r = storeGet("d5_recent", []).filter((x) => x !== id);
  r.unshift(id);
  storeSet("d5_recent", r.slice(0, 8));
}
function toolById(id) { return TOOLS.find((t) => t.id === id) || null; }
function bySlug(s) { return CATALOG.find((e) => e.slug === s) || null; }
function rank(e) { return PORTED[e.slug] ? 0 : (RUNNABLE[e.slug] ? 1 : 2); }
function searchAll(q) {
  q = (q || "").toLowerCase().trim();
  if (!q) return { tools: [], entries: [] };
  const tools = TOOLS.filter((t) => (t.id + " " + t.title + " " + t.desc).toLowerCase().includes(q)).slice(0, 8);
  const entries = CATALOG.filter((e) => (e.slug + " " + e.name + " " + e.category + " " + e.stack).toLowerCase().includes(q));
  entries.sort((a, b) => rank(a) - rank(b));
  return { tools, entries: entries.slice(0, 12) };
}
function sourceWhy(e) {
  const s = (e.stack || "") + " " + (e.status || "");
  if (/Minecraft|Bukkit|Spigot|Java/i.test(s)) return "Runs on a Java/Minecraft server (Bukkit/Spigot API) — a browser cannot load it. Play the native rewrite under Tools instead.";
  if (/Flutter|Dart/.test(s)) return "Needs the Flutter/Dart toolchain to build — not runnable from a static page.";
  if (/Flask|Django|PHP|MySQL|backend/i.test(s)) return "Needs a server backend (or database) — the static app replaces it with an in-browser port where one exists.";
  if (/Discord bot/i.test(s)) return "A Discord bot needs tokens and a live gateway connection — kept as source.";
  return "Kept as source: no browser entry point (desktop tooling, scripts, or data).";
}

function useHash() {
  const [hash, setHash] = createSignal(location.hash || "#/");
  const on = () => { setHash(location.hash || "#/"); window.scrollTo(0, 0); };
  window.addEventListener("hashchange", on);
  onCleanup(() => window.removeEventListener("hashchange", on));
  return hash;
}

function ToolCard({ t }) {
  const [fav, setFav] = createSignal(isFav(t.id));
  return (
    <div class="card">
      <strong>{t.title}</strong>
      <p class="meta">{t.desc}</p>
      <div class="card-row">
        <a class="btn" href={"#/tool/" + t.id}>Open</a>
        <button class="fav" title="Favorite" onClick={() => { toggleFav(t.id); setFav(isFav(t.id)); }}>{fav() ? "★" : "☆"}</button>
      </div>
    </div>
  );
}

function Home() {
  const [q, setQ] = createSignal("");
  const res = createMemo(() => searchAll(q()));
  const recent = () => storeGet("d5_recent", []).map(toolById).filter(Boolean);
  const favList = () => favs().map(toolById).filter(Boolean);
  return (
    <>
      <h2>d5</h2>
      <p class="meta">{TOOLS.length} tools · {CATALOG.length} library entries · static, no backend.</p>
      <input class="search" type="search" placeholder="Search tools and library…" value={q()} onInput={(e) => setQ(e.target.value)} />
      <Show when={q().trim()}>
        <div class="cards">
          <For each={res().tools}>{(t) => <ToolCard t={t} />}</For>
          <For each={res().entries}>{(e) => (
            <div class="card">
              <strong>{e.name}</strong>
              <p class="meta">{e.category} · {e.stack}</p>
              <a href={PORTED[e.slug] ? "#/tool/" + PORTED[e.slug] : "#/project/" + encodeURIComponent(e.slug)}>
                {PORTED[e.slug] ? "Open native port" : (RUNNABLE[e.slug] ? "Open embed" : "Library entry")}
              </a>
            </div>
          )}</For>
          <Show when={!res().tools.length && !res().entries.length}>
            <p class="meta">No matches. Try the full library below.</p>
          </Show>
        </div>
      </Show>
      <Show when={recent().length}>
        <h3>Continue</h3>
        <div class="cards"><For each={recent()}>{(t) => <ToolCard t={t} />}</For></div>
      </Show>
      <Show when={favList().length}>
        <h3>Favorites</h3>
        <div class="cards"><For each={favList()}>{(t) => <ToolCard t={t} />}</For></div>
      </Show>
      <For each={SECTIONS}>{(s) => (
        <>
          <h3>{s.title}</h3>
          <div class="cards"><For each={s.ids.map(toolById).filter(Boolean)}>{(t) => <ToolCard t={t} />}</For></div>
        </>
      )}</For>
      <p class="meta"><a href="#/catalog">Browse the full {CATALOG.length}-entry library (source + embeds) →</a></p>
    </>
  );
}

function Catalog({ q }) {
  const [filter, setFilter] = createSignal(q || "");
  const list = createMemo(() => {
    const f = filter().toLowerCase();
    return CATALOG.slice().sort((a, b) => rank(a) - rank(b))
      .filter((e) => !f || (e.slug + " " + e.name + " " + e.category + " " + e.stack).toLowerCase().includes(f));
  });
  return (
    <>
      <h2>Library</h2>
      <p class="meta">{CATALOG.length} entries. Native ports open directly — this shelf keeps every source project and embed.</p>
      <input type="search" placeholder="filter…" value={filter()} onInput={(e) => setFilter(e.target.value)} />
      <div class="cards">
        <For each={list()}>{(e) => (
          <div class="card">
            <strong>{e.name}</strong>
            <p class="meta">{e.category} · {e.stack}</p>
            <a href={PORTED[e.slug] ? "#/tool/" + PORTED[e.slug] : "#/project/" + encodeURIComponent(e.slug)}>
              {PORTED[e.slug] ? "Open native port" : "Details"}
            </a>
          </div>
        )}</For>
      </div>
    </>
  );
}

function Project({ slug }) {
  const [readme, setReadme] = createSignal("Loading README…");
  const e = bySlug(slug);
  if (!e) return <><h2>Not found</h2><p class="meta">No project with slug {slug}</p></>;
  fetch(import.meta.env.BASE_URL + e.path + "/README.md").then((r) => {
    if (!r.ok) throw 0;
    return r.text();
  }).then((t) => setReadme(t.slice(0, 4000))).catch(() => {
    setReadme(e.hasReadme ? "README present in repo (fetch blocked — serve the repo root)." : "No README in repo.");
  });
  const tool = PORTED[e.slug] ? toolById(PORTED[e.slug]) : null;
  return (
    <>
      <h2>{e.name}</h2>
      <p class="meta">{e.category} · {e.stack}</p>
      <p class="meta">{e.status}</p>
      <Show when={PORTED[e.slug]}>
        <p>Native web port: {tool ? tool.title : PORTED[e.slug]}</p>
        <a class="btn" href={"#/tool/" + PORTED[e.slug]}>Open the working port</a>
      </Show>
      <Show when={!PORTED[e.slug] && RUNNABLE[e.slug]}>
        <iframe class="embed" title={e.name} src={import.meta.env.BASE_URL + e.path + "/" + RUNNABLE[e.slug]} />
        <p class="meta">Embedded from {e.path}/{RUNNABLE[e.slug]}</p>
      </Show>
      <Show when={!PORTED[e.slug] && !RUNNABLE[e.slug]}>
        <p>{sourceWhy(e)}</p>
        <p class="meta">Source lives in {e.path} — open it from the repo checkout.</p>
      </Show>
      <pre class="meta">{readme()}</pre>
    </>
  );
}

function ToolsPage() {
  return (
    <>
      <h2>Tools</h2>
      <p class="meta">{TOOLS.length} working in-browser tools. Star your favorites — they surface on Home.</p>
      <For each={SECTIONS}>{(s) => (
        <>
          <h3>{s.title}</h3>
          <div class="cards"><For each={s.ids.map(toolById).filter(Boolean)}>{(t) => <ToolCard t={t} />}</For></div>
        </>
      )}</For>
    </>
  );
}

function ToolPage({ id, arg }) {
  const t = toolById(id);
  if (!t) return <><h2>No such tool</h2><p class="meta">{id}</p></>;
  pushRecent(id);
  const [fav, setFav] = createSignal(isFav(id));
  const V = t.View;
  return (
    <>
      <h2>{t.title}</h2>
      <p class="meta">{t.desc}</p>
      <a href="#/tools">← all tools</a>
      <button class="fav-wide" onClick={() => { toggleFav(id); setFav(isFav(id)); }}>{fav() ? "★ Favorited" : "☆ Favorite"}</button>
      {t.id === "trip" ? <V arg={arg} /> : <V />}
    </>
  );
}

export default function App() {
  const hash = useHash();
  const route = createMemo(() => {
    const h = hash();
    if (h === "#/" || h === "") return { kind: "home" };
    if (h.startsWith("#/catalog")) return { kind: "catalog", q: decodeURIComponent(h.slice(10) || "") };
    if (h.startsWith("#/project/")) return { kind: "project", slug: decodeURIComponent(h.slice(10)) };
    if (h.startsWith("#/tool/")) {
      const rest = h.slice(7).split("/");
      return { kind: "tool", id: rest[0], arg: rest[1] && decodeURIComponent(rest[1]) };
    }
    if (h.startsWith("#/go/")) return { kind: "go", code: decodeURIComponent(h.slice(5)) };
    if (h === "#/library") return { kind: "catalog", q: "" };
    if (h === "#/tools") return { kind: "tools" };
    return { kind: "notfound", h };
  });
  return (
    <>
      <header class="top">
        <h1><a href="#/">d5</a></h1>
        <p class="tag">one super-app — pick up where you left off</p>
        <nav>
          <a href="#/">Home</a>
          <a href="#/tools">Tools</a>
          <a href="#/catalog">Library</a>
        </nav>
      </header>
      <main id="view">
        {(() => {
          const r = route();
          if (r.kind === "home") return <Home />;
          if (r.kind === "catalog") return <Catalog q={r.q} />;
          if (r.kind === "project") return <Project slug={r.slug} />;
          if (r.kind === "tool") return <ToolPage id={r.id} arg={r.arg} />;
          if (r.kind === "go") return <ViewGo code={r.code} />;
          if (r.kind === "tools") return <ToolsPage />;
          return <><h2>Not found</h2><p class="meta">{r.h}</p></>;
        })()}
      </main>
      <footer class="foot"><p>d5 super-app · static build · no backend</p></footer>
    </>
  );
}
