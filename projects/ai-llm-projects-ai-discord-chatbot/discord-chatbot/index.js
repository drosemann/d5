function safeRequire(name) {
  try { return require(name); } catch (e) { return null; }
}
safeRequire('dotenv') && safeRequire('dotenv').config();

const path = require('path');
const fs = require('fs');

const Discord = safeRequire('discord.js');
const axios = safeRequire('axios');

const DISCORD_TOKEN = process.env.DISCORD_TOKEN;
const OLLAMA_API = process.env.OLLAMA_API;
const MODEL = process.env.MODEL || 'qwen:0.5b';
const STATE_PATH = process.env.STATE_PATH || path.join(__dirname, 'd5-state.json');
const TOKEN_PLACEHOLDER = 'dein_discord_bot_token';

// Spiegel des d5-Tool-Registers (app/app.js TOOLS): lauffaehige Ports,
// die der Bot per !d5 tools anbietet und der KI als Kontext mitgibt.
const TOOLS = [
  { id: 'calc', title: 'Calculator' }, { id: 'bmi', title: 'BMI Rechner' },
  { id: 'bruch', title: 'Klasse Bruch' }, { id: 'tokyo', title: 'Tokyo Metro Pricing' },
  { id: 'verbrauch', title: 'Kilometerzaehler' }, { id: 'wetter', title: 'Wetter Daten Analyse' },
  { id: 'todo', title: 'ToDo' }, { id: 'notes', title: 'NoteNest' },
  { id: 'shortener', title: 'Link Shortener' }, { id: 'splitwise', title: 'Splitwise' },
  { id: 'guestbook', title: 'Guestbook' }, { id: 'signin', title: 'Login Demo' },
  { id: 'speedtest', title: 'Speedtest' }, { id: 'sorting', title: 'Sortier-Planer' },
  { id: 'dataopt', title: 'Edge-Payload-Decoder' }, { id: 'snake', title: 'Snake' },
  { id: 'tictactoe', title: 'Tic-Tac-Toe' }, { id: 'pong', title: 'Ping Pong' },
  { id: 'hangman', title: 'Hangman' }, { id: 'guess', title: 'Guess the Number' },
  { id: 'play2048', title: '2048' }, { id: 'tank', title: 'TankBlaster' },
  { id: 'tama', title: 'Tamagotchi' }, { id: 'viz', title: 'Audio Visualizer' },
  { id: 'trip', title: 'Trip to the Makers' }, { id: 'park', title: 'Theme Park Tycoon' },
  { id: 'bedwars', title: 'BedWars (web)' }, { id: 'buildffa', title: 'BuildFFA (web)' },
  { id: 'clanwars', title: 'ClanWars (web)' }, { id: 'lock', title: 'SessionLock' },
  { id: 'tablist', title: 'Tablist' }, { id: 'autosave', title: 'Autosaver' },
  { id: 'restart', title: 'BroadcastRestart' }, { id: 'chest', title: 'ChestSpawner' },
  { id: 'randitem', title: 'RandomItem' }, { id: 'quests', title: 'QuestSystem' },
  { id: 'lobby', title: 'Lobby + ConnectHub' }, { id: 'direct', title: 'DirectServerConnect' },
  { id: 'elytra', title: 'Elytra' }, { id: 'horde', title: 'Horden' },
  { id: 'template', title: 'MinigameTemplate' }, { id: 'anticheat', title: 'AntiCheat' },
  { id: 'rolesync', title: 'RoleSync' }, { id: 'sandstone', title: 'SandstoneRemover' },
  { id: 'arena', title: 'ArenaAutoReset' }, { id: 'locate', title: 'LocateStructure' },
  { id: 'tnt', title: 'TNTRemover' }, { id: 'voice', title: 'VoiceChat' },
  { id: 'hello', title: 'HelloWorld' }, { id: 'pseudo', title: 'Pseudocode Runner' },
  { id: 'fortune', title: 'PillarsOfFortune' }, { id: 'apocalypse', title: 'ApocalypseUnleashed' },
  { id: 'hearth', title: 'Hearthrift' }, { id: 'realms', title: 'RealmOfWonders' },
  { id: 'chall', title: 'Challenges' }, { id: 'streuland', title: 'Streuland Invites' }
];

