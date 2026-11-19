const express = require('express');
const cors = require('cors');
const helmet = require('helmet');
const morgan = require('morgan');
const path = require('path');

const app = express();
const PORT = process.env.PORT || 3000;

// Middleware
app.use(helmet());
app.use(cors());
app.use(morgan('combined'));
app.use(express.json());
app.use(express.static(path.join(__dirname, '.')));

// Article data (in production, this would come from a database)
const articles = [
  {
    id: 1,
    title: "Die Zukunft der KI: Zwischen Fortschritt und Ethik",
    slug: "zukunft-der-ki-fortschritt-und-ethik",
    excerpt: "Ein tiefer Einblick in die Herausforderungen und Chancen künstlicher Intelligenz in unserer Gesellschaft.",
    content: `## Die Zukunft der KI: Zwischen Fortschritt und Ethik

Künstliche Intelligenz hat sich in den letzten Jahren von einem futuristischen Konzept zu einer allgegenwärtigen Realität entwickelt. Von Sprachassistenten in unseren Smartphones bis hin zu komplexen Algorithmen, die medizinische Diagnosen unterstützen - KI durchdringt jeden Bereich unseres Lebens.

### Die Chancen der KI-Entwicklung

Die Vorteile künstlicher Intelligenz sind unbestreitbar. In der Medizin kann KI dabei helfen, Krankheiten früher zu erkennen und personalisierte Behandlungspläne zu erstellen. In der Umwelttechnik optimiert sie Energiesysteme und hilft beim Kampf gegen den Klimawandel. Im Bildungsbereich ermöglicht sie personalisiertes Lernen für jeden Schüler.

### Die ethischen Herausforderungen

Trotz dieser beeindruckenden Möglichkeiten wirft die KI-Entwicklung auch ernstzunehmende Fragen auf. Datenschutz, Arbeitsplatzverluste und die Gefahr einer ungleichen Verteilung der KI-Vorteile sind nur einige der Probleme, denen wir uns stellen müssen.

### Der Weg nach vorn

Die Lösung liegt nicht darin, die KI-Entwicklung zu stoppen, sondern sie verantwortungsvoll zu gestalten. Starke regulatorische Rahmenbedingungen, ethische Richtlinien für KI-Entwickler und eine breite gesellschaftliche Debatte sind essentiell für eine positive Zukunft mit künstlicher Intelligenz.

**Schlussfolgerung:** Die KI wird unsere Welt verändern - die Frage ist nur, ob zum Besseren oder zum Schlechteren. Es liegt an uns allen, diese Entwicklung aktiv mitzugestalten.`,
    category: "Tech",
    author: "Anna Schmidt",
    readTime: "5 Min Lesezeit",
    featured: true,
    image: "/api/placeholder/800/400",
    publishedAt: "2025-01-15T10:00:00Z",
    tags: ["KI", "Ethik", "Zukunft", "Technologie"]
  },
  {
    id: 2,
    title: "Digital Detox: Die neue Rebellion gegen die ständige Erreichbarkeit",
    slug: "digital-detox-neue-rebellion",
    excerpt: "Warum immer mehr Menschen abschalten und wie das unsere Gesellschaft verändert.",
    content: `## Digital Detox: Die neue Rebellion

In einer Welt, in der wir permanent online sind, entscheiden sich immer mehr Menschen für einen bewussten Rückzug aus der digitalen Welt. Der sogenannte "Digital Detox" wird zur neuen Form der Rebellion gegen die ständige Erreichbarkeit.

### Warum wir abschalten müssen

Unser Gehirn ist nicht für die permanente Reizüberflutung konzipiert, der wir täglich ausgesetzt sind. Studien zeigen, dass übermäßiger Smartphone-Gebrauch zu Schlafstörungen, Konzentrationsproblemen und sogar Depressionen führen kann.

### Die Vorteile des Digital Detox

Wer regelmäßig digitale Pausen einlegt, berichtet von:
- Verbesserter Schlafqualität
- Höherer Konzentrationsfähigkeit
- Stärkeren zwischenmenschlichen Beziehungen
- Mehr Kreativität und Produktivität

### Wie Sie selbst starten können

Beginnen Sie klein: Legen Sie Ihr Smartphone während der Mahlzeiten weg, schaffen Sie smartphone-freie Zonen in Ihrer Wohnung und planen Sie bewusst offline-Zeit ein.

**Fazit:** Digital Detox ist keine Modeerscheinung, sondern eine notwendige Antwort auf die digitale Überlastung unserer Zeit.`,
    category: "Culture",
    author: "Michael Weber",
    readTime: "4 Min Lesezeit",
    featured: false,
    image: "/api/placeholder/640/360",
    publishedAt: "2025-01-12T14:30:00Z",
    tags: ["Digital Detox", "Gesundheit", "Gesellschaft"]
  },
  {
    id: 3,
    title: "Remote Work Revolution: Wie die Büros von morgen aussehen werden",
    slug: "remote-work-revolution",
    excerpt: "Die Zukunft der Arbeit ist hybrid - zwischen Homeoffice und Büro.",
    content: `## Remote Work Revolution

Die Corona-Pandemie hat die Arbeitswelt nachhaltig verändert. Remote Work ist von einem Nice-to-have zu einem Must-have geworden, und Unternehmen weltweit überdenken ihre Bürokonzepte.

### Die Vorteile des hybriden Modells

Hybride Arbeitsmodelle kombinieren das Beste aus beiden Welten:
- **Flexibilität:** Mitarbeiter können selbst entscheiden, wann sie im Büro arbeiten
- **Zusammenarbeit:** Wichtige Meetings und kreative Arbeit finden vor Ort statt
- **Kosteneinsparungen:** Weniger Bürofläche bedeutet geringere Mietkosten

### Die Büros der Zukunft

Die Büros von morgen werden anders aussehen:
- Fokus auf Gemeinschaftsbereichen statt Einzelarbeitsplätzen
- High-Tech-Ausstattung für Videokonferenzen
- Nachhaltigkeit und Wohlbefinden im Mittelpunkt

### Herausforderungen meistern

Trotz aller Vorteile gibt es auch Herausforderungen bei der Umstellung auf Remote Work. Unternehmenskultur, Team-Building und die Vermeidung von Isolation sind zentrale Themen.

**Schlusswort:** Die Remote Work Revolution ist gekommen, um zu bleiben. Unternehmen, die sich anpassen, werden die Gewinner der neuen Arbeitswelt sein.`,
    category: "Tech",
    author: "Sarah Müller",
    readTime: "6 Min Lesezeit",
    featured: false,
    image: "/api/placeholder/640/360",
    publishedAt: "2025-01-10T09:15:00Z",
    tags: ["Remote Work", "Arbeitswelt", "Zukunft"]
  },
  {
    id: 4,
    title: "Quantencomputer: Wie Qubits die Welt verändern werden",
    slug: "quantencomputer-qubits-welt-veraendern",
    excerpt: "Die revolutionäre Technologie, die alles verändern wird.",
    content: `## Quantencomputer: Der nächste große Sprung

Quantencomputer gelten als die nächste Revolution in der Computertechnologie. Aber was macht sie so besonders und warum werden sie unsere Welt verändern?

### Wie Quantencomputer funktionieren

Im Gegensatz zu klassischen Computern, die mit Bits arbeiten (0 oder 1), nutzen Quantencomputer Qubits. Diese können gleichzeitig 0 und 1 sein - das Phänomen der Superposition.

### Revolutionäre Anwendungen

Quantencomputer werden Branchen revolutionieren:
- **Medizin:** Entwicklung neuer Medikamente durch Simulation molekularer Wechselwirkungen
- **Kryptografie:** Neue Verschlüsselungsmethoden und die Gefahr für bestehende Sicherheitssysteme
- **Finanzen:** Optimierung komplexer Algorithmen für Risikobewertung und Portfolio-Management

### Die Herausforderungen

Trotz des enormen Potenzials gibt es noch viele Hürden:
- Qubits sind extrem empfindlich und neigen zu Fehlern
- Quantencomputer benötigen Temperaturen nahe dem absoluten Nullpunkt
- Die Entwicklung zuverlässiger Quantenalgorithmen ist komplex

### Der Weg zur Quantenüberlegenheit

Experten sprechen von "Quantum Supremacy" - dem Zeitpunkt, an dem Quantencomputer Aufgaben lösen können, die für klassische Computer unmöglich sind. Dieser Meilenstein rückt näher.

**Fazit:** Quantencomputer werden unsere Welt fundamental verändern. Die Frage ist nicht ob, sondern wann und wie wir uns auf diese Revolution vorbereiten.`,
    category: "Tech",
    author: "Dr. Thomas Richter",
    readTime: "8 Min Lesezeit",
    featured: false,
    image: "/api/placeholder/640/360",
    publishedAt: "2025-01-08T16:45:00Z",
    tags: ["Quantencomputer", "Technologie", "Innovation"]
  },
  {
    id: 5,
    title: "Metaverse: Spiel oder Realität? Die Grenzen verschwimmen",
    slug: "metaverse-spiel-oder-realitaet",
    excerpt: "Wie virtuelle Welten unser Leben verändern werden.",
    content: `## Metaverse: Spiel oder Realität?

Das Metaverse - ein Begriff, der vor allem durch Mark Zuckerberg und Facebook (heute Meta) populär wurde. Aber was ist das Metaverse wirklich und wird es unser Leben tatsächlich verändern?

### Was ist das Metaverse?

Das Metaverse ist eine kollektive virtuelle geteilte Raum, der durch die Konvergenz von physisch und digital erweiterter Realität entsteht. Es ist persistent, interoperabel und synchronisiert.

### Aktuelle Entwicklungen

Verschiedene Unternehmen arbeiten an ihrer Version des Metaverse:
- **Meta (Facebook):** Fokussiert auf soziale Interaktionen
- **Microsoft:** Integriert das Metaverse in Produktivitätstools
- **Roblox und Fortnite:** Bereits erfolgreiche Metaverse-Plattformen für Gamer

### Chancen und Risiken

Das Metaverse bietet enorme Chancen:
- Neue Formen der Zusammenarbeit und Kreativität
- Globale Erreichbarkeit ohne Reisekosten
- Innovative Geschäftsmodelle und virtuelle Ökonomien

Gleichzeitig gibt es Risiken:
- Suchtpotenzial und psychische Gesundheit
- Datenschutz und Überwachung
- Soziale Ungleichheit im Zugang zu Technologie

### Die Zukunft des Metaverse

Experten sind sich einig: Das Metaverse wird kommen, aber anders als viele denken. Es wird nicht die reale Welt ersetzen, sondern erweitern.

**Schlussgedanke:** Das Metaverse ist keine ferne Zukunftsvision mehr, sondern bereits Realität. Wie bei jeder technologischen Revolution liegt es an uns, sie zum Wohl der Menschheit zu gestalten.`,
    category: "Tech",
    author: "Lisa Hoffmann",
    readTime: "7 Min Lesezeit",
    featured: false,
    image: "/api/placeholder/640/360",
    publishedAt: "2025-01-05T11:20:00Z",
    tags: ["Metaverse", "VR", "Zukunft"]
  },
  {
    id: 6,
    title: "DeFi: Die Bank der Zukunft ohne Zwischenhändler?",
    slug: "defi-bank-der-zukunft",
    excerpt: "Decentralized Finance revolutioniert das traditionelle Bankwesen.",
    content: `## DeFi: Die Bank der Zukunft

Decentralized Finance (DeFi) verspricht, das traditionelle Bankwesen zu revolutionieren. Ohne Banken, ohne Zwischenhändler - nur Code und Kryptografie.

### Was ist DeFi?

DeFi nutzt Blockchain-Technologie, um traditionelle Finanzdienstleistungen zu dezentralisieren. Von Kreditvergabe über Handel bis hin zu Versicherungen - alles läuft über Smart Contracts.

### Die Vorteile von DeFi

**Zugänglichkeit:** Jeder mit Internetzugang kann teilnehmen, unabhängig von Bankkonto oder Kreditwürdigkeit.

**Transparenz:** Alle Transaktionen sind öffentlich einsehbar und nachvollziehbar.

**Effizienz:** Keine Bürokratie, schnellere Transaktionen, geringere Kosten.

**Innovation:** Neue Finanzprodukte entstehen täglich durch die Kreativität der Community.

### Aktuelle DeFi-Protokolle

Einige der bekanntesten DeFi-Plattformen:
- **Uniswap:** Dezentrale Börse für Token-Tausch
- **Compound:** Algorithmisches Geldmarktprotokoll
- **Aave:** Kreditvergabe- und -aufnahmeplattform

### Die Risiken verstehen

Trotz des enormen Potenzials gibt es auch Risiken:
- **Smart Contract Bugs:** Fehler im Code können zu Verlusten führen
- **Volatilität:** Kryptomärkte sind extrem schwankungsanfällig
- **Regulierung:** Staatliche Eingriffe könnten DeFi einschränken
- **Skalierbarkeit:** Aktuelle Blockchains haben noch Limitierungen

### DeFi vs. Traditionelle Banken

| Aspekt | Traditionelle Banken | DeFi |
|--------|---------------------|------|
| Zugang | Begrenzt durch Bürokratie | Global und offen |
| Kosten | Hoch (Gebühren, Provisionen) | Niedrig (nur Netzwerkgebühren) |
| Geschwindigkeit | Tage für internationale Überweisungen | Minuten |
| Transparenz | Oft intransparent | Vollständig transparent |

### Die Zukunft von DeFi

DeFi steht noch am Anfang, wächst aber rasant. Die Marktkapitalisierung von DeFi-Protokollen hat bereits Milliarden erreicht.

**Fazit:** DeFi könnte tatsächlich die Bank der Zukunft sein. Aber wie bei jeder Revolution gibt es Gewinner und Verlierer. Bildung und Vorsicht sind der Schlüssel zum Erfolg in dieser neuen Finanzwelt.`,
    category: "Finance",
    author: "Alexander Novak",
    readTime: "9 Min Lesezeit",
    featured: false,
    image: "/api/placeholder/640/360",
    publishedAt: "2025-01-03T13:00:00Z",
    tags: ["DeFi", "Kryptowährung", "Finanzen", "Blockchain"]
  }
];

