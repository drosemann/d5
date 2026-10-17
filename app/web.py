import html
import json
import logging
from http.server import BaseHTTPRequestHandler, ThreadingHTTPServer
from urllib.parse import unquote, urlparse

from app.config import HOST, PORT, ROOT, SITE_URL
from app.storage import connect, latest_price, stock_payload

logger = logging.getLogger(__name__)


def safe_json(value):
    return json.dumps(value, ensure_ascii=False).replace("<", "\\u003c").replace(">", "\\u003e")


class AktienwerkHandler(BaseHTTPRequestHandler):
    server_version = "Aktienwerk/1.0"

    def send_bytes(self, body, content_type="text/html; charset=utf-8", status=200):
        encoded = body.encode("utf-8") if isinstance(body, str) else body
        self.send_response(status)
        self.send_header("Content-Type", content_type)
        self.send_header("Content-Length", str(len(encoded)))
        self.send_header("X-Content-Type-Options", "nosniff")
        self.send_header("Referrer-Policy", "strict-origin-when-cross-origin")
        self.send_header("X-Frame-Options", "DENY")
        self.send_header("Content-Security-Policy",
                         "default-src 'self'; style-src 'self'; script-src 'self' 'unsafe-inline'; "
                         "img-src 'self' data:; connect-src 'self'; base-uri 'self'; frame-ancestors 'none'")
        self.end_headers()
        self.wfile.write(encoded)

    def do_GET(self):
        path = unquote(urlparse(self.path).path)
        try:
            if path == "/health":
                with connect() as db:
                    db.execute("SELECT 1").fetchone()
                return self.send_bytes('{"status":"ok"}', "application/json; charset=utf-8")
            if path == "/robots.txt":
                return self.send_bytes(
                    f"User-agent: *\nAllow: /\nSitemap: {SITE_URL}/sitemap.xml\n",
                    "text/plain; charset=utf-8",
                )
            if path == "/sitemap.xml":
                return self.sitemap()
            if path == "/assets/aktienwerk.png":
                with (ROOT / "aktienwerk.png").open("rb") as logo:
                    return self.send_bytes(logo.read(), "image/png")
            if path == "/assets/site.css":
                with (ROOT / "app" / "assets" / "site.css").open("rb") as stylesheet:
                    return self.send_bytes(stylesheet.read(), "text/css; charset=utf-8")
            if path == "/api/stocks":
                return self.stocks_api()
            if path.startswith("/api/stocks/"):
                return self.stock_api(path.removeprefix("/api/stocks/"))
            if path == "/api/events":
                return self.events_api()
            if path.startswith("/aktie/"):
                return self.stock_page(path.removeprefix("/aktie/"))
            if path == "/":
                return self.home_page()
            return self.send_bytes(self.not_found(), status=404)
        except (OSError, ValueError):
            logger.exception("Request failed for %s", path)
            return self.send_bytes("<h1>Vorübergehender Fehler</h1>", status=500)

    def stocks_api(self):
        with connect() as db:
            stocks = db.execute("SELECT ticker, name FROM stocks ORDER BY ticker").fetchall()
            output = []
            for stock in stocks:
                item = dict(stock)
                item["price"] = latest_price(db, stock["ticker"])
                output.append(item)
        return self.send_bytes(safe_json(output), "application/json; charset=utf-8")

    def stock_api(self, ticker):
        with connect() as db:
            data = stock_payload(db, ticker.upper())
        if not data:
            return self.send_bytes('{"error":"Aktie nicht gefunden"}',
                                   "application/json; charset=utf-8", 404)
        return self.send_bytes(safe_json(data), "application/json; charset=utf-8")

    def events_api(self):
        with connect() as db:
            rows = db.execute(
                "SELECT e.ticker, s.name, e.event_type, e.occurred_at, e.title, "
                "e.change_percent, e.explanation, e.source_url FROM events e "
                "JOIN stocks s ON s.ticker = e.ticker ORDER BY e.occurred_at DESC LIMIT 50"
            ).fetchall()
        return self.send_bytes(safe_json([dict(row) for row in rows]),
                               "application/json; charset=utf-8")

    def layout(self, title, description, content, canonical="/"):
        escaped_title = html.escape(title)
        escaped_description = html.escape(description, quote=True)
        absolute_canonical = SITE_URL + canonical
        return f"""<!doctype html>
<html lang="de"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1">
<title>{escaped_title}</title><meta name="description" content="{escaped_description}">
<link rel="canonical" href="{html.escape(absolute_canonical, quote=True)}"><link rel="icon" href="/assets/aktienwerk.png">
<link rel="stylesheet" href="/assets/site.css"><meta name="theme-color" content="#080a10">
</head><body><header class="topbar"><a class="brand" href="/"><img src="/assets/aktienwerk.png" alt="">
<span>aktien<span class="accent">werk</span></span></a><nav><a href="/">Aktien</a><a href="#ereignisse">News &amp; Ereignisse</a>
<a href="https://github.com/drosemann/aktienwerk">Quellcode</a></nav></header>
<main>{content}</main><footer><span>Aktienwerk · unabhängige Erklärungen zu US-Aktien</span>
<span>Kursdaten können verzögert sein. Keine Anlageberatung.</span><a href="https://www.gnu.org/licenses/agpl-3.0.html">AGPL-3.0</a></footer>
</body></html>"""

    def home_page(self):
        content = """<section class="hero"><div class="eyebrow">DIE 100 GRÖSSTEN US-UNTERNEHMEN</div>
<h1>Börsennachrichten.<br><span class="accent">Einfach erklärt.</span></h1>
<p>Aktuelle SEC-Meldungen und Kursbewegungen – verständlich zusammengefasst, transparent verlinkt.</p>
<label class="search"><span>⌕</span><input id="search" type="search" placeholder="Unternehmen oder Ticker suchen …" autocomplete="off"></label>
<div class="market-note"><i></i> Daten aus öffentlichen Quellen · automatisch aktualisiert</div></section>
<section class="section"><div class="section-heading"><div><div class="eyebrow">MARKTÜBERSICHT</div><h2>Beliebte Aktien</h2></div>
<span id="stock-count" class="muted">S&amp;P 100</span></div><div id="stocks" class="stock-grid"><div class="loading">Kursdaten werden geladen …</div></div></section>
<section class="section" id="ereignisse"><div class="section-heading"><div><div class="eyebrow">DAS BEWEGT DEN MARKT</div>
<h2>Aktuelle Ereignisse</h2></div></div><div id="events" class="event-list"><div class="loading">Ereignisse werden geladen …</div></div></section>
<script>
Promise.all([fetch('/api/stocks').then(r=>r.json()),fetch('/api/events').then(r=>r.json())]).then(([stocks,events])=>{
 const grid=document.querySelector('#stocks'), search=document.querySelector('#search');
 document.querySelector('#stock-count').textContent=stocks.length+' Unternehmen';
 function render(){const q=search.value.trim().toLowerCase();const matches=stocks.filter(s=>(s.ticker+' '+s.name).toLowerCase().includes(q));
 grid.innerHTML=matches.length?matches.map(s=>{const p=s.price;const change=p&&p.change_percent;return `<a class="stock-card" href="/aktie/${encodeURIComponent(s.ticker)}">
 <span class="ticker">${escapeHtml(s.ticker)}</span><span class="company">${escapeHtml(s.name)}</span>
 <span class="quote">${p?'$'+Number(p.price).toLocaleString('en-US',{minimumFractionDigits:2,maximumFractionDigits:2}):'—'}
 ${change==null?'':`<small class="${change>=0?'positive':'negative'}">${change>=0?'+':''}${Number(change).toFixed(2)}%</small>`}</span></a>`}).join(''):'<div class="empty">Keine passenden Aktien gefunden.</div>'}
 search.addEventListener('input',render);render();
 const list=document.querySelector('#events');list.innerHTML=events.length?events.slice(0,12).map(e=>`<article class="event-card"><div>
 <a class="event-ticker" href="/aktie/${encodeURIComponent(e.ticker)}">${escapeHtml(e.ticker)} · ${escapeHtml(e.name)}</a>
 <h3>${escapeHtml(e.title)}</h3><p>${escapeHtml(e.explanation)}</p>
 <time>${escapeHtml(e.occurred_at.slice(0,10))}</time></div>${e.source_url?`<a class="source" href="${escapeHtml(e.source_url)}" target="_blank" rel="noopener noreferrer">Quelle ↗</a>`:''}</article>`).join(''):'<div class="empty">Noch keine Ereignisse. Der Datenimport läuft im Hintergrund.</div>'
}).catch(()=>{document.querySelector('#stocks').innerHTML='<div class="empty">Daten derzeit nicht erreichbar. Bitte später erneut versuchen.</div>';document.querySelector('#events').innerHTML=''});
function escapeHtml(value){return String(value).replace(/[&<>"']/g,c=>({'&':'&amp;','<':'&lt;','>':'&gt;','"':'&quot;',"'":'&#39;'}[c]))}
</script>"""
        return self.send_bytes(self.layout(
            "Aktienwerk – Aktiennachrichten einfach erklärt",
            "Aktuelle Nachrichten, SEC-Meldungen und Kursbewegungen zu 100 führenden US-Aktien – einfach und transparent erklärt.",
            content,
        ))

    def stock_page(self, ticker):
        ticker = ticker.upper()
        with connect() as db:
            data = stock_payload(db, ticker)
        if not data:
            return self.send_bytes(self.not_found(), status=404)
        price = data["price"]
        company = html.escape(data["name"])
        display_price = f"${price['price']:,.2f}" if price else "Noch keine Kursdaten"
        change = price["change_percent"] if price else None
        change_html = (f'<span class="{"positive" if change >= 0 else "negative"}">'
                       f'{change:+.2f}% am letzten Handelstag</span>') if change is not None else ""
        events = data["events"]
        rendered_events = []
        for event in events:
            source_link = ""
            if event["source_url"]:
                source_url = html.escape(event["source_url"], quote=True)
                source_link = (
                    f'<a class="source" href="{source_url}" target="_blank" '
                    'rel="noopener noreferrer">Originalquelle ↗</a>'
                )
            rendered_events.append(
                f'<article class="event-card"><div><span class="event-ticker">'
                f'{html.escape(event["occurred_at"][:10])} · {html.escape(event["event_type"])}</span>'
                f'<h3>{html.escape(event["title"])}</h3>'
                f'<p>{html.escape(event["explanation"])}</p>{source_link}</div></article>'
            )
        event_markup = "".join(rendered_events) or (
            '<p class="muted">Für dieses Unternehmen liegen noch keine Ereignisse vor.</p>'
        )
        filings_markup = "".join(
            f'<li><a href="{html.escape(filing["url"], quote=True)}" target="_blank" '
            f'rel="noopener noreferrer">{html.escape(filing["description"])} · '
            f'{html.escape(filing["form"])} ↗</a></li>' for filing in data["filings"]
        ) or '<li class="muted">Noch keine SEC-Einreichungen importiert.</li>'
        latest_explanation = html.escape(
            events[0]["explanation"] if events else
            f"Für {data['name']} liegen derzeit noch keine automatisch erfassten Ereignisse vor."
        )
        faq = [
            {"@type": "Question", "name": f"Was ist bei {data['name']} passiert?",
             "acceptedAnswer": {"@type": "Answer", "text": (
                 events[0]["explanation"] if events else
                 f"Für {data['name']} liegen derzeit noch keine automatisch erfassten Ereignisse vor."
             )}},
            {"@type": "Question", "name": "Ist das eine Anlageberatung?",
             "acceptedAnswer": {"@type": "Answer", "text":
                                "Nein. Aktienwerk bietet ausschließlich allgemeine Informationen und keine Anlageberatung."}},
        ]
        structured = {
            "@context": "https://schema.org", "@type": "Corporation", "name": data["name"],
            "tickerSymbol": ticker, "description": f"Aktuelle Kursinformationen und Nachrichten zu {data['name']}.",
            "mainEntityOfPage": f"{SITE_URL}/aktie/{ticker}",
        }
        content = f"""<nav class="breadcrumb"><a href="/">← Alle Aktien</a><span>/</span>{html.escape(ticker)}</nav>
<section class="company-hero"><div><div class="eyebrow">NASDAQ / NYSE · SP 100</div><h1>{company}</h1>
<div class="symbol">{html.escape(ticker)}</div></div><div class="price-box"><span class="muted">Letzter verfügbarer Schlusskurs</span>
<strong>{display_price}</strong>{change_html or '<span class="muted">Noch keine Veränderung verfügbar</span>'}</div></section>
<section class="section"><div class="section-heading"><div><div class="eyebrow">AKTUELL &amp; RELEVANT</div><h2>Nachrichten und Ereignisse</h2></div></div>
<div class="event-list">{event_markup}</div></section>
<section class="section"><div class="section-heading"><div><div class="eyebrow">ORIGINALQUELLEN</div><h2>SEC-Einreichungen</h2></div></div>
<ul class="filing-list">{filings_markup}</ul></section>
<section class="section"><div class="section-heading"><div><div class="eyebrow">GUT ZU WISSEN</div>
<h2>Häufige Fragen</h2></div></div><div class="event-list">
<article class="event-card"><div><h3>Was ist bei {company} passiert?</h3><p>{latest_explanation}</p></div></article>
<article class="event-card"><div><h3>Ist das eine Anlageberatung?</h3>
<p>Nein. Aktienwerk bietet ausschließlich allgemeine Informationen und keine Anlageberatung.</p></div></article>
</div></section>
<p class="disclaimer">Kursdaten können verzögert oder unvollständig sein. Automatisch erstellte Erläuterungen können Fehler enthalten und ersetzen weder die Originalquelle noch eine individuelle Anlageberatung.</p>
<script type="application/ld+json">{safe_json(structured)}</script>
<script type="application/ld+json">{safe_json({"@context": "https://schema.org", "@type": "FAQPage", "mainEntity": faq})}</script>"""
        return self.send_bytes(self.layout(
            f"{data['name']} ({ticker}) Aktie: Kurs & Nachrichten | Aktienwerk",
            f"Aktuelle Kursdaten, SEC-Meldungen und einfach erklärte Nachrichten zur {data['name']} Aktie ({ticker}).",
            content,
            canonical=f"/aktie/{ticker}",
        ))

    def sitemap(self):
        with connect() as db:
            tickers = [row["ticker"] for row in db.execute("SELECT ticker FROM stocks ORDER BY ticker")]
        urls = "".join(
            f"<url><loc>{html.escape(SITE_URL)}/aktie/{html.escape(ticker)}</loc></url>"
            for ticker in tickers
        )
        body = (
            '<?xml version="1.0" encoding="UTF-8"?>'
            '<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">'
            f"<url><loc>{html.escape(SITE_URL)}/</loc></url>{urls}</urlset>"
        )
        return self.send_bytes(body, "application/xml; charset=utf-8")

    @staticmethod
    def not_found():
        return """<!doctype html><html lang="de"><meta charset="utf-8"><title>Nicht gefunden</title>
<link rel="stylesheet" href="/assets/site.css"><main class="not-found"><h1>Seite nicht gefunden</h1>
<a href="/">Zur Aktienübersicht</a></main></html>"""

    def log_message(self, format_string, *args):
        logger.info("%s - %s", self.address_string(), format_string % args)


def serve():
    server = ThreadingHTTPServer((HOST, PORT), AktienwerkHandler)
    logger.info("Aktienwerk is listening on %s:%s", HOST, PORT)
    try:
        server.serve_forever()
    except KeyboardInterrupt:
        pass
    finally:
        server.server_close()