// Stil-Personas: reine System-Prompts auf dem eingestellten Ollama-Modell —
// das sind Persiflagen zum Umschalten, NICHT die echten Modelle/APIs.
const PERSONAS = {
  d5: { title: 'd5 Assistent', desc: 'Sachlich, kurz, hilfsbereit. Standard.',
    style: 'Antworte sachlich, kurz und konkret auf Deutsch.' },
  claude: { title: 'Sexy Claude', desc: 'Wortgewandt, charmant, ein bisschen frech (Persona).',
    style: 'Du bist charmant, wortgewandt und ein bisschen frech — witzig, aber immer respektvoll und jugendfrei. Antworte auf Deutsch, mit Esprit, ohne Kitsch.' },
  gpt: { title: 'GPT', desc: 'Strukturiert, Listen, Schritt-für-Schritt.',
    style: 'Du antwortest strukturiert: kurze Einleitung, dann Stichpunkte oder nummerierte Schritte, dann ein Satz Fazit. Deutsch, präzise, ohne Floskeln.' },
  gemini: { title: 'Gemini', desc: 'Freundlich, neugierig, erklärt gern.',
    style: 'Du bist freundlich und neugierig, erklärst Zusammenhänge gern mit einem Beispiel aus dem Alltag. Deutsch, warmherzig, nie herablassend.' },
  grok: { title: 'Grok', desc: 'Trockener Humor, direkte Antworten.',
    style: 'Du antwortest mit trockenem Humor und schonungsloser Direktheit, bleibst aber fair und hilfreich. Deutsch, schlagfertig, keine Emojis-Flut.' },
  twitter: { title: 'Twitter', desc: 'Kurz, pointiert, Thread-Stil.',
    style: 'Du antwortest wie virale Tweets: extrem kurz, pointiert, gern in 1-3 nummerierten Tweet-Häppchen unter je 280 Zeichen. Deutsch, kein Fülltext.' }
};

const conversationHistory = new Map();

// ---------- Persistenter Mini-State (Todos + Feed je Discord-User) ----------
function blankUser() { return { todos: [], feed: [], notes: [], reminders: 0, chats: 0, persona: 'd5' }; }
function blankState() { return { users: {}, links: {} }; }
function loadState(statePath) {
  const p = statePath || STATE_PATH;
  try {
    const raw = fs.readFileSync(p, 'utf8');
    const s = JSON.parse(raw);
    if (s && typeof s === 'object' && s.users && typeof s.users === 'object') {
      if (!s.links || typeof s.links !== 'object') s.links = {};
      for (const uid of Object.keys(s.users)) {
        if (!Array.isArray(s.users[uid].notes)) s.users[uid].notes = [];
        if (!Array.isArray(s.users[uid].todos)) s.users[uid].todos = [];
        if (!Array.isArray(s.users[uid].feed)) s.users[uid].feed = [];
        if (typeof s.users[uid].persona !== 'string' || !PERSONAS[s.users[uid].persona]) s.users[uid].persona = 'd5';
      }
      return s;
    }
  } catch (e) { /* fehlend oder kaputt -> leer starten */ }
  return blankState();
}
function saveState(state, statePath) {
  const p = statePath || STATE_PATH;
  const tmp = p + '.tmp';
  fs.writeFileSync(tmp, JSON.stringify(state, null, 2), 'utf8');
  fs.renameSync(tmp, p);
}
function getUser(state, userId) {
  if (!state.users[userId]) state.users[userId] = blankUser();
  return state.users[userId];
}
function addTodo(state, userId, text) {
  const u = getUser(state, userId);
  u.todos.push({ text: text.slice(0, 200), done: false, ts: Date.now() });
  return u.todos.length;
}
function listTodos(state, userId) { return getUser(state, userId).todos; }
function completeTodo(state, userId, n) {
  const todos = getUser(state, userId).todos;
  if (!Number.isInteger(n) || n < 1 || n > todos.length) return null;
  todos[n - 1].done = true;
  return todos[n - 1];
}
function clearTodos(state, userId) {
  const u = getUser(state, userId);
  const done = u.todos.filter((t) => t.done).length;
  u.todos = u.todos.filter((t) => !t.done);
  return { done: done, open: u.todos.length };
}
function postFeed(state, userId, text) {
  const u = getUser(state, userId);
  u.feed.unshift({ text: text.slice(0, 280), ts: Date.now() });
  u.feed = u.feed.slice(0, 50);
  return u.feed.length;
}
function getStats(state, userId) {
  const u = getUser(state, userId);
  return {
    open: u.todos.filter((t) => !t.done).length,
    done: u.todos.filter((t) => t.done).length,
    posts: u.feed.length,
    notes: u.notes.length,
    reminders: u.reminders,
    chats: u.chats
  };
}

