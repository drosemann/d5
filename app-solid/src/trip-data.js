// Trip data ported verbatim from app/trip.js (5 tabs, EN+DE, strings).
export const TRIP = {
    days: [
      { id: 'day0', title: 'Day 0 (Wed) — Anreise + the Makers',
        img: 'trip-assets/like-sign.jpg',
        legs: [
          ['05:30', 'Alarm in Hanau. DB Navigator check: S8/S9 Hanau–Frankfurt corridor clear?'],
          ['06:00', 'Leave home. Bus/tram to Hanau Hbf (~06:12).'],
          ['06:12', 'RMV single Hanau → Frankfurt Flughafen Regionalbahnhof (~€7.80).'],
          ['06:25', 'Board S8/S9 Richtung Wiesbaden. Stay seated past Frankfurt Hbf.'],
          ['07:10', 'Alight Regionalbahnhof (under Terminal 1). Escalators up.'],
          ['07:25', 'Lufthansa T1 halls A/B/C bag drop. LH454, Z gates (e.g. Z66).'],
          ['07:45', 'Security: laptop + liquids out. 9-item recollect count.'],
          ['08:15', 'Passport control → SkyLine to Z pier (~20 min, do not rush).'],
          ['09:30', 'Boarding by groups. Extra US document check normal.'],
          ['10:10', 'LH454 wheels up. Watch to California time (CEST−9).'],
          ['12:41', 'Land SFO International Terminal. Phone on, "landed" home.'],
          ['13:00', 'CBP: ESTA/visitors line. "Tourism, 4 days, Menlo Park."'],
          ['13:20', 'Baggage claim, customs green exit. Landside ~13:30.'],
          ['13:40', 'AirTrain (Red/Blue) → Garage G / BART Station.'],
          ['13:50', 'Clipper ($3) or contactless tap. BART Millbrae-bound, ~10 min.'],
          ['14:05', 'Millbrae → Caltrain southbound to Menlo Park (~$5–7, 25 min).'],
          ['14:35', 'Menlo Park station. Hotel drop if ready.'],
          ['15:00', 'Last mile: rideshare (~$12–15) or M4 Willow Rd shuttle to Bayfront Expy & Willow Rd.'],
          ['15:00', 'THE LIKE SIGN. Front, sides, Sun-logo back. Take time.'],
          ['16:30', 'Bedwell Bayfront Park: trails, sunset, first sit-down.'],
          ['18:30', 'Dinner Santa Cruz Ave. Bed ~21:00 local. Jet lag beaten.']
        ] },
      { id: 'day1', title: 'Day 1 (Thu) — Organized tour day',
        img: 'trip-assets/tour.jpg',
        legs: [
          ['08:00', 'Breakfast, daypack, confirm tour pickup point/time.'],
          ['09:00', 'Pickup. Drive south with Valley-history narration.'],
          ['10:00', 'Meta HQ photo stop with tour narration (Sun→Facebook lore).'],
          ['10:30', 'Googleplex photo stop / Visitor Experience.'],
          ['11:00', 'Computer History Museum window (note skips for tomorrow).'],
          ['13:30', 'Lunch (confirm included vs own beforehand).'],
          ['14:15', 'Stanford walking tour (~2 h: Quad, Church, Hoover).'],
          ['16:15', 'Apple Park Visitor Center: iPad VR + store.'],
          ['18:00', 'Return. Photo backup, charge everything.']
        ] },
      { id: 'day2', title: 'Day 2 (Fri) — Deep geek day',
        img: 'trip-assets/chm.jpg',
        legs: [
          ['09:00', 'Caltrain Menlo Park → Mountain View (~20 min).'],
          ['09:30', 'Computer History Museum: Revolution, 19 galleries, ~1,100 objects. 3 h.'],
          ['12:30', 'Lunch: museum cafe or Castro Street.'],
          ['13:30', 'Google Visitor Experience (public Googleplex corner).'],
          ['14:30', 'Caltrain → Palo Alto.'],
          ['15:00', 'Stanford self-guided loop: Quad, Church, Hoover viewpoint, Rodin garden.'],
          ['18:00', 'Caltrain → Menlo Park. Dinner University Ave.']
        ] },
      { id: 'day3', title: 'Day 3 (Sat) — Apple + departure',
        img: 'trip-assets/apple-park.jpg',
        legs: [
          ['08:30', 'Breakfast, packed, checkout (luggage hold).'],
          ['09:00', 'Rideshare to Apple Park Visitor Center (~30–45 min).'],
          ['09:45', 'Apple Park VC: VR tour, terrace, cafe, exclusives. 2 h.'],
          ['11:45', 'HP garage, 367 Addison Ave (plaque, 10 min) + lunch.'],
          ['12:00', 'Back to hotel, collect luggage. Leave Menlo Park ≤12:00.'],
          ['13:00', 'Caltrain → Millbrae → BART → SFO (reverse of arrival).'],
          ['15:00', 'LH455 wheels up. Land FRA next morning, S8/S9 home ~13:00.']
        ] }
    ],
    checklist: [
      { group: '4+ weeks before', items: ['Biometric passport valid whole trip', 'ESTA at esta.cbp.dhs.gov (~$40.62, ≥72 h ahead)', 'Flights Germany → SFO booked', 'Hotel Menlo Park/Palo Alto booked', 'Day-2 tour booked (confirm 5 stops)', 'US health insurance (non-negotiable)', 'eSIM / US prepaid plan'] },
      { group: 'Week before', items: ['Caltrain + BART apps, offline maps', 'CHM hours re-checked (closed Mon–Tue)', 'Return timing planned', 'Phone storage cleared, power bank packed', 'Bank notified of US travel'] },
      { group: 'Pack', items: ['Fleece + windbreaker', 'Walking shoes', 'Sunglasses + sunscreen', 'Power bank + US adapter (A/B)', 'Snacks, reusable bottle', 'Daypack'] },
      { group: 'On site', items: ['Like sign: front, sides, Sun back', 'Bedwell Bayfront sunset', 'CHM Revolution fully walked', 'Hoover Tower viewpoint', 'Apple Park VR + terrace', 'HP garage plaque', 'Receipts kept'] }
    ],
    budget: [
      { item: 'Flight', b: 450, m: 650, c: 900 },
      { item: 'Hotel 3n +tax', b: 300, m: 550, c: 900 },
      { item: 'SFO transfers', b: 22, m: 77, c: 130 },
      { item: 'Local transit', b: 40, m: 60, c: 60 },
      { item: 'Day-2 tour', b: 120, m: 180, c: 1500 },
      { item: 'Museums', b: 25, m: 25, c: 25 },
      { item: 'Food 4d', b: 180, m: 300, c: 480 },
      { item: 'ESTA share', b: 19, m: 19, c: 19 },
      { item: 'Buffer', b: 100, m: 150, c: 250 }
    ],
    sights: [
      { name: 'Meta Like sign', where: 'Bayfront Expy & Willow Rd', note: 'Giant thumbs-up; back shows flipped Sun Microsystems logo. Best light late afternoon. Free.' },
      { name: 'MPK20 (Gehry)', where: 'West campus', note: '430,000 sq ft, one giant room, 9-acre rooftop park. Street views only.' },
      { name: 'Bedwell Bayfront Park', where: 'Adjacent to HQ', note: 'Bay views, trails, sunset picnic. Free.' },
      { name: 'Computer History Museum', where: '1401 N Shoreline Blvd, Mountain View', note: 'Revolution: 19 galleries, ~1,100 artifacts. Closed Mon–Tue. 3+ h.' },
      { name: 'Google Visitor Experience', where: 'Mountain View', note: 'Public Googleplex corner + store.' },
      { name: 'Stanford University', where: 'Palo Alto', note: 'Free 2 h loop: Quad, Church, Hoover Tower, Rodin garden.' },
      { name: 'Apple Park Visitor Center', where: 'Cupertino', note: 'iPad VR spaceship tour, terrace, cafe, exclusives. 2 h.' },
      { name: 'HP garage', where: '367 Addison Ave, Palo Alto', note: '"Birthplace of Silicon Valley" plaque. 10 min.' }
    ],
    videos: [
      { title: 'INSIDE Meta HQ (~6.5 min)', url: 'https://www.youtube.com/watch?v=Sr-De6XBhBw' },
      { title: 'Facebook HQ Tour', url: 'https://www.youtube.com/watch?v=jab3jGF6Npk' },
      { title: 'Pocket-lint: MPK20 opening gallery', url: 'https://www.pocket-lint.com/apps/news/facebook/133408/take-a-peek-inside-facebook-s-new-hq-called-mpk20-and-designed-by-frank-gehry/' },
      { title: 'Richard Hartley: Step into Zuckworld', url: 'http://www.richardhartley.com/2015/04/step-into-zuckworld-rollerblading-and-selfie-stumps-at-the-new-facebook-hq/' }
    ]
  };
