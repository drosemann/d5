// Goose-Port-Spiegel von: projects/archive-unsorted-cascadeprojects/windsurf-project/posts/was-ist-eine-firewall-wirklich.html
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/archive-unsorted-cascadeprojects/windsurf-project/posts/was-ist-eine-firewall-wirklich.html");
}

// ---- Original-Code (projects/archive-unsorted-cascadeprojects/windsurf-project/posts/was-ist-eine-firewall-wirklich.html), unveraendert, als Inline-Doku ----
// <!DOCTYPE html>
// <html lang="de">
// <head>
//     <meta charset="UTF-8">
//     <meta name="viewport" content="width=device-width, initial-scale=1.0">
//     <title>Was ist eine Firewall wirklich? - Mein Blog</title>
//     <meta name="description" content="Firewall erklärt - Wie Firewalls funktionieren, Arten von Firewalls und praktische Konfiguration für Linux und Windows Server">
//     <meta name="keywords" content="Firewall erklärt, Netzwerk-Sicherheit, iptables, Windows Firewall, Firewall-Typen">
//     <meta name="author" content="Mein Blog">
//     <link rel="canonical" href="/posts/was-ist-eine-firewall-wirklich.html">
//
//     <meta property="og:type" content="article">
//     <meta property="og:title" content="Was ist eine Firewall wirklich?">
//     <meta property="og:description" content="Umfassende Firewall-Erklärung">
//     <meta property="og:url" content="/posts/was-ist-eine-firewall-wirklich.html">
//
//     <meta property="twitter:card" content="summary_large_image">
//     <meta property="twitter:title" content="Was ist eine Firewall wirklich?">
//     <meta property="twitter:description" content="Firewall-Grundlagen erklärt">
//
//     <link rel="stylesheet" href="../css/style.css">
//     <style>
//         .blog-post {
//             max-width: 800px;
//             margin: 2rem auto;
//             padding: 2rem;
//             background: white;
//             border-radius: 8px;
//             box-shadow: 0 2px 10px rgba(0,0,0,0.1);
//         }
//
//         .post-header {
//             text-align: center;
//             margin-bottom: 2rem;
//         }
//
//         .post-date {
//             color: #7f8c8d;
//             margin: 1rem 0;
//         }
//
//         .post-content {
//             line-height: 1.8;
//         }
//
//         .post-content p {
//             margin-bottom: 1.5rem;
//         }
//
//         .post-content h2 {
//             margin-top: 2rem;
//             margin-bottom: 1rem;
//             color: #2c3e50;
//         }
//
//         .post-content h3 {
//             margin-top: 1.5rem;
//             margin-bottom: 0.8rem;
//             color: #34495e;
//         }
//
//         .post-content ul, .post-content ol {
//             margin-bottom: 1.5rem;
//             padding-left: 2rem;
//         }
//
//         .post-content li {
//             margin-bottom: 0.5rem;
//         }
//
//         .post-content code {
//             background: #f8f9fa;
//             padding: 0.2rem 0.4rem;
//             border-radius: 3px;
//             font-family: 'Courier New', monospace;
//         }
//
//         .post-content pre {
//             background: #f8f9fa;
//             padding: 1rem;
//             border-radius: 5px;
//             overflow-x: auto;
//             margin: 1rem 0;
//         }
//
//         .back-link {
//             display: inline-block;
//             margin-top: 2rem;
//             color: #3498db;
//             text-decoration: none;
//             font-weight: 500;
//         }
//
//         .back-link:hover {
//             text-decoration: underline;
//         }
//
//         .article-meta {
//             background: #f8f9fa;
//             padding: 1rem;
//             border-radius: 5px;
//             margin-bottom: 2rem;
//         }
//
//         .tags {
//             margin-top: 0.5rem;
//         }
//
//         .tag {
//             display: inline-block;
//             background: #3498db;
//             color: white;
//             padding: 0.2rem 0.6rem;
//             border-radius: 3px;
//             font-size: 0.8rem;
//             margin-right: 0.5rem;
//             margin-bottom: 0.3rem;
//         }
//
//         .firewall-types {
//             display: grid;
//             grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
//             gap: 1.5rem;
//             margin: 2rem 0;
//         }
//
//         .firewall-type {
//             padding: 1.5rem;
//             border-radius: 8px;
//             border-left: 4px solid #3498db;
//             background: #f8f9fa;
//         }
//
//         .firewall-type h4 {
//             margin-top: 0;
//             color: #2c3e50;
//         }
//
//         .warning-box {
//             background: #fff3cd;
//             border: 1px solid #ffeaa7;
//             border-left: 4px solid #f39c12;
//             padding: 1rem;
//             border-radius: 5px;
//             margin: 2rem 0;
//         }
//
//         .success-box {
//             background: #d4edda;
//             border: 1px solid #c3e6cb;
//             border-left: 4px solid #28a745;
//             padding: 1rem;
//             border-radius: 5px;
//             margin: 2rem 0;
//         }
//
//         .code-comparison {
//             background: #f8f9fa;
//             padding: 1rem;
//             border-radius: 5px;
//             margin: 1rem 0;
//         }
//
//         .linux-code, .windows-code {
//             margin: 1rem 0;
//         }
//
//         .linux-code {
//             border-left: 3px solid #28a745;
//         }
//
//         .windows-code {
//             border-left: 3px solid #007bff;
//         }
//     </style>
// </head>
// <body>
//     <header>
//         <div class="container">
//             <h1>Mein Blog</h1>
//         </div>
//     </header>
//
//     <main class="container">
//         <article class="blog-post">
//             <header class="post-header">
//                 <h1>🛡️ Was ist eine Firewall wirklich?</h1>
//                 <div class="post-date">11. Oktober 2025</div>
//             </header>
//
//             <div class="success-box">
//                 <strong>🔒 Sicherheits-Hinweis:</strong> Eine Firewall ist die erste Verteidigungslinie deines Servers!
//             </div>
//
//             <div class="article-meta">
//                 <strong>Kategorie:</strong> IT-Sicherheit<br>
//                 <strong>Schwierigkeitsgrad:</strong> Einsteiger bis Fortgeschritten<br>
//                 <strong>Lesezeit:</strong> 12 Minuten
//                 <div class="tags">
//                     <span class="tag">Sicherheit</span>
//                     <span class="tag">Firewall</span>
//                     <span class="tag">Netzwerk</span>
//                     <span class="tag">Linux</span>
//                     <span class="tag">Windows</span>
//                 </div>
//             </div>
//
//             <div class="post-content">
//                 <p><strong>Eine Firewall ist wie ein Türsteher für deinen Server</strong> - sie entscheidet, wer rein darf und wer draußen bleiben muss. In diesem Artikel erkläre ich dir, wie Firewalls funktionieren und wie du sie richtig konfigurierst.</p>
//
//                 <h2>Was ist eine Firewall?</h2>
//                 <p>Eine Firewall ist eine Sicherheitskomponente, die den ein- und ausgehenden Netzwerkverkehr überwacht und kontrolliert. Sie arbeitet nach dem Prinzip "Alles verbieten, was nicht explizit erlaubt ist".</p>
//
//                 <h3>Hauptaufgaben einer Firewall:</h3>
//                 <ul>
//                     <li><strong>Paket-Filterung:</strong> Überprüfung jedes Datenpakets</li>
//                     <li><strong>Port-Kontrolle:</strong> Welche Ports dürfen verwendet werden</li>
//                     <li><strong>IP-Filterung:</strong> Welche IP-Adressen dürfen kommunizieren</li>
//                     <li><strong>Protokoll-Kontrolle:</strong> Welche Protokolle sind erlaubt</li>
//                     <li><strong>Stateful Inspection:</strong> Verfolgung von Verbindungen</li>
//                 </ul>
//
//                 <h2>Arten von Firewalls</h2>
//
//                 <div class="firewall-types">
//                     <div class="firewall-type">
//                         <h4>🔥 Paket-Filter-Firewall</h4>
//                         <p>Überprüft jedes Paket einzeln nach Header-Informationen</p>
//                         <strong>Beispiel:</strong> iptables, pf
//                     </div>
//
//                     <div class="firewall-type">
//                         <h4>🛡️ Stateful Firewall</h4>
//                         <p>Verfolgt den Zustand von Verbindungen</p>
//                         <strong>Beispiel:</strong> Windows Firewall, nftables
//                     </div>
//
//                     <div class="firewall-type">
//                         <h4>🚪 Application Layer Firewall</h4>
//                         <p>Analysiert den Inhalt von Paketen (Layer 7)</p>
//                         <strong>Beispiel:</strong> ModSecurity, Web Application Firewalls
//                     </div>
//
//                     <div class="firewall-type">
//                         <h4>⛓️ Next-Generation Firewall</h4>
//                         <p>Kombiniert mehrere Technologien mit Deep Packet Inspection</p>
//                         <strong>Beispiel:</strong> Palo Alto, FortiGate
//                     </div>
//                 </div>
//
//                 <h2>Wie funktioniert iptables? (Linux)</h2>
//
//                 <h3>Grundlegende iptables-Struktur:</h3>
//                 <div class="code-comparison">
//                     <div class="linux-code">
//                         <strong>Linux (iptables):</strong><br>
//                         <pre><code># Standard-Policies setzen
// iptables -P INPUT DROP
// iptables -P FORWARD DROP
// iptables -P OUTPUT ACCEPT
//
// # SSH erlauben (Port 22)
// iptables -A INPUT -p tcp --dport 22 -j ACCEPT
//
// # HTTP/HTTPS erlauben (Ports 80, 443)
// iptables -A INPUT -p tcp -m multiport --dports 80,443 -j ACCEPT
//
// # Ping erlauben
// iptables -A INPUT -p icmp -j ACCEPT</code></pre>
//                     </div>
//                 </div>
//
//                 <h2>Windows Firewall konfigurieren</h2>
//
//                 <h3>Grundlegende Windows Firewall-Regeln:</h3>
//                 <div class="code-comparison">
//                     <div class="windows-code">
//                         <strong>Windows PowerShell:</strong><br>
//                         <pre><code># Firewall-Regel für SSH erstellen
// New-NetFirewallRule -DisplayName "SSH" -Direction Inbound -LocalPort 22 -Protocol TCP -Action Allow
//
// # HTTP und HTTPS erlauben
// New-NetFirewallRule -DisplayName "Web Server" -Direction Inbound -LocalPort 80,443 -Protocol TCP -Action Allow
//
// # Firewall-Status prüfen
// Get-NetFirewallProfile</code></pre>
//                     </div>
//                 </div>
//
//                 <h2>Best Practices für Firewalls</h2>
//
//                 <h3>1. Default-Deny-Prinzip</h3>
//                 <p><strong>Grundsatz:</strong> Alles verbieten, was nicht explizit erlaubt ist!</p>
//                 <ul>
//                     <li>Setze alle Policies auf DROP/DENY</li>
//                     <li>Füge nur nötige Regeln hinzu</li>
//                     <li>Überprüfe Regeln regelmäßig</li>
//                 </ul>
//
//                 <h3>2. Least Privilege</h3>
//                 <p><strong>Grundsatz:</strong> Nur minimal nötige Berechtigungen erteilen!</p>
//                 <ul>
//                     <li>Erlaube nur nötige Ports</li>
//                     <li>Beschränke auf bestimmte IP-Adressen</li>
//                     <li>Nutze spezifische Protokolle</li>
//                 </ul>
//
//                 <h3>3. Logging und Monitoring</h3>
//                 <p><strong>Grundsatz:</strong> Überwache deine Firewall aktiv!</p>
//                 <ul>
//                     <li>Aktiviere Logging für abgelehnte Pakete</li>
//                     <li>Überwache verdächtige Aktivitäten</li>
//                     <li>Setze up Alarme für Angriffe</li>
//                 </ul>
//
//                 <h2>Praktische Firewall-Konfiguration</h2>
//
//                 <h3>Sicherer Web-Server:</h3>
//                 <div class="linux-code">
//                     <pre><code># Sichere Web-Server-Konfiguration
// iptables -P INPUT DROP
// iptables -P FORWARD DROP
// iptables -P OUTPUT ACCEPT
//
// # Loopback erlauben
// iptables -A INPUT -i lo -j ACCEPT
//
// # Established connections erlauben
// iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
//
// # SSH nur von bestimmten IPs
// iptables -A INPUT -p tcp -s 192.168.1.0/24 --dport 22 -j ACCEPT
//
// # Web-Server
// iptables -A INPUT -p tcp --dport 80 -j ACCEPT
// iptables -A INPUT -p tcp --dport 443 -j ACCEPT
//
// # ICMP (Ping) limitieren
// iptables -A INPUT -p icmp --icmp-type echo-request -m limit --limit 1/s -j ACCEPT</code></pre>
//                 </div>
//
//                 <h3>Rate Limiting gegen Brute Force:</h3>
//                 <div class="linux-code">
//                     <pre><code># SSH Brute Force Schutz
// iptables -A INPUT -p tcp --dport 22 -m state --state NEW -m recent --set --name SSH
// iptables -A INPUT -p tcp --dport 22 -m state --state NEW -m recent --update --seconds 60 --hitcount 4 --name SSH -j DROP</code></pre>
//                 </div>
//
//                 <h2>Erkennung von Firewall-Problemen</h2>
//
//                 <h3>Häufige Probleme:</h3>
//                 <ul>
//                     <li><strong>SSH nicht erreichbar:</strong> Prüfe Port 22 Regel</li>
//                     <li><strong>Website nicht ladbar:</strong> Prüfe Ports 80/443</li>
//                     <li><strong>Hohe CPU-Last:</strong> Zu viele Regeln oder Logging</li>
//                     <li><strong>Falsche Positives:</strong> Zu restriktive Regeln</li>
//                 </ul>
//
//                 <h3>Debugging-Tools:</h3>
//                 <div class="linux-code">
//                     <pre><code># Aktuelle Regeln anzeigen
// iptables -L -n -v
//
// # Live-Verkehr beobachten
// tcpdump -i eth0 port 80
//
// # Firewall-Logs prüfen
// journalctl -u iptables
//
// # Verbindungstest
// telnet google.com 80</code></pre>
//                 </div>
//
//                 <h2>Firewall-Mythen aufgeklärt</h2>
//
//                 <h3>Mythos 1: "Firewall macht alles sicher"</h3>
//                 <p><strong>Realität:</strong> Firewall ist nur eine Schicht der Sicherheit. Du brauchst auch sichere Software, Updates und Überwachung.</p>
//
//                 <h3>Mythos 2: "Standard-Firewall ist ausreichend"</h3>
//                 <p><strong>Realität:</strong> Viele Standard-Konfigurationen sind zu permissiv. Passe sie an deine Bedürfnisse an.</p>
//
//                 <h3>Mythos 3: "Hardware-Firewall ist besser als Software"</h3>
//                 <p><strong>Realität:</strong> Beide haben ihre Vor- und Nachteile. Software-Firewalls sind oft flexibler.</p>
//
//                 <h2>Fazit</h2>
//                 <p>Eine Firewall ist essenziell für jeden Server, aber sie ist nur ein Teil eines umfassenden Sicherheitskonzepts. Kombiniere sie mit anderen Sicherheitsmaßnahmen wie regelmäßigen Updates, sicheren Passwörtern und Überwachung.</p>
//
//                 <div class="warning-box">
//                     <strong>⚠️ Wichtig:</strong> Eine falsch konfigurierte Firewall kann mehr Schaden anrichten als gar keine! Teste alle Regeln gründlich.
//                 </div>
//
//                 <h2>Weiterführende Artikel</h2>
//                 <ul>
//                     <li><a href="unterschied-zwischen-software-und-hardware-firewalls.html">Unterschied zwischen Software- und Hardware-Firewalls</a></li>
//                     <li><a href="fail2ban-optimal-konfigurieren.html">Fail2Ban optimal konfigurieren</a></li>
//                     <li><a href="linux-hardening-schritt-fuer-schritt.html">Linux Hardening Schritt-für-Schritt</a></li>
//                 </ul>
//             </div>
//
//             <a href="../index.html" class="back-link">← Zurück zur Übersicht</a>
//         </article>
//     </main>
//
//     <footer>
//         <div class="container">
//             <p>&copy; 2025 Mein Blog. Alle Rechte vorbehalten.</p>
//         </div>
//     </footer>
//
//     <script type="application/ld+json">
//     {
//         "@context": "https://schema.org",
//         "@type": "Article",
//         "headline": "Was ist eine Firewall wirklich?",
//         "author": {
//             "@type": "Person",
//             "name": "Mein Blog"
//         },
//         "datePublished": "2025-10-11T18:00:00.000Z",
//         "publisher": {
//             "@type": "Organization",
//             "name": "Mein Blog"
//         }
//     }
//     </script>
// </body>
// </html>
//