// ---------- Notizen / Kurzlinks / Umfragen ----------
const B62 = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
function genCode(existing) {
  let code;
  do {
    code = '';
    for (let i = 0; i < 6; i++) code += B62[Math.floor(Math.random() * 62)];
  } while (existing && existing[code]);
  return code;
}
function isHttpUrl(s) { return /^https?:\/\/.+\..+/.test(String(s || '').trim()); }
function addNote(state, userId, text) {
  const u = getUser(state, userId);
  u.notes.unshift({ text: text.slice(0, 500), ts: Date.now() });
  u.notes = u.notes.slice(0, 50);
  return u.notes.length;
}
function addLink(state, userId, url) {
  if (!state.links || typeof state.links !== 'object') state.links = {};
  const code = genCode(state.links);
  state.links[code] = { url: url.trim(), by: userId, visits: 0, ts: Date.now() };
  return code;
}
function parseRemind(args) {
  const m = String(args || '').match(/^(\d+)\s+(.+)$/s);
  if (!m) return { error: 'Bitte so: !d5 remind <Minuten 1-1440> <Text>' };
  const mins = parseInt(m[1], 10);
  if (!Number.isFinite(mins) || mins < 1 || mins > 1440) return { error: 'Minuten muessen zwischen 1 und 1440 liegen.' };
  return { mins: mins, text: m[2].slice(0, 500) };
}
const POLL_EMOJI = ['1️⃣', '2️⃣', '3️⃣', '4️⃣', '5️⃣', '6️⃣', '7️⃣', '8️⃣', '9️⃣'];
function parsePoll(args) {
  const parts = String(args || '').split('|').map((s) => s.trim()).filter(Boolean);
  if (parts.length < 3) return { error: 'Bitte so: !d5 poll <Frage> | <Option 1> | <Option 2> [| Option 3 …]' };
  if (parts.length - 1 > POLL_EMOJI.length) return { error: 'Maximal ' + POLL_EMOJI.length + ' Optionen.' };
  return { question: parts[0].slice(0, 200), options: parts.slice(1).map((o) => o.slice(0, 100)) };
}

// ---------- Katalog-Suche (d5-Bibliothek, 152 Eintraege) ----------
let catalogCache = null;
function loadCatalog() {
  if (catalogCache) return catalogCache;
  const candidates = [
    path.join(__dirname, '..', '..', '..', 'app', 'catalog.json'),
    path.join(__dirname, '..', '..', 'app', 'catalog.json'),
    path.join(__dirname, 'catalog.json')
  ];
  for (const c of candidates) {
    try {
      const entries = JSON.parse(fs.readFileSync(c, 'utf8'));
      if (Array.isArray(entries)) { catalogCache = entries; return entries; }
    } catch (e) { /* naechster Kandidat */ }
  }
  return [];
}
function searchCatalog(query, catalog) {
  const q = String(query || '').toLowerCase().trim();
  if (!q) return [];
  const entries = catalog || loadCatalog();
  return entries.filter((e) => {
    const hay = (e.slug + ' ' + e.name + ' ' + (e.category || '') + ' ' + (e.stack || '')).toLowerCase();
    return hay.indexOf(q) >= 0;
  }).slice(0, 5);
}