// API Routes
app.get('/api/articles', (req, res) => {
  const { category, featured, limit } = req.query;
  let filteredArticles = [...articles];

  if (category) {
    filteredArticles = filteredArticles.filter(article =>
      article.category.toLowerCase() === category.toLowerCase()
    );
  }

  if (featured === 'true') {
    filteredArticles = filteredArticles.filter(article => article.featured);
  }

  if (limit) {
    filteredArticles = filteredArticles.slice(0, parseInt(limit));
  }

  res.json({
    success: true,
    data: filteredArticles,
    total: filteredArticles.length
  });
});

app.get('/api/articles/:id', (req, res) => {
  const articleId = parseInt(req.params.id);
  const article = articles.find(a => a.id === articleId);

  if (!article) {
    return res.status(404).json({
      success: false,
      error: 'Artikel nicht gefunden'
    });
  }

  res.json({
    success: true,
    data: article
  });
});

app.get('/api/articles/slug/:slug', (req, res) => {
  const article = articles.find(a => a.slug === req.params.slug);

  if (!article) {
    return res.status(404).json({
      success: false,
      error: 'Artikel nicht gefunden'
    });
  }

  res.json({
    success: true,
    data: article
  });
});

app.get('/api/categories', (req, res) => {
  const categories = [...new Set(articles.map(article => article.category))];
  res.json({
    success: true,
    data: categories
  });
});

// Health check endpoint
app.get('/api/health', (req, res) => {
  res.json({
    success: true,
    message: 'CrashHosting Magazine API is running',
    timestamp: new Date().toISOString(),
    version: '1.0.0'
  });
});

// Serve static files and handle client-side routing
app.get('*', (req, res) => {
  res.sendFile(path.join(__dirname, 'index.html'));
});

app.listen(PORT, () => {
  console.log(`🚀 CrashHosting Magazine Server läuft auf Port ${PORT}`);
  console.log(`📚 API verfügbar unter http://localhost:${PORT}/api`);
  console.log(`🌐 Frontend verfügbar unter http://localhost:${PORT}`);
});
