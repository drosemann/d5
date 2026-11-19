// Goose-Port-Spiegel von: projects/cloud,-hosting-&-saas-aktienwerk/app/storage.py
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/cloud,-hosting-&-saas-aktienwerk/app/storage.py");
}

// ---- Original-Code (projects/cloud,-hosting-&-saas-aktienwerk/app/storage.py), unveraendert, als Inline-Doku ----
// import json
// import sqlite3
// from contextlib import contextmanager
//
// from app.config import DATABASE_PATH, DATA_DIR
// from app.universe import SP100
//
//
// @contextmanager
// def connect():
//     DATA_DIR.mkdir(parents=True, exist_ok=True)
//     connection = sqlite3.connect(DATABASE_PATH, timeout=30)
//     connection.row_factory = sqlite3.Row
//     connection.execute("PRAGMA foreign_keys = ON")
//     connection.execute("PRAGMA journal_mode = WAL")
//     try:
//         yield connection
//         connection.commit()
//     finally:
//         connection.close()
//
//
// def initialize():
//     with connect() as db:
//         db.executescript("""
//             CREATE TABLE IF NOT EXISTS stocks (
//                 ticker TEXT PRIMARY KEY,
//                 name TEXT NOT NULL,
//                 cik TEXT,
//                 updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
//             );
//             CREATE TABLE IF NOT EXISTS prices (
//                 id INTEGER PRIMARY KEY,
//                 ticker TEXT NOT NULL REFERENCES stocks(ticker),
//                 observed_at TEXT NOT NULL,
//                 price REAL NOT NULL,
//                 change_percent REAL,
//                 source TEXT NOT NULL,
//                 UNIQUE(ticker, observed_at, source)
//             );
//             CREATE INDEX IF NOT EXISTS prices_ticker_time ON prices(ticker, observed_at DESC);
//             CREATE TABLE IF NOT EXISTS filings (
//                 accession TEXT PRIMARY KEY,
//                 ticker TEXT NOT NULL REFERENCES stocks(ticker),
//                 form TEXT NOT NULL,
//                 filed_at TEXT NOT NULL,
//                 description TEXT NOT NULL,
//                 url TEXT NOT NULL,
//                 content TEXT NOT NULL DEFAULT '',
//                 created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
//             );
//             CREATE INDEX IF NOT EXISTS filings_ticker_time ON filings(ticker, filed_at DESC);
//             CREATE TABLE IF NOT EXISTS events (
//                 id INTEGER PRIMARY KEY,
//                 ticker TEXT NOT NULL REFERENCES stocks(ticker),
//                 event_type TEXT NOT NULL,
//                 occurred_at TEXT NOT NULL,
//                 title TEXT NOT NULL,
//                 source_url TEXT,
//                 change_percent REAL,
//                 explanation TEXT NOT NULL DEFAULT '',
//                 details TEXT NOT NULL DEFAULT '{}',
//                 created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
//                 UNIQUE(ticker, event_type, source_url)
//             );
//             CREATE INDEX IF NOT EXISTS events_ticker_time ON events(ticker, occurred_at DESC);
//             CREATE TABLE IF NOT EXISTS transcripts (
//                 id INTEGER PRIMARY KEY,
//                 ticker TEXT NOT NULL REFERENCES stocks(ticker),
//                 fiscal_year INTEGER NOT NULL,
//                 fiscal_quarter INTEGER NOT NULL,
//                 transcript TEXT NOT NULL,
//                 source_url TEXT,
//                 created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
//                 UNIQUE(ticker, fiscal_year, fiscal_quarter)
//             );
//         """)
//         filing_columns = {
//             row["name"] for row in db.execute("PRAGMA table_info(filings)").fetchall()
//         }
//         if "content" not in filing_columns:
//             db.execute("ALTER TABLE filings ADD COLUMN content TEXT NOT NULL DEFAULT ''")
//         db.executemany(
//             "INSERT INTO stocks(ticker, name) VALUES (?, ?) "
//             "ON CONFLICT(ticker) DO UPDATE SET name = excluded.name",
//             SP100,
//         )
//
//
// def latest_price(db, ticker):
//     row = db.execute(
//         "SELECT price, change_percent, observed_at FROM prices "
//         "WHERE ticker = ? ORDER BY observed_at DESC LIMIT 1", (ticker,)
//     ).fetchone()
//     return dict(row) if row else None
//
//
// def stock_payload(db, ticker):
//     stock = db.execute("SELECT ticker, name FROM stocks WHERE ticker = ?", (ticker,)).fetchone()
//     if not stock:
//         return None
//     result = dict(stock)
//     result["price"] = latest_price(db, ticker)
//     result["events"] = [
//         dict(row) for row in db.execute(
//             "SELECT event_type, occurred_at, title, source_url, change_percent, explanation, details "
//             "FROM events WHERE ticker = ? ORDER BY occurred_at DESC LIMIT 20", (ticker,)
//         ).fetchall()
//     ]
//     result["filings"] = [
//         dict(row) for row in db.execute(
//             "SELECT form, filed_at, description, url FROM filings "
//             "WHERE ticker = ? ORDER BY filed_at DESC LIMIT 10", (ticker,)
//         ).fetchall()
//     ]
//     result["history"] = [
//         dict(row) for row in db.execute(
//             "SELECT observed_at, price, change_percent FROM prices "
//             "WHERE ticker = ? ORDER BY observed_at DESC LIMIT 30", (ticker,)
//         ).fetchall()
//     ]
//     return result
//
//
// def event_details(value):
//     try:
//         result = json.loads(value or "{}")
//         return result if isinstance(result, dict) else {}
//     except json.JSONDecodeError:
//         return {}
//