// ---------- Befehle ----------
function helpText() {
  return 'd5 Super-App Bot — Befehle (Erwaehnung oder !d5 davor):\n' +
    '!d5 help — diese Hilfe\n' +
    '!d5 tools [Suche] — lauffaehige d5-Tools auflisten\n' +
    '!d5 find <Suchwort> — d5-Bibliothek durchsuchen\n' +
    '!d5 todo add <Text> | list | done <Nr> | clear — deine Todos\n' +
    '!d5 note add <Text> | list | clear — kurze Notizen\n' +
    '!d5 feed <Text> | feed show — Mini-Feed (wird der KI als Kontext mitgegeben)\n' +
    '!d5 link <URL> | link list — Kurzlink anlegen (d5:CODE)\n' +
    '!d5 poll <Frage> | <Opt1> | <Opt2> — Umfrage mit Reaktionen\n' +
    '!d5 remind <Minuten 1-1440> <Text> — Erinnerung\n' +
    '!d5 stats — deine Uebersicht\n' +
    'Alles andere geht an die KI (Ollama) — sie kennt deine Todos/deinen Feed.';
}
function parseCommand(content, botId) {
  let text = String(content || '');
  if (botId) text = text.replace(new RegExp('<@!?' + botId + '>', 'g'), '').trim();
  const m = text.match(/^!d5\s+(.*)$/s);
  const body = m ? m[1].trim() : text.trim();
  if (!body) return { cmd: 'help', args: '' };
  const sp = body.indexOf(' ');
  if (sp < 0) return { cmd: body.toLowerCase(), args: '' };
  return { cmd: body.slice(0, sp).toLowerCase(), args: body.slice(sp + 1).trim() };
}
function toolList(query) {
  const q = String(query || '').toLowerCase().trim();
  const hits = TOOLS.filter((t) => !q || t.id.indexOf(q) >= 0 || t.title.toLowerCase().indexOf(q) >= 0).slice(0, 15);
  if (!hits.length) return 'Keine d5-Tools gefunden. !d5 tools ohne Filter zeigt alle IDs.';
  return 'd5-Tools (' + hits.length + '):\n' + hits.map((t) => '- ' + t.id + ' — ' + t.title).join('\n');
}
function personaOf(state, userId) {
  const id = getUser(state, userId).persona;
  return PERSONAS[id] ? id : 'd5';
}
function buildSystemPrompt(stats, historyCount, personaId) {
  const p = PERSONAS[personaId] || PERSONAS.d5;
  return 'Du bist der d5 Super-App Assistent in Discord (' + p.title + '). ' + p.style + ' ' +
    'd5 vereint viele Projekte in einer App ' +
    '(Tools: ' + TOOLS.map((t) => t.id).join(', ') + '). ' +
    'Kontext zum User: ' + stats.open + ' offene Todos, ' + stats.done + ' erledigte, ' + stats.notes + ' Notizen, ' +
    stats.posts + ' Feed-Posts, ' + stats.reminders + ' Erinnerungen gestellt, ' +
    historyCount + ' Nachrichten im Verlauf. Biete bei passender Gelegenheit !d5-Befehle an.';
}