export const TRIP_DE = {
    days: [
      { id: 'day0', title: 'Tag 0 (Mi) — Anreise + die Macher', img: 'trip-assets/like-sign.jpg',
        legs: [
          ['05:30', 'Wecker in Hanau. DB Navigator checken: S8/S9 frei?'],
          ['06:00', 'Los. Bus/Tram zum Hanau Hbf (~06:12).'],
          ['06:12', 'RMV einfach Hanau → Flughafen Regionalbahnhof (~7,80 €).'],
          ['06:25', 'S8/S9 Richtung Wiesbaden einsteigen. Nach Frankfurt Hbf sitzen bleiben.'],
          ['07:10', 'Ausstieg Regionalbahnhof (unter T1). Rolltreppen hoch.'],
          ['07:25', 'Lufthansa T1 Hallen A/B/C Gepäckaufgabe. LH454, Z-Gates.'],
          ['07:45', 'Security: Laptop + Flüssigkeiten raus. 9er-Zählung.'],
          ['08:15', 'Passkontrolle → SkyLine zum Z-Pier (20 Min., nicht hetzen).'],
          ['09:30', 'Boarding gruppenweise. Extra US-Dokuprüfung normal.'],
          ['10:10', 'LH454 ab. Uhr auf Kalifornienzeit (MESZ−9).'],
          ['12:41', 'Landung SFO Intl Terminal. Handy an, „gelandet“ senden.'],
          ['13:00', 'CBP: ESTA-Schlange. „Tourism, 4 days, Menlo Park.“'],
          ['13:20', 'Gepäck, Zoll grün. Landside ~13:30.'],
          ['13:40', 'AirTrain (rot/blau) → Garage G / BART Station.'],
          ['13:50', 'Clipper (3 $) oder kontaktlos. BART Richtung Millbrae, ~10 Min.'],
          ['14:05', 'Millbrae → Caltrain südbound nach Menlo Park (~5–7 $, 25 Min.).'],
          ['14:35', 'Bahnhof Menlo Park. Hotel-Drop wenn Zimmer fertig.'],
          ['15:00', 'Letzte Meile: Rideshare (~12–15 $) oder M4-Shuttle nach Bayfront Expy & Willow Rd.'],
          ['15:00', 'DAS LIKE-SCHILD. Vorne, Seiten, Sun-Rückseite. Zeit lassen.'],
          ['16:30', 'Bedwell Bayfront Park: Trails, Sunset, erstes Sitzen.'],
          ['18:30', 'Dinner Santa Cruz Ave. ~21:00 Licht aus. Jetlag besiegt.']
        ] },
      { id: 'day1', title: 'Tag 1 (Do) — Organisierter Tourtag', img: 'trip-assets/tour.jpg',
        legs: [
          ['08:00', 'Frühstück, Tagesrucksack, Abholpunkt bestätigen.'],
          ['09:00', 'Abholung. Anfahrt mit Valley-Erzählung.'],
          ['10:00', 'Meta-HQ-Fotostopp mit Tour-Erzählung.'],
          ['10:30', 'Googleplex-Fotostopp / Visitor Experience.'],
          ['11:00', 'Computer History Museum (Lücken für morgen notieren).'],
          ['13:30', 'Mittag (inklusive vs. selbst — vorher klären).'],
          ['14:15', 'Stanford-Gehtour (~2 Std.: Quad, Kirche, Hoover).'],
          ['16:15', 'Apple Park Visitor Center: iPad-VR + Store.'],
          ['18:00', 'Rückfahrt. Fotos sichern, alles laden.']
        ] },
      { id: 'day2', title: 'Tag 2 (Fr) — Vertiefungstag', img: 'trip-assets/chm.jpg',
        legs: [
          ['09:00', 'Caltrain Menlo Park → Mountain View (~20 Min.).'],
          ['09:30', 'Computer History Museum: Revolution, 3 Std.'],
          ['12:30', 'Mittag: Museumscafé oder Castro Street.'],
          ['13:30', 'Google Visitor Experience.'],
          ['14:30', 'Caltrain → Palo Alto.'],
          ['15:00', 'Stanford-Runde: Quad, Kirche, Hoover-Aussicht, Rodin.'],
          ['18:00', 'Caltrain → Menlo Park. Dinner University Ave.']
        ] },
      { id: 'day3', title: 'Tag 3 (Sa) — Apple + Abreise', img: 'trip-assets/apple-park.jpg',
        legs: [
          ['08:30', 'Frühstück, packen, Checkout (Gepäckaufbewahrung).'],
          ['09:00', 'Rideshare zum Apple Park Visitor Center (~30–45 Min.).'],
          ['09:45', 'Apple Park VC: VR-Tour, Terrasse, Café, Exklusives. 2 Std.'],
          ['11:45', 'HP-Garage, 367 Addison Ave (Plakette, 10 Min.) + Mittag.'],
          ['12:00', 'Gepäck holen. Menlo Park bis 12:00 verlassen.'],
          ['13:00', 'Caltrain → Millbrae → BART → SFO (umgekehrt).'],
          ['15:00', 'LH455 ab. Landung FRA Folgetag, S8/S9 heim ~13:00.']
        ] }
    ],
    checklist: [
      { group: '4+ Wochen vorher', items: ['Biometrischer Reisepass, ganze Reise gültig', 'ESTA auf esta.cbp.dhs.gov (~40,62 $, mind. 72 Std. vorher)', 'Flüge Deutschland → SFO gebucht', 'Hotel Menlo Park/Palo Alto gebucht', 'Tag-2-Tour gebucht (5 Stopps prüfen)', 'US-Krankenversicherung (nicht verhandelbar)', 'eSIM / US-Prepaid-Plan'] },
      { group: 'Woche vorher', items: ['Caltrain- + BART-Apps, Offline-Karten geladen', 'CHM-Zeiten geprüft (Mo–Di zu)', 'Rückreise geplant', 'Speicher frei, Powerbank gepackt', 'Bank über USA-Reise informiert'] },
      { group: 'Packen', items: ['Fleece + Windjacke', 'Bequeme Schuhe', 'Sonnenbrille + Sonnencreme', 'Powerbank + US-Adapter (A/B)', 'Snacks, wiederbefüllbare Flasche', 'Tagesrucksack'] },
      { group: 'Vor Ort', items: ['Like-Schild: vorne, Seiten, Sun-Rückseite', 'Bedwell-Bayfront-Sunset', 'CHM Revolution komplett', 'Hoover-Aussicht', 'Apple-Park-VR + Terrasse', 'HP-Plakette', 'Belege aufgehoben'] }
    ],
    budget: [
      { item: 'Flug', b: 450, m: 650, c: 900 },
      { item: 'Hotel 3 N. +Steuer', b: 300, m: 550, c: 900 },
      { item: 'SFO-Transfers', b: 22, m: 77, c: 130 },
      { item: 'Nahverkehr', b: 40, m: 60, c: 60 },
      { item: 'Tag-2-Tour', b: 120, m: 180, c: 1500 },
      { item: 'Museen', b: 25, m: 25, c: 25 },
      { item: 'Essen 4 T.', b: 180, m: 300, c: 480 },
      { item: 'ESTA-Anteil', b: 19, m: 19, c: 19 },
      { item: 'Puffer', b: 100, m: 150, c: 250 }
    ],
    sights: [
      { name: 'Meta-Like-Schild', where: 'Bayfront Expy & Willow Rd', note: 'Riesendaumen, Rückseite zeigt umgedrehtes Sun-Logo. Bestes Licht Spätnachmittag. Gratis.' },
      { name: 'MPK20 (Gehry)', where: 'West-Campus', note: '40.000 m², ein Riesenraum, 9 Hektar Dachpark. Nur Straßenansicht.' },
      { name: 'Bedwell Bayfront Park', where: 'Neben HQ', note: 'Buchtaussicht, Trails, Sunset-Picknick. Gratis.' },
      { name: 'Computer History Museum', where: '1401 N Shoreline Blvd, Mountain View', note: 'Revolution: 19 Galerien, ~1.100 Artefakte. Mo–Di zu. 3+ Std.' },
      { name: 'Google Visitor Experience', where: 'Mountain View', note: 'Öffentliche Googleplex-Ecke + Store.' },
      { name: 'Stanford University', where: 'Palo Alto', note: 'Gratis-2-Std.-Runde: Quad, Kirche, Hoover-Turm, Rodin.' },
      { name: 'Apple Park Visitor Center', where: 'Cupertino', note: 'iPad-VR Ring-Tour, Terrasse, Café, Exklusives. 2 Std.' },
      { name: 'HP-Garage', where: '367 Addison Ave, Palo Alto', note: '„Geburtsort des Silicon Valley“-Plakette. 10 Min.' }
    ],
    videos: TRIP.videos,
    food: [
      { day: 'Anreise', meals: ['Zuhause: leicht frühstücken (Joghurt, Kaffee)', 'FRA Gate: Sandwiches ~10–15 €', 'LH454: Mittag + Snack + Pre-Landing-Frühstück — alles essen'] },
      { day: 'Tag-0-Abend', meals: ['yeobo, darling, 827 Santa Cruz Ave (~40–60 $)', 'Backup: Camper, 898 Santa Cruz Ave', 'Müde-Option: Tacos/Pizza ~15–20 $. Kein Alkohol Nacht eins.'] },
      { day: 'Tag 1', meals: ['Frühstück: Mademoiselle Colette to-go (~10 $)', 'Mittag: tourabhängig (~15–20 $)', 'Abend: Eylan (Bib Gourmand) oder Bistro Vida (~40–60 $)'] },
      { day: 'Tag 2', meals: ['Frühstück: Cafe Borrone, 1010 El Camino (~12 $)', 'Mittag: CHM-Café oder Castro St (~15–20 $)', 'Abend: University Ave — Local Union 271 (~20–40 $)'] },
      { day: 'Tag 3', meals: ['Frühstück: Hotel + Philz Mint Mojito (~7 $)', 'Mittag: Apple-Park-Café + Palo-Alto-Happen (~15–25 $)', 'SFO Intl G: 1300 on Fillmore / Mustards / Gott’s / Bun Mee (~20–35 $)'] }
    ],
    extra: [
      { day: 'Wenn was schiefgeht (16-contingency)', meals: ['S-Bahn verpasst: nächste nehmen, Gate-Frühstück streichen', 'Flug weg: Star-Alliance-Umbuchung via MUC/ZRH, EU261 bis €600', 'CBP lang: nichts bricht — BART/Caltrain fahren immer', 'Pass weg: Kopie + Polizei + Konsulat SF', 'Regen: CHM ganztägig, Intel Museum, Cantor Arts'] },
      { day: '7-Tage-Version (17-extended)', meals: ['Tage 0–3 unverändert (Menlo Park)', 'Tag 4: Caltrain nach SF, Ferry Building, Fisherman’s Wharf', 'Tag 5: Cable Car, Lombard St, Golden Gate, Mission-Burrito', 'Tag 6: Golden-Gate-Park-Museum + Haight-Ashbury', 'Aufpreis ~€800–1.000 → gesamt ~€2.600–3.200'] }
    ]
  };
