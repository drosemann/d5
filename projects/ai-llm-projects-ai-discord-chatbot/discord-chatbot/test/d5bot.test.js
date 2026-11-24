'use strict';
// d5-discord-chatbot Tests (nur Stdlib: node:test + assert).
// Start: npm test  (node --test test/)
// Der Bot wird mit STATE_PATH in einem Temp-Ordner isoliert,
// damit kein echter d5-state.json angefasst wird.
const { test } = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const os = require('node:os');
const path = require('node:path');

process.env.STATE_PATH = path.join(fs.mkdtempSync(path.join(os.tmpdir(), 'd5bot-')), 'state.json');
process.env.OLLAMA_API = '';

const bot = require('../index.js');

function freshTmp() {
  return path.join(fs.mkdtempSync(path.join(os.tmpdir(), 'd5bot-')), 'state.json');
}

test('parseCommand versteht Erwaehnung, Prefix und Grossschreibung', () => {
  assert.deepEqual(bot.parseCommand('<@123> !d5 todo list', '123'), { cmd: 'todo', args: 'list' });
  assert.deepEqual(bot.parseCommand('!d5 FIND calculator', null), { cmd: 'find', args: 'calculator' });
  assert.deepEqual(bot.parseCommand('<@123>', '123'), { cmd: 'help', args: '' });
  assert.deepEqual(bot.parseCommand('!d5 tools snake', null), { cmd: 'tools', args: 'snake' });
});

test('todos: add, done mit Nummer, ungueltige Nummer, clear', () => {
  const p = freshTmp();
  let s = bot.loadState(p);
  assert.equal(bot.addTodo(s, 'u1', 'Milch kaufen'), 1);
  assert.equal(bot.addTodo(s, 'u1', 'Code review'), 2);
  bot.saveState(s, p);
  s = bot.loadState(p);
  assert.equal(bot.listTodos(s, 'u1').length, 2);
  assert.equal(bot.completeTodo(s, 'u1', 9), null);
  assert.equal(bot.completeTodo(s, 'u1', 1).text, 'Milch kaufen');
  const r = bot.clearTodos(s, 'u1');
  assert.deepEqual(r, { done: 1, open: 1 });
});

test('loadState migriert alte Staende ohne links/notes', () => {
  const p = freshTmp();
  fs.writeFileSync(p, JSON.stringify({ users: { u1: { todos: [], feed: [] } } }));
  const s = bot.loadState(p);
  assert.deepEqual(s.links, {});
  assert.deepEqual(bot.listTodos(s, 'u1'), []);
  assert.equal(bot.getStats(s, 'u1').notes, 0);
});

test('notizen werden auf 50 begrenzt', () => {
  const s = { users: {} };
  for (let i = 0; i < 60; i++) bot.addNote(s, 'u1', 'n' + i);
  assert.equal(bot.getUser(s, 'u1').notes.length, 50);
  assert.equal(bot.getUser(s, 'u1').notes[0].text, 'n59');
});

test('genCode erzeugt eindeutige base62-Codes der Laenge 6', () => {
  const seen = new Set();
  for (let i = 0; i < 200; i++) {
    const c = bot.genCode(Object.fromEntries([...seen].map((k) => [k, 1])));
    assert.match(c, /^[0-9a-zA-Z]{6}$/);
    seen.add(c);
  }
  assert.equal(seen.size, 200);
});

test('isHttpUrl prueft Schema und Punkt', () => {
  assert.equal(bot.isHttpUrl('https://example.com/x'), true);
  assert.equal(bot.isHttpUrl('http://a.b'), true);
  assert.equal(bot.isHttpUrl('ftp://a.b'), false);
  assert.equal(bot.isHttpUrl('kein link'), false);
  assert.equal(bot.isHttpUrl(''), false);
});

test('links: anlegen, eigenes Listing, fremde Links unsichtbar', async () => {
  const replies = [];
  const reply = async (t) => { replies.push(t); return null; };
  await bot.__runForTest('link', 'https://example.com/seite', 'alice', reply);
  assert.match(replies[0], /^Kurzlink: d5:[0-9a-zA-Z]{6} → https:\/\/example\.com\/seite$/);
  replies.length = 0;
  await bot.__runForTest('link', 'list', 'alice', reply);
  assert.match(replies[0], /d5:/);
  replies.length = 0;
  await bot.__runForTest('link', 'list', 'bob', reply);
  assert.match(replies[0], /Keine Kurzlinks/);
  replies.length = 0;
  await bot.__runForTest('link', 'kein-link', 'alice', reply);
  assert.match(replies[0], /gueltige http/);
});

test('remind parst Minuten und lehnt Unsinn ab', () => {
  assert.deepEqual(bot.parseRemind('30 Zähne putzen'), { mins: 30, text: 'Zähne putzen' });
  assert.ok(bot.parseRemind('nonsens').error);
  assert.ok(bot.parseRemind('0 los').error);
  assert.ok(bot.parseRemind('2000 spaeter').error);
});

test('poll braucht Frage + mindestens 2 Optionen, max 9', () => {
  const ok = bot.parsePoll('Liebling? | Pizza | Pasta | Salat');
  assert.equal(ok.question, 'Liebling?');
  assert.deepEqual(ok.options, ['Pizza', 'Pasta', 'Salat']);
  assert.ok(bot.parsePoll('Nur Frage').error);
  assert.ok(bot.parsePoll('F? | nur eine').error);
  const many = ['F'].concat(Array.from({ length: 10 }, (_, i) => 'o' + i)).join(' | ');
  assert.ok(bot.parsePoll(many).error);
});

test('searchCatalog findet nach Slug, Name und Kategorie', () => {
  const fake = [
    { slug: 'todo-app', name: 'ToDo', category: 'Tools', stack: 'Python' },
    { slug: 'snake-game', name: 'Snake', category: 'Games', stack: 'JS' }
  ];
  assert.equal(bot.searchCatalog('sna', fake).length, 1);
  assert.equal(bot.searchCatalog('TOOLS', fake).length, 1);
  assert.deepEqual(bot.searchCatalog('', fake), []);
});

test('toolList filtert und meldet leere Treffer', () => {
  assert.match(bot.toolList('snake'), /snake/);
  assert.match(bot.toolList('gibtesnicht'), /Keine d5-Tools/);
  assert.match(bot.toolList(''), /d5-Tools \(/);
});

test('system prompt enthaelt User-Kontext', () => {
  const txt = bot.buildSystemPrompt({ open: 3, done: 7, posts: 2, notes: 1, reminders: 0, chats: 4 }, 5);
  assert.match(txt, /3 offene Todos/);
  assert.match(txt, /7 erledigte/);
  assert.match(txt, /todo/);
});

test('runCommand todo/note/stats antworten vernuenftig', async () => {
  const replies = [];
  const reply = async (t) => { replies.push(t); return null; };
  await bot.__runForTest('todo', 'add Brot kaufen', 'u9', reply);
  await bot.__runForTest('todo', 'list', 'u9', reply);
  await bot.__runForTest('note', 'add Idee: Mod', 'u9', reply);
  await bot.__runForTest('stats', '', 'u9', reply);
  assert.match(replies[0], /Todo #1/);
  assert.match(replies[1], /Brot kaufen/);
  assert.match(replies[2], /Notiert/);
  assert.match(replies[3], /1 offene Todos/);
});