async function runCommand(cmd, args, userId, reply) {
  const state = loadState();
  if (cmd === 'help') return reply(helpText());
  if (cmd === 'tools') return reply(toolList(args));
  if (cmd === 'find') {
    if (!args) return reply('Bitte Suchwort angeben: !d5 find <Suchwort>');
    const hits = searchCatalog(args);
    if (!hits.length) return reply('Nichts gefunden fuer "' + args + '".');
    return reply(hits.map((e) => '- ' + e.name + ' [' + (e.category || '?') + ', ' + (e.stack || '?') + ']\n  ' + e.slug).join('\n'));
  }
  if (cmd === 'todo') {
    const parts = args.split(/\s+/);
    const sub = (parts[0] || 'list').toLowerCase();
    if (sub === 'add') {
      const text = args.slice(4).trim();
      if (!text) return reply('Bitte Text angeben: !d5 todo add <Text>');
      const n = addTodo(state, userId, text);
      saveState(state);
      return reply('Todo #' + n + ' gespeichert: ' + text.slice(0, 200));
    }
    if (sub === 'list') {
      const todos = listTodos(state, userId);
      if (!todos.length) return reply('Keine Todos. Neu: !d5 todo add <Text>');
      return reply(todos.map((t, i) => (i + 1) + '. [' + (t.done ? 'x' : ' ') + '] ' + t.text).join('\n'));
    }
    if (sub === 'done') {
      const t = completeTodo(state, userId, parseInt(parts[1], 10));
      if (!t) return reply('Ungueltige Nummer. !d5 todo list zeigt die Nummern.');
      saveState(state);
      return reply('Erledigt: ' + t.text);
    }
    if (sub === 'clear') {
      const r = clearTodos(state, userId);
      saveState(state);
      return reply(r.done + ' erledigte geloescht, ' + r.open + ' offene uebrig.');
    }
    return reply('Unbekannt. !d5 todo add|list|done|clear');
  }
  if (cmd === 'feed') {
    if (!args || args.toLowerCase() === 'show') {
      const u = getUser(state, userId);
      if (!u.feed.length) return reply('Feed leer. Posten: !d5 feed <Text>');
      return reply(u.feed.slice(0, 5).map((p) => '- ' + p.text).join('\n'));
    }
    postFeed(state, userId, args);
    saveState(state);
    return reply('Im Feed gespeichert.');
  }
  if (cmd === 'note') {
    const parts = args.split(/\s+/);
    const sub = (parts[0] || 'list').toLowerCase();
    const u = getUser(state, userId);
    if (sub === 'add') {
      const text = args.slice(4).trim();
      if (!text) return reply('Bitte Text angeben: !d5 note add <Text>');
      addNote(state, userId, text);
      saveState(state);
      return reply('Notiert.');
    }
    if (sub === 'clear') {
      const n = u.notes.length;
      u.notes = [];
      saveState(state);
      return reply(n + ' Notizen geloescht.');
    }
    if (sub === 'list' || sub === '') {
      if (!u.notes.length) return reply('Keine Notizen. Neu: !d5 note add <Text>');
      return reply(u.notes.slice(0, 10).map((p, i) => (i + 1) + '. ' + p.text).join('\n'));
    }
    return reply('Unbekannt. !d5 note add|list|clear');
  }
  if (cmd === 'link') {
    if (!args || args.toLowerCase() === 'list') {
      const own = Object.keys(state.links || {}).filter((c) => state.links[c].by === userId);
      if (!own.length) return reply('Keine Kurzlinks. Neu: !d5 link <URL>');
      return reply(own.slice(0, 10).map((c) => 'd5:' + c + ' → ' + state.links[c].url).join('\n'));
    }
    const url = args.split(/\s+/)[0];
    if (!isHttpUrl(url)) return reply('Bitte eine gueltige http(s)-URL angeben.');
    const code = addLink(state, userId, url);
    saveState(state);
    return reply('Kurzlink: d5:' + code + ' → ' + url.trim());
  }
  if (cmd === 'poll') {
    const parsed = parsePoll(args);
    if (parsed.error) return reply(parsed.error);
    const lines = parsed.options.map((o, i) => POLL_EMOJI[i] + ' ' + o).join('\n');
    const sent = await reply('**' + parsed.question + '**\n' + lines);
    if (sent && typeof sent.react === 'function') {
      for (let i = 0; i < parsed.options.length; i++) {
        try { await sent.react(POLL_EMOJI[i]); } catch (e) { /* weiter */ }
      }
    }
    return sent;
  }
  if (cmd === 'remind') {
    const parsed = parseRemind(args);
    if (parsed.error) return reply(parsed.error);
    const u = getUser(state, userId);
    u.reminders++;
    saveState(state);
    setTimeout(() => { reply('Erinnerung: ' + parsed.text); }, parsed.mins * 60 * 1000);
    return reply('OK, ich erinnere dich in ' + parsed.mins + ' Minute(n).');
  }
  if (cmd === 'stats') {
    const s = getStats(state, userId);
    return reply('Deine d5-Uebersicht: ' + s.open + ' offene Todos, ' + s.done + ' erledigt, ' +
      s.notes + ' Notizen, ' + s.posts + ' Feed-Posts, ' + s.reminders + ' Erinnerungen, ' + s.chats + ' KI-Chats.');
  }
  return null;
}