export const STR = {
    en: { days: 'Days', food: 'Food', checklist: 'Checklist', budget: 'Budget', sights: 'Sights', videos: 'Videos', extra: 'Extra',
      open: 'Open', legs: 'timed legs.', unknown: 'Unknown day: ', caption: 'AI illustration — impression, not a photo.',
      langBtn: 'DE', langNote: 'Auf Deutsch: das komplette System liegt unter meta-trip/de/ im Repo (alle 17 Dateien).',
      packed: 'Packed and booked: ', budgetNames: ['Budget', 'Mid', 'Comfort'],
      budgetTotal: 'Total', budgetPer: 'per person (flight + ground).',
      budgetLevers: 'Levers: shoulder season, BART+Caltrain over rideshares, group tour over private, private rooms over hotels. ESTA lasts 2 years.',
      videosNote: 'Watch before booking: the inside is spectacular and closed to you. Calibrate expectations to sign + perimeter.',
      extraNote: 'Full texts: meta-trip/16-contingency.md and meta-trip/17-extended.md in the repo.',
      foodNote: 'Grocery run (Trader Joe’s, ~$20) covers Caltrain snacks + Bayfront picnic. Tap water is safe; one refilled bottle all trip.' },
    de: { days: 'Tage', food: 'Essen', checklist: 'Checkliste', budget: 'Budget', sights: 'Sights', videos: 'Videos', extra: 'Extra',
      open: 'Öffnen', legs: 'Einträge mit Uhrzeit.', unknown: 'Unbekannter Tag: ', caption: 'KI-Illustration — Eindruck, kein Foto.',
      langBtn: 'EN', langNote: 'In English: the full system is under meta-trip/ (17 files).',
      packed: 'Gepackt und gebucht: ', budgetNames: ['Sparsam', 'Mittel', 'Komfort'],
      budgetTotal: 'Gesamt', budgetPer: 'pro Person (Flug + vor Ort).',
      budgetLevers: 'Hebel: Nebensaison, BART+Caltrain statt Rideshares, Gruppentour statt privat, Privatzimmer statt Hotels. ESTA gilt 2 Jahre.',
      videosNote: 'Vor dem Buchen ansehen: Drinnen ist spektakulär und geschlossen für dich. Erwartungen kalibrieren: Schild + Umriss.',
      extraNote: 'Volltexte: meta-trip/16-contingency.md und meta-trip/17-extended.md im Repo.',
      foodNote: 'Einkauf (Trader Joe’s, ~20 $) deckt Caltrain-Snacks + Bayfront-Picknick. Leitungswasser trinkbar; eine Flasche, ganze Reise.' }
  };

export const TABS = [
  ['days', 'Days'], ['food', 'Food'], ['checklist', 'Checklist'],
  ['budget', 'Budget'], ['sights', 'Sights'], ['videos', 'Videos'],
  ['extra', 'Extra']
];
export const LANG_KEY = 'd5-trip-lang';
export function initialLang() {
  try { if (localStorage.getItem(LANG_KEY) === 'de') return 'de'; } catch {}
  return 'en';
}