// ---------- KI-Fallback mit d5-Kontext ----------
async function getOllamaResponse(prompt, userId) {
  if (!axios) throw new Error('axios fehlt — bitte "npm install" im discord-chatbot Ordner ausfuehren.');
  if (!OLLAMA_API) throw new Error('OLLAMA_API ist nicht gesetzt (siehe .env).');
  const state = loadState();
  const stats = getStats(state, userId);
  const history = conversationHistory.get(userId) || [];
  const messages = [
    { role: 'system', content: buildSystemPrompt(stats, history.length) },
    ...history.slice(-20),
    { role: 'user', content: prompt }
  ];
  const data = { model: MODEL, messages: messages };
  try {
    const response = await axios.post(OLLAMA_API + '/chat/completions', data, {
      headers: { 'Content-Type': 'application/json' }
    });
    const answer = response.data.choices[0].message;
    history.push({ role: 'user', content: prompt });
    history.push(answer);
    conversationHistory.set(userId, history.slice(-20));
    const u = getUser(state, userId);
    u.chats++;
    saveState(state);
    return answer.content;
  } catch (error) {
    console.error('API Error:', (error.response && (error.response.data || error.message)) || error.message);
    throw error;
  }
}

if (require.main === module && Discord && DISCORD_TOKEN && DISCORD_TOKEN !== TOKEN_PLACEHOLDER) {
  const client = new Discord.Client({
    intents: [
      Discord.GatewayIntentBits.Guilds,
      Discord.GatewayIntentBits.GuildMessages,
      Discord.GatewayIntentBits.MessageContent
    ]
  });

  client.on('ready', () => {
    console.log('Eingeloggt als ' + client.user.tag + '!');
  });

  client.on('messageCreate', async (message) => {
    if (message.author.bot) return;
    const mentionsMe = message.mentions.has(client.user.id);
    const isPrefixed = message.content.trim().startsWith('!d5');
    if (!mentionsMe && !isPrefixed) return;

    const prompt = message.content.replace(new RegExp('<@!?' + client.user.id + '>', 'g'), '').trim();
    const parsed = parseCommand(message.content, client.user.id);
    const known = ['help', 'tools', 'find', 'todo', 'note', 'feed', 'link', 'poll', 'remind', 'stats'];
    try {
      if (known.indexOf(parsed.cmd) >= 0) {
        await runCommand(parsed.cmd, parsed.args, message.author.id, (t) => message.reply(t));
        return;
      }
      const cleanPrompt = prompt.replace(/^!d5\s*/i, '').trim() || parsed.cmd + (parsed.args ? ' ' + parsed.args : '');
      const response = await getOllamaResponse(cleanPrompt, message.author.id);
      message.reply(response);
    } catch (error) {
      console.error('Fehler:', error);
      message.reply('Entschuldigung, ein Fehler ist aufgetreten.');
    }
  });

  client.login(DISCORD_TOKEN).catch((e) => console.error('Login fehlgeschlagen:', e.message));
} else if (require.main === module) {
  if (!Discord) console.error('discord.js fehlt — bitte "npm install" im discord-chatbot Ordner ausfuehren.');
  else console.log('DISCORD_TOKEN fehlt oder ist Platzhalter — Befehlslogik laedt, Bot startet nicht. Siehe README.');
}

module.exports = {
  TOOLS: TOOLS,
  B62: B62,
  POLL_EMOJI: POLL_EMOJI,
  parseCommand: parseCommand,
  toolList: toolList,
  helpText: helpText,
  buildSystemPrompt: buildSystemPrompt,
  loadState: loadState,
  saveState: saveState,
  blankUser: blankUser,
  getUser: getUser,
  addTodo: addTodo,
  listTodos: listTodos,
  completeTodo: completeTodo,
  clearTodos: clearTodos,
  postFeed: postFeed,
  getStats: getStats,
  searchCatalog: searchCatalog,
  genCode: genCode,
  isHttpUrl: isHttpUrl,
  addNote: addNote,
  addLink: addLink,
  parseRemind: parseRemind,
  parsePoll: parsePoll,
  __runForTest: (cmd, args, userId, reply) => runCommand(cmd, args, userId, reply),
  conversationHistory: conversationHistory
};
