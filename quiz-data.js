// CCNA v7 Quiz-Daten mit allen Modulen gemäß offizieller Kursstruktur
const quizData = {
    // CCNA 1 - Introduction to Networks (ITN) v7.0
    quizzes: [
        {
            id: 'itn-module-1-3',
            title: 'ITN: Module 1-3 - Basic Network Connectivity and Communications',
            description: 'Grundlagen der Netzwerkkonnektivität und -kommunikation',
            questions: [
                {
                    question: 'Welche der folgenden Aussagen beschreibt am besten die Funktion der Netzwerkschicht?',
                    options: [
                        'Verwaltet die physische Übertragung der Daten',
                        'Bietet logische Adressierung und Routing',
                        'Stellt Sitzungen zwischen Anwendungen her',
                        'Kodiert Daten in ein für die Übertragung geeignetes Format'
                    ],
                    correctAnswer: 1,
                    explanation: 'Die Netzwerkschicht (Schicht 3) ist für die logische Adressierung und das Routing von Datenpaketen zwischen verschiedenen Netzwerken verantwortlich.'
                },
                {
                    question: 'Welches Protokoll ist für die automatische IP-Adressvergabe in einem Netzwerk zuständig?',
                    options: [
                        'DNS',
                        'HTTP',
                        'DHCP',
                        'FTP'
                    ],
                    correctAnswer: 2,
                    explanation: 'DHCP (Dynamic Host Configuration Protocol) weist Geräten automatisch IP-Adressen und andere Netzwerkkonfigurationen zu.'
                },
                {
                    question: 'Welche der folgenden Topologien beschreibt ein Netzwerk, bei dem alle Geräte mit einem zentralen Gerät verbunden sind?',
                    options: [
                        'Bus',
                        'Stern',
                        'Ring',
                        'Mesh'
                    ],
                    correctAnswer: 1,
                    explanation: 'In einer Sterntopologie sind alle Geräte mit einem zentralen Gerät (wie einem Switch) verbunden, das den Datenverkehr verwaltet.'
                },
                {
                    question: 'Welche Schicht des TCP/IP-Modells entspricht der Transportschicht des OSI-Modells?',
                    options: [
                        'Anwendungsschicht',
                        'Transportschicht',
                        'Internetschicht',
                        'Netzzugangsschicht'
                    ],
                    correctAnswer: 1,
                    explanation: 'Die Transportschicht ist in beiden Modellen gleich benannt und für die Ende-zu-Ende-Kommunikation zuständig.'
                },
                {
                    question: 'Welches Kabeltyp wird für eine direkte Verbindung zwischen zwei Computern ohne Switch verwendet?',
                    options: [
                        'Gerades Kabel',
                        'Crossover-Kabel',
                        'Konsolenkabel',
                        'Serielles Kabel'
                    ],
                    correctAnswer: 1,
                    explanation: 'Ein Crossover-Kabel wird benötigt, um zwei gleichartige Geräte (z.B. zwei Computer) direkt zu verbinden, da es die Sende- und Empfangsleitungen kreuzt.'
                },
                {
                    question: 'Welches Protokoll ist für die Namensauflösung von Hostnamen zu IP-Adressen zuständig?',
                    options: [
                        'DHCP',
                        'DNS',
                        'HTTP',
                        'FTP'
                    ],
                    correctAnswer: 1,
                    explanation: 'DNS (Domain Name System) ist für die Übersetzung von Hostnamen in IP-Adressen zuständig.'
                },
                {
                    question: 'Welche der folgenden Aussagen zu IPv6 ist FALSCH?',
                    options: [
                        'IPv6 verwendet 128-Bit-Adressen',
                        'IPv6-Adressen werden in hexadezimaler Schreibweise dargestellt',
                        'IPv6 verwendet ARP für die Adressauflösung',
                        'IPv6 hat integrierte Sicherheitsfunktionen (IPsec)'
                    ],
                    correctAnswer: 2,
                    explanation: 'IPv6 verwendet nicht ARP, sondern das Neighbor Discovery Protocol (NDP) für die Adressauflösung.'
                },
                {
                    question: 'Welche der folgenden Aussagen zur Sicherheit in drahtlosen Netzwerken ist RICHTIG?',
                    options: [
                        'WEP ist die sicherste Verschlüsselungsmethode',
                        'WPA3 bietet die höchste Sicherheit',
                        'Die Deaktivierung der SSID-Ausstrahlung bietet ausreichenden Schutz',
                        'MAC-Adressfilterung ist eine zuverlässige Sicherheitsmaßnahme'
                    ],
                    correctAnswer: 1,
                    explanation: 'WPA3 bietet derzeit die höchste Sicherheit unter den genannten Optionen. WEP ist veraltet, und die anderen beiden Optionen bieten nur geringen Schutz.'
                },
                {
                    question: 'Welches Gerät arbeitet auf der Schicht 2 des OSI-Modells?',
                    options: [
                        'Router',
                        'Hub',
                        'Switch',
                        'Firewall'
                    ],
                    correctAnswer: 2,
                    explanation: 'Ein Switch arbeitet auf der Sicherungsschicht (Schicht 2) des OSI-Modells und verwendet MAC-Adressen zum Weiterleiten von Daten.'
                },
                {
                    question: 'Welche der folgenden Aussagen zu Netzwerktopologien ist RICHTIG?',
                    options: [
                        'In einer Bustopologie teilen sich alle Geräte ein gemeinsames Übertragungsmedium',
                        'In einer Ringtopologie werden Daten in eine Richtung übertragen',
                        'In einer Sterntopologie ist die Ausfallsicherheit höher als in einer vermaschten Topologie',
                        'In einer vermaschten Topologie sind Geräte mit mehreren anderen Geräten verbunden'
                    ],
                    correctAnswer: 2,
                    explanation: 'In einer vermaschten Topologie ist die Ausfallsicherheit höher als in einer Sterntopologie, da es mehrere Verbindungswege gibt.'
                },
                {
                    question: 'Welches Protokoll wird für die sichere Übertragung von Webseiten verwendet?',
                    options: [
                        'HTTP',
                        'HTTPS',
                        'FTP',
                        'TFTP'
                    ],
                    correctAnswer: 1,
                    explanation: 'HTTPS (HTTP Secure) verschlüsselt die Kommunikation zwischen Webbrowser und Webserver mit TLS/SSL.'
                },
                {
                    question: 'Welche der folgenden Aussagen zu Netzwerkkabeln ist RICHTIG?',
                    options: [
                        'CAT5e unterstützt Gigabit-Ethernet',
                        'Glasfaserkabel sind unempfindlich gegenüber elektromagnetischen Störungen',
                        'STP-Kabel haben eine bessere Abschirmung als UTP-Kabel',
                        'CAT6a Kabel haben eine maximale Länge von 1000 Metern'
                    ],
                    correctAnswer: 3,
                    explanation: 'Die maximale Länge für Kupferkabel (wie CAT6a) beträgt 100 Meter, nicht 1000 Meter. 1000 Meter wäre die typische Reichweite für Glasfaserkabel.'
                },
                {
                    question: 'Welche der folgenden Aussagen zu Netzwerkprotokollen ist RICHTIG?',
                    options: [
                        'TCP ist verbindungslos und unzuverlässig',
                        'UDP ist verbindungsorientiert',
                        'TCP stellt eine zuverlässige, verbindungsorientierte Kommunikation bereit',
                        'UDP wird für die Übertragung von E-Mails verwendet'
                    ],
                    correctAnswer: 2,
                    explanation: 'TCP (Transmission Control Protocol) stellt eine zuverlässige, verbindungsorientierte Kommunikation bereit, während UDP verbindungslos und unzuverlässig ist.'
                },
                {
                    question: 'Welche der folgenden Aussagen zu Netzwerksicherheit ist FALSCH?',
                    options: [
                        'Eine Firewall filtert Netzwerkverkehr basierend auf Sicherheitsregeln',
                        'VPNs verschlüsseln die Kommunikation über unsichere Netzwerke',
                        'Ein IDS erkennt und verhindert Angriffe automatisch',
                        'Zwei-Faktor-Authentifizierung erhöht die Sicherheit'
                    ],
                    correctAnswer: 2,
                    explanation: 'Ein IDS (Intrusion Detection System) erkennt Angriffe, verhindert sie aber nicht automatisch. Dafür wäre ein IPS (Intrusion Prevention System) zuständig.'
                }
            ]
        },
        {
            id: 'itn-module-4-7',
            title: 'ITN: Module 4-7 - Ethernet Concepts',
            description: 'Grundlagen und Konzepte von Ethernet-Netzwerken',
            questions: [
                {
                    question: 'Welche der folgenden Aussagen zu Ethernet-Frames ist RICHTIG?',
                    options: [
                        'Enthalten IP-Adressen in ihrem Header',
                        'Werden von Routter weitergeleitet',
                        'Enthalten MAC-Adressen in ihrem Header',
                        'Sind auf der Anwendungsschicht angesiedelt'
                    ],
                    correctAnswer: 2,
                    explanation: 'Ethernet-Frames enthalten sowohl Quell- als auch Ziel-MAC-Adressen in ihrem Header, die für die Vermittlung auf der Sicherungsschicht (Schicht 2) verwendet werden.'
                },
                {
                    question: 'Was ist der Hauptzweck der ARP (Address Resolution Protocol)?',
                    options: [
                        'IP-Adressen in MAC-Adressen aufzulösen',
                        'MAC-Adressen in IP-Adressen aufzulösen',
                        'Hostnamen in IP-Adressen aufzulösen',
                        'IP-Adressen in Hostnamen aufzulösen'
                    ],
                    correctAnswer: 0,
                    explanation: 'ARP wird verwendet, um die MAC-Adresse zu ermitteln, die einer bestimmten IP-Adresse in einem lokalen Netzwerk zugeordnet ist.'
                },
                {
                    question: 'Welche Aussage über Switches ist FALSCH?',
                    options: [
                        'Arbeiten auf Schicht 2 des OSI-Modells',
                        'Können Broadcast-Domänen unterteilen',
                        'Lernen MAC-Adressen automatisch',
                        'Können Kollisionsdomänen unterteilen'
                    ],
                    correctAnswer: 1,
                    explanation: 'Switches können Kollisionsdomänen unterteilen, aber nicht direkt Broadcast-Domänen. Dafür werden Router benötigt.'
                },
                {
                    question: 'Welche der folgenden Aussagen zur CSMA/CD (Carrier Sense Multiple Access with Collision Detection) ist RICHTIG?',
                    options: [
                        'Wird in drahtlosen Netzwerken verwendet',
                        'Verhindert alle Kollisionen im Netzwerk',
                        'Ist ein Protokoll zur Kollisionserkennung in Ethernet-Netzwerken',
                        'Wird in modernen Vollduplex-Ethernet-Netzwerken benötigt'
                    ],
                    correctAnswer: 2,
                    explanation: 'CSMA/CD ist ein Protokoll zur Kollisionserkennung in Halbduplex-Ethernet-Netzwerken, wird aber in modernen Vollduplex-Netzwerken nicht mehr benötigt.'
                },
                {
                    question: 'Was ist die Hauptfunktion eines Switches in einem Netzwerk?',
                    options: [
                        'Verbinden verschiedener Netzwerke',
                        'Filtern, Weiterleiten und Verteilen von Frames basierend auf MAC-Adressen',
                        'Zuweisen von IP-Adressen an Netzwerkgeräte',
                        'Übersetzen von privaten in öffentliche IP-Adressen'
                    ],
                    correctAnswer: 1,
                    explanation: 'Ein Switch ist ein intelligentes Gerät, das Netzwerkverkehr basierend auf MAC-Adressen filtert und weiterleitet, wodurch die Effizienz des Netzwerks verbessert wird.'
                }
            ]
        },
        {
            id: 'itn-module-8-10',
            title: 'ITN: Module 8-10 - Communicating Between Networks',
            description: 'Kommunikation zwischen Netzwerken und grundlegendes Routing',
            questions: [
                {
                    question: 'Welche der folgenden IP-Adressen ist eine gültige private IP-Adresse?',
                    options: [
                        '192.168.1.1',
                        '172.32.0.1',
                        '169.254.1.1',
                        '8.8.8.8'
                    ],
                    correctAnswer: 0,
                    explanation: '192.168.0.0/16 ist einer der privaten IP-Adressbereiche, die für die Verwendung in privaten Netzwerken reserviert sind.'
                },
                {
                    question: 'Wie viele nutzbare Host-Adressen bietet ein /26-Netzwerk?',
                    options: [
                        '14',
                        '30',
                        '62',
                        '126'
                    ],
                    correctAnswer: 2,
                    explanation: 'Ein /26-Netzwerk hat 6 Bits für Host-Adressen (32-26=6). 2^6=64, abzüglich 2 Adressen (Netzwerk- und Broadcast-Adresse) ergeben 62 nutzbare Host-Adressen.'
                },
                {
                    question: 'Welche Subnetzmaske entspricht der Präfix-Notation /27?',
                    options: [
                        '255.255.255.0',
                        '255.255.255.128',
                        '255.255.255.192',
                        '255.255.255.224'
                    ],
                    correctAnswer: 3,
                    explanation: 'Eine /27-Subnetzmaske in dezimaler Schreibweise ist 255.255.255.224 (27 führende Einsen in der Binärdarstellung).'
                },
                {
                    question: 'Was ist die Netzwerkadresse für den Host 192.168.10.145/28?',
                    options: [
                        '192.168.10.0',
                        '192.168.10.128',
                        '192.168.10.144',
                        '192.168.10.160'
                    ],
                    correctAnswer: 2,
                    explanation: 'Bei einer /28-Subnetzmaske (255.255.255.240) sind die Netzwerkadressen in 16er-Schritten: 0, 16, 32, 48, 64, 80, 96, 112, 128, 144, 160, usw. 145 fällt in das Netzwerk 192.168.10.144.'
                },
                {
                    question: 'Welche der folgenden Aussagen zu IPv6 ist FALSCH?',
                    options: [
                        'Verwendet 128-Bit-Adressen',
                        'Benötigt kein NAT für die Adressumsetzung',
                        'Verwendet ARP für die Adressauflösung',
                        'Hat integrierte Sicherheitsfunktionen (IPsec)'
                    ],
                    correctAnswer: 2,
                    explanation: 'IPv6 verwendet nicht ARP, sondern den Neighbor Discovery Protocol (NDP) für die Adressauflösung.'
                }
            ]
        },
        {
            id: 'itn-module-11-13',
            title: 'ITN: Module 11-13 - IP Addressing',
            description: 'IP-Adressierung, Subnetting und IPv6',
            questions: [
                {
                    question: 'Welchen Port verwendet das DNS-Protokoll standardmäßig?',
                    options: [
                        '21',
                        '25',
                        '53',
                        '80'
                    ],
                    correctAnswer: 2,
                    explanation: 'DNS verwendet standardmäßig den Port 53 für Abfragen und Antworten.'
                },
                {
                    question: 'Welcher DHCP-Nachrichtentyp wird von einem Client gesendet, um eine IP-Adresse anzufordern?',
                    options: [
                        'DHCPDISCOVER',
                        'DHCPOFFER',
                        'DHCPREQUEST',
                        'DHCPACK'
                    ],
                    correctAnswer: 0,
                    explanation: 'Ein Client sendet eine DHCPDISCOVER-Nachricht, um verfügbare DHCP-Server im Netzwerk zu finden.'
                },
                {
                    question: 'Welches Protokoll wird für die sichere Übertragung von Webseiten verwendet?',
                    options: [
                        'HTTP',
                        'FTP',
                        'HTTPS',
                        'SMTP'
                    ],
                    correctAnswer: 2,
                    explanation: 'HTTPS (HTTP Secure) verschlüsselt die Kommunikation zwischen Webbrowser und Webserver mithilfe von TLS/SSL.'
                },
                {
                    question: 'Welches Protokoll wird zum Versenden von E-Mails zwischen Servern verwendet?',
                    options: [
                        'POP3',
                        'IMAP',
                        'SMTP',
                        'HTTP'
                    ],
                    correctAnswer: 2,
                    explanation: 'SMTP (Simple Mail Transfer Protocol) wird für den Versand von E-Mails zwischen Servern verwendet, während POP3 und IMAP zum Abrufen von E-Mails durch Clients dienen.'
                },
                {
                    question: 'Was ist der Hauptzweck des DNS-Systems?',
                    options: [
                        'Zuweisung von IP-Adressen an Clients',
                        'Übersetzung von Hostnamen in IP-Adressen',
                        'Verschlüsselung von Netzwerkverkehr',
                        'Verwaltung von Netzwerkgeräten'
                    ],
                    correctAnswer: 1,
                    explanation: 'Das Domain Name System (DNS) übersetzt menschenlesbare Domänennamen (wie example.com) in die entsprechenden IP-Adressen, die Computer zur Kommunikation verwenden.'
                }
            ]
        },
        {
            id: 'itn-module-14-15',
            title: 'ITN: Module 14-15 - Network Application Communications',
            description: 'Netzwerkanwendungen und deren Kommunikation',
            questions: [
                {
                    question: 'Welches Protokoll wird für die sichere Übertragung von Webseiten verwendet?',
                    options: [
                        'HTTP',
                        'FTP',
                        'HTTPS',
                        'SMTP'
                    ],
                    correctAnswer: 2,
                    explanation: 'HTTPS (HTTP Secure) verschlüsselt die Kommunikation zwischen Webbrowser und Webserver mithilfe von TLS/SSL.'
                },
                {
                    question: 'Welches Protokoll wird zum Versenden von E-Mails zwischen Servern verwendet?',
                    options: [
                        'POP3',
                        'IMAP',
                        'SMTP',
                        'HTTP'
                    ],
                    correctAnswer: 2,
                    explanation: 'SMTP (Simple Mail Transfer Protocol) wird für den Versand von E-Mails zwischen Servern verwendet, während POP3 und IMAP zum Abrufen von E-Mails durch Clients dienen.'
                },
                {
                    question: 'Welchen Port verwendet das DNS-Protokoll standardmäßig?',
                    options: [
                        '21',
                        '25',
                        '53',
                        '80'
                    ],
                    correctAnswer: 2,
                    explanation: 'DNS verwendet standardmäßig den Port 53 für Abfragen und Antworten.'
                },
                {
                    question: 'Was ist der Hauptzweck des DNS-Systems?',
                    options: [
                        'Zuweisung von IP-Adressen an Clients',
                        'Übersetzung von Hostnamen in IP-Adressen',
                        'Verschlüsselung von Netzwerkverkehr',
                        'Verwaltung von Netzwerkgeräten'
                    ],
                    correctAnswer: 1,
                    explanation: 'Das Domain Name System (DNS) übersetzt menschenlesbare Domänennamen (wie example.com) in die entsprechenden IP-Adressen, die Computer zur Kommunikation verwenden.'
                },
                {
                    question: 'Welcher DHCP-Nachrichtentyp wird von einem Client gesendet, um eine IP-Adresse anzufordern?',
                    options: [
                        'DHCPDISCOVER',
                        'DHCPOFFER',
                        'DHCPREQUEST',
                        'DHCPACK'
                    ],
                    correctAnswer: 0,
                    explanation: 'Ein Client sendet eine DHCPDISCOVER-Nachricht, um verfügbare DHCP-Server im Netzwerk zu finden.'
                }
            ]
        },
        {
            id: 'itn-module-16-17',
            title: 'ITN: Module 16-17 - Building and Securing a Small Network',
            description: 'Aufbau und Absicherung eines kleinen Netzwerks',
            questions: [
                {
                    question: 'Welche der folgenden ist KEINE gängige Methode zur Authentifizierung?',
                    options: [
                        'Benutzername und Passwort',
                        'Zertifikate',
                        'Biometrie',
                        'NAT'
                    ],
                    correctAnswer: 3,
                    explanation: 'NAT (Network Address Translation) ist eine Technik zur Adressumsetzung und keine Authentifizierungsmethode.'
                },
                {
                    question: 'Was ist der Hauptzweck einer Firewall?',
                    options: [
                        'Viren zu erkennen und zu entfernen',
                        'Netzwerkverkehr basierend auf Sicherheitsregeln zu filtern',
                        'Daten zu verschlüsseln',
                        'Netzwerkverbindungen zu beschleunigen'
                    ],
                    correctAnswer: 1,
                    explanation: 'Eine Firewall überwacht und kontrolliert den ein- und ausgehenden Netzwerkverkehr auf der Grundlage festgelegter Sicherheitsregeln.'
                },
                {
                    question: 'Welches Protokoll wird für die sichere Fernverwaltung von Netzwerkgeräten verwendet?',
                    options: [
                        'Telnet',
                        'HTTP',
                        'SSH',
                        'FTP'
                    ],
                    correctAnswer: 2,
                    explanation: 'SSH (Secure Shell) ermöglicht eine sichere, verschlüsselte Fernverwaltung von Netzwerkgeräten, im Gegensatz zu unverschlüsselten Protokollen wie Telnet.'
                },
                {
                    question: 'Was ist der Hauptzweck des Syslog-Protokolls?',
                    options: [
                        'Verwaltung von Netzwerkgeräten',
                        'Sichere Dateiübertragung',
                        'Protokollierung von Systemmeldungen',
                        'Namensauflösung'
                    ],
                    correctAnswer: 2,
                    explanation: 'Syslog ist ein Standardprotokoll zur zentralen Erfassung und Speicherung von Protokollmeldungen von verschiedenen Netzwerkgeräten.'
                },
                {
                    question: 'Welche der folgenden Aussagen zur Netzwerksicherheit ist RICHTIG?',
                    options: [
                        'Ein sicheres Passwort sollte einfach zu merken sein',
                        'Standardkennwörter sollten nach der ersten Konfiguration geändert werden',
                        'Alle Ports sollten standardmäßig geöffnet sein',
                        'Verschlüsselung ist für drahtlose Netzwerke nicht erforderlich'
                    ],
                    correctAnswer: 1,
                    explanation: 'Standardkennwörter stellen ein erhebliches Sicherheitsrisiko dar und sollten immer sofort nach der ersten Konfiguration geändert werden.'
                }
            ]
        },
        // CCNA 2 - Switching, Routing, and Wireless Essentials (SRWE) v7.0
        {
            id: 'srwe-module-1-3',
            title: 'SRWE: Module 1-3 - Grundlagen des Switchings',
            description: 'Grundlegendes Switching und VLAN-Konfiguration',
            questions: [
                {
                    question: 'Was ist der Hauptzweck des Spanning Tree Protocol (STP)?',
                    options: [
                        'IP-Adressen zu verwalten',
                        'Schleifen im Netzwerk zu verhindern',
                        'Daten zu verschlüsseln',
                        'DNS-Anfragen zu beantworten'
                    ],
                    correctAnswer: 1,
                    explanation: 'STP verhindert Schleifen in einem Netzwerk mit redundanten Pfaden, indem es einen Schleifenfreien logischen Pfad erstellt.'
                },
                {
                    question: 'Welchen Vorteil bietet die Verwendung von VLANs in einem Netzwerk?',
                    options: [
                        'Erhöhte Bandbreite',
                        'Verbesserte Sicherheit durch logische Trennung von Netzwerken',
                        'Schnellere Internetverbindung',
                        'Größere Reichweite des Netzwerks'
                    ],
                    correctAnswer: 1,
                    explanation: 'VLANs verbessern die Sicherheit und Leistung, indem sie logische Netzwerke innerhalb einer physischen Infrastruktur erstellen und so den Broadcast-Verkehr einschränken.'
                },
                {
                    question: 'Welcher Befehl wird verwendet, um ein VLAN auf einem Cisco-Switch zu erstellen?',
                    options: [
                        'vlan 10',
                        'create vlan 10',
                        'vlan database 10',
                        'switchport vlan 10'
                    ],
                    correctAnswer: 0,
                    explanation: 'Der Befehl "vlan 10" wird im Konfigurationsmodus verwendet, um ein neues VLAN mit der Nummer 10 zu erstellen.'
                },
                {
                    question: 'Was ist der Standard-VLAN auf einem Cisco-Switch?',
                    options: [
                        'VLAN 0',
                        'VLAN 1',
                        'VLAN 10',
                        'VLAN 1002'
                    ],
                    correctAnswer: 1,
                    explanation: 'VLAN 1 ist das Standard-VLAN auf Cisco-Switches und kann weder umbenannt noch gelöscht werden.'
                },
                {
                    question: 'Welcher Befehl weist einen Switch-Port einem bestimmten VLAN zu?',
                    options: [
                        'switchport mode access',
                        'switchport access vlan 10',
                        'vlan membership 10',
                        'port vlan 10'
                    ],
                    correctAnswer: 1,
                    explanation: 'Der Befehl "switchport access vlan 10" weist den Port dem VLAN 10 zu, nachdem der Port mit "switchport mode access" als Zugriffsport konfiguriert wurde.'
                }
            ]
        },
        {
            id: 'srwe-module-4-7',
            title: 'SRWE: Module 4-7 - Routing-Grundlagen',
            description: 'Statisches und dynamisches Routing',
            questions: [
                {
                    question: 'Was ist der Standard-Administrative-Distance-Wert für direkt verbundene Netzwerke?',
                    options: [
                        '0',
                        '1',
                        '90',
                        '110'
                    ],
                    correctAnswer: 0,
                    explanation: 'Direkt verbundene Netzwerke haben einen AD-Wert von 0, was die höchste Zuverlässigkeit bedeutet.'
                },
                {
                    question: 'Welches Routing-Protokoll verwendet den Algorithmus des kürzesten Pfades (Dijkstra)?',
                    options: [
                        'RIP',
                        'EIGRP',
                        'OSPF',
                        'BGP'
                    ],
                    correctAnswer: 2,
                    explanation: 'OSPF (Open Shortest Path First) verwendet den Dijkstra-Algorithmus, um den kürzesten Pfad zu einem Zielnetzwerk zu berechnen.'
                },
                {
                    question: 'Welche der folgenden Aussagen zu statischen Routen ist RICHTIG?',
                    options: [
                        'Können sich automatisch an Netzwerkänderungen anpassen',
                        'Sind einfacher zu verwalten als dynamische Routing-Protokolle',
                        'Haben standardmäßig eine höhere Administrative Distance als OSPF',
                        'Sind für große Netzwerke besser geeignet als dynamische Routing-Protokolle'
                    ],
                    correctAnswer: 1,
                    explanation: 'Statische Routen sind einfacher zu konfigurieren und erfordern weniger Overhead als dynamische Routing-Protokolle, müssen aber manuell aktualisiert werden.'
                },
                {
                    question: 'Welcher Befehl zeigt die Routing-Tabelle auf einem Cisco-Router an?',
                    options: [
                        'show ip route',
                        'show route',
                        'display ip route',
                        'route print'
                    ],
                    correctAnswer: 0,
                    explanation: 'Der Befehl "show ip route" zeigt die IP-Routing-Tabelle auf einem Cisco-Router an.'
                },
                {
                    question: 'Was ist der Standard-Administrative-Distance-Wert für OSPF?',
                    options: [
                        '90',
                        '100',
                        '110',
                        '120'
                    ],
                    correctAnswer: 2,
                    explanation: 'OSPF hat eine Standard-Administrative Distance von 110, was es vertrauenswürdiger macht als RIP (120), aber weniger vertrauenswürdig als EIGRP (90).'
                }
            ]
        },
        {
            id: 'srwe-module-8-10',
            title: 'SRWE: Module 8-10 - Erweiterte Routing-Konzepte',
            description: 'EIGRP, OSPF und Zugriffskontrolllisten',
            questions: [
                {
                    question: 'Welches der folgenden ist KEIN Merkmal von EIGRP?',
                    options: [
                        'Verwendet den DUAL-Algorithmus',
                        'Ist ein Link-State-Routing-Protokoll',
                        'Verwendet Hello-Pakete zur Nachbarschaftsbildung',
                        'Hat eine Administrative Distance von 90'
                    ],
                    correctAnswer: 1,
                    explanation: 'EIGRP ist ein erweitertes Distanzvektor-Protokoll (auch als Hybrid-Protokoll bezeichnet), aber kein reines Link-State-Protokoll wie OSPF.'
                },
                {
                    question: 'Welchen OSPF-Nachrichtentyp verwendet ein Router, um seine Link-State-Datenbank zu beschreiben?',
                    options: [
                        'Hello',
                        'DBD (Database Description)',
                        'LSR (Link-State Request)',
                        'LSU (Link-State Update)'
                    ],
                    correctAnswer: 1,
                    explanation: 'DBD-Pakete (Database Description) werden verwendet, um die Link-State-Datenbank eines Routers zu beschreiben, während des Austauschs von Routing-Informationen.'
                },
                {
                    question: 'Welcher Befehl konfiguriert eine Standardroute auf einem Cisco-Router?',
                    options: [
                        'ip route 0.0.0.0 0.0.0.0 [next-hop-ip]',
                        'ip default-route [next-hop-ip]',
                        'ip route default [next-hop-ip]',
                        'default-route [next-hop-ip]'
                    ],
                    correctAnswer: 0,
                    explanation: 'Der Befehl "ip route 0.0.0.0 0.0.0.0 [next-hop-ip]" konfiguriert eine Standardroute, die für alle Ziele verwendet wird, die nicht genauer in der Routing-Tabelle aufgeführt sind.'
                },
                {
                    question: 'Was ist der Zweck einer Zugriffssteuerungsliste (ACL)?',
                    options: [
                        'IP-Adressen automatisch zu vergeben',
                        'Netzwerkverkehr basierend auf bestimmten Kriterien zu filtern',
                        'Routing-Updates zwischen Routern auszutauschen',
                        'VLANs zu erstellen und zu verwalten'
                    ],
                    correctAnswer: 1,
                    explanation: 'Zugriffssteuerungslisten (ACLs) werden verwendet, um Netzwerkverkehr basierend auf verschiedenen Kriterien wie Quell-/Ziel-IP, Protokoll oder Port-Nummern zu filtern oder zu steuern.'
                },
                {
                    question: 'Welcher Befehl erstellt eine erweiterte Zugriffssteuerungsliste (ACL) mit der Nummer 100?',
                    options: [
                        'access-list 100 permit ip any any',
                        'ip access-list extended 100',
                        'access-list extended 100',
                        'ip access-list 100 extended'
                    ],
                    correctAnswer: 1,
                    explanation: 'Der Befehl "ip access-list extended 100" wechselt in den Konfigurationsmodus für eine erweiterte Zugriffssteuerungsliste mit der Nummer 100.'
                }
            ]
        },
        {
            id: 'srwe-module-11-13',
            title: 'SRWE: Module 11-13 - Drahtlose Netzwerke',
            description: 'WLAN-Grundlagen und -Konfiguration',
            questions: [
                {
                    question: 'Welcher Standard beschreibt drahtlose Netzwerke?',
                    options: [
                        'IEEE 802.3',
                        'IEEE 802.11',
                        'IEEE 802.1Q',
                        'IEEE 802.1X'
                    ],
                    correctAnswer: 1,
                    explanation: 'IEEE 802.11 ist der Standard für drahtlose lokale Netzwerke (WLAN).'
                },
                {
                    question: 'Welche Frequenzbänder werden von WLAN hauptsächlich genutzt?',
                    options: [
                        '2,4 GHz und 5 GHz',
                        '900 MHz und 2,4 GHz',
                        '5 GHz und 10 GHz',
                        '2,4 GHz und 10 GHz'
                    ],
                    correctAnswer: 0,
                    explanation: 'Moderne WLANs nutzen hauptsächlich die 2,4 GHz- und 5 GHz-Frequenzbänder.'
                },
                {
                    question: 'Welche Sicherheitsmethode sollte für WLAN-Netzwerke bevorzugt werden?',
                    options: [
                        'WEP',
                        'WPA',
                        'WPA2',
                        'WPA3'
                    ],
                    correctAnswer: 3,
                    explanation: 'WPA3 ist der aktuellste und sicherste WLAN-Sicherheitsstandard.'
                },
                {
                    question: 'Was ist ein SSID?',
                    options: [
                        'Eine Art von Netzwerkkabel',
                        'Der Name eines WLAN-Netzwerks',
                        'Ein Sicherheitsprotokoll',
                        'Ein Netzwerkgerät'
                    ],
                    correctAnswer: 1,
                    explanation: 'Die SSID (Service Set Identifier) ist der Name eines WLAN-Netzwerks, der bei der Suche nach verfügbaren Netzwerken angezeigt wird.'
                },
                {
                    question: 'Was ist der Hauptunterschied zwischen Infrastruktur- und Ad-hoc-Modus bei WLANs?',
                    options: [
                        'Die verwendete Frequenz',
                        'Die Datenübertragungsrate',
                        'Die Notwendigkeit eines Zugriffspunkts',
                        'Die maximale Reichweite'
                    ],
                    correctAnswer: 2,
                    explanation: 'Im Infrastrukturmodus ist ein Zugriffspunkt (Access Point) erforderlich, während im Ad-hoc-Modus Geräte direkt miteinander kommunizieren können.'
                }
            ]
        },
        // Enterprise Networking, Security, and Automation (ENSA) v7.0
        {
            id: 'ensa-module-1-4',
            title: 'ENSA: Module 1-4 - Erweiterte Netzwerkkonzepte',
            description: 'Erweiterte Routing-Protokolle und Netzwerkskalierung',
            questions: [
                {
                    question: 'Welches Routing-Protokoll ist ein Pfadvektor-Protokoll, das im Internet verwendet wird?',
                    options: [
                        'OSPF',
                        'EIGRP',
                        'BGP',
                        'RIP'
                    ],
                    correctAnswer: 2,
                    explanation: 'BGP (Border Gateway Protocol) ist ein Pfadvektor-Protokoll, das hauptsächlich für das Routing zwischen autonomen Systemen im Internet verwendet wird.'
                },
                {
                    question: 'Was ist der Hauptzweck von Route Summarization?',
                    options: [
                        'Erhöhung der Sicherheit',
                        'Reduzierung der Größe von Routing-Tabellen',
                        'Verschlüsselung von Routing-Updates',
                        'Erhöhung der Bandbreite'
                    ],
                    correctAnswer: 1,
                    explanation: 'Route Summarization (oder Route Aggregation) reduziert die Größe von Routing-Tabellen, indem mehrere Routen zu einer einzelnen zusammenfassenden Route kombiniert werden.'
                },
                {
                    question: 'Welche der folgenden Aussagen zu OSPF Areas ist RICHTIG?',
                    options: [
                        'Alle Router müssen sich in derselben Area befinden',
                        'Die Backbone-Area muss immer Area 0 sein',
                        'Jede Area benötigt eine direkte Verbindung zum Backbone',
                        'Es können maximal 3 Areas in einem OSPF-Netzwerk existieren'
                    ],
                    correctAnswer: 2,
                    explanation: 'Im OSPF muss jede Area eine Verbindung zur Backbone-Area (Area 0) haben, entweder direkt oder über eine virtuelle Verbindung.'
                },
                {
                    question: 'Was ist der Hauptvorteil von EIGRP gegenüber OSPF?',
                    options: [
                        'Bessere Skalierbarkeit in sehr großen Netzwerken',
                        'Einfachere Konfiguration und schnellere Konvergenz',
                        'Bessere Kompatibilität mit Nicht-Cisco-Geräten',
                        'Geringerer Speicherbedarf auf den Routern'
                    ],
                    correctAnswer: 1,
                    explanation: 'EIGRP ist bekannt für seine einfache Konfiguration und schnelle Konvergenz, da es den DUAL-Algorithmus verwendet, um schnell alternative Pfade zu finden.'
                },
                {
                    question: 'Welcher Befehl aktiviert EIGRP für autonomes System 100 auf einem Cisco-Router?',
                    options: [
                        'router eigrp 100',
                        'eigrp 100',
                        'enable eigrp 100',
                        'router eigrp as 100'
                    ],
                    correctAnswer: 0,
                    explanation: 'Der Befehl "router eigrp 100" aktiviert den EIGRP-Prozess mit der autonomen Systemnummer 100 auf einem Cisco-Router.'
                }
            ]
        },
        {
            id: 'ensa-module-5-8',
            title: 'ENSA: Module 5-8 - Netzwerksicherheit',
            description: 'Erweiterte Sicherheitskonzepte und Zugriffskontrolle',
            questions: [
                {
                    question: 'Was ist der Hauptzweck von 802.1X-Authentifizierung?',
                    options: [
                        'Verschlüsselung von WLAN-Daten',
                        'Authentifizierung von Geräten am Netzwerkzugang',
                        'Verwaltung von IP-Adressen',
                        'Überwachung des Netzwerkverkehrs'
                    ],
                    correctAnswer: 1,
                    explanation: '802.1X ist ein Standard für die netzwerkbasierte Zugangskontrolle, der Geräte authentifiziert, bevor sie auf das Netzwerk zugreifen können.'
                },
                {
                    question: 'Welches Protokoll verschlüsselt die gesamte Kommunikation zwischen Client und Server?',
                    options: [
                        'SSH',
                        'HTTPS',
                        'IPsec',
                        'Alle genannten'
                    ],
                    correctAnswer: 3,
                    explanation: 'SSH, HTTPS und IPsec bieten alle Verschlüsselung für die Kommunikation zwischen Client und Server, wobei sie auf verschiedenen Schichten des OSI-Modells arbeiten.'
                },
                {
                    question: 'Was ist der Hauptzweck eines Intrusion Prevention Systems (IPS)?',
                    options: [
                        'Blockieren von unerwünschten E-Mails',
                        'Erkennen und Verhindern von Angriffen in Echtzeit',
                        'Verwaltung von Benutzerzugriffen',
                        'Überwachung der Netzwerkleistung'
                    ],
                    correctAnswer: 1,
                    explanation: 'Ein IPS erkennt und verhindert Angriffe in Echtzeit, indem es den Netzwerkverkehr überwacht und verdächtige Aktivitäten blockiert.'
                },
                {
                    question: 'Welche der folgenden ist KEINE gängige Methode zur Absicherung von Netzwerkgeräten?',
                    options: [
                        'Deaktivieren ungenutzter Dienste',
                        'Verwaltung über unverschlüsselte Protokolle',
                        'Regelmäßige Sicherheitsupdates',
                        'Verwendung starker Passwörter'
                    ],
                    correctAnswer: 1,
                    explanation: 'Die Verwaltung über unverschlüsselte Protokolle (wie Telnet oder HTTP) ist unsicher und sollte vermieden werden. Stattdessen sollten verschlüsselte Protokolle wie SSH oder HTTPS verwendet werden.'
                },
                {
                    question: 'Was ist der Hauptzweck einer DMZ (Demilitarisierte Zone)?',
                    options: [
                        'Verschlüsselung von Datenübertragungen',
                        'Trennung von internen und externen Netzwerken',
                        'Verwaltung von IP-Adressen',
                        'Überwachung der Netzwerkleistung'
                    ],
                    correctAnswer: 1,
                    explanation: 'Eine DMZ ist ein physisches oder logisches Subnetz, das öffentlich zugängliche Dienste enthält und sie vom internen Netzwerk trennt, um zusätzliche Sicherheitsebenen zu schaffen.'
                }
            ]
        },
        {
            id: 'ensa-module-9-12',
            title: 'ENSA: Module 9-12 - Netzwerkautomatisierung',
            description: 'Grundlagen der Netzwerkprogrammierung und -automatisierung',
            questions: [
                {
                    question: 'Welche Programmiersprache wird häufig für Netzwerkautomatisierung verwendet?',
                    options: [
                        'Java',
                        'Python',
                        'C++',
                        'PHP'
                    ],
                    correctAnswer: 1,
                    explanation: 'Python ist aufgrund seiner Lesbarkeit und der verfügbaren Netzwerkbibliotheken eine beliebte Wahl für die Netzwerkautomatisierung.'
                },
                {
                    question: 'Was ist der Vorteil der Netzwerkautomatisierung?',
                    options: [
                        'Manuelle Konfiguration wird beschleunigt',
                        'Reduzierung menschlicher Fehler',
                        'Konsistenz in der Konfiguration',
                        'Alle genannten Punkte'
                    ],
                    correctAnswer: 3,
                    explanation: 'Die Netzwerkautomatisierung bietet mehrere Vorteile, darunter schnellere Konfiguration, geringere Fehleranfälligkeit und konsistente Konfigurationen.'
                },
                {
                    question: 'Was ist REST API im Kontext der Netzwerkautomatisierung?',
                    options: [
                        'Ein physisches Netzwerkkabel',
                        'Ein Protokoll für die E-Mail-Übertragung',
                        'Eine Schnittstelle für die Kommunikation zwischen Anwendungen',
                        'Ein Sicherheitsprotokoll'
                    ],
                    correctAnswer: 2,
                    explanation: 'REST API (Representational State Transfer Application Programming Interface) ermöglicht die Kommunikation zwischen verschiedenen Softwareanwendungen über das HTTP-Protokoll.'
                },
                {
                    question: 'Was ist der Hauptzweck von Netzwerk-APIs?',
                    options: [
                        'Physische Netzwerkverbindungen herzustellen',
                        'Den Internetzugang zu beschleunigen',
                        'Programmatischen Zugriff auf Netzwerkgeräte und -dienste zu ermöglichen',
                        'Die WLAN-Abdeckung zu verbessern'
                    ],
                    correctAnswer: 2,
                    explanation: 'Netzwerk-APIs ermöglichen es Entwicklern, programmatisch auf Netzwerkgeräte und -dienste zuzugreifen und diese zu verwalten.'
                },
                {
                    question: 'Welches Tool wird häufig für die Konfigurationsverwaltung in der Netzwerkautomatisierung verwendet?',
                    options: [
                        'Ansible',
                        'Microsoft Word',
                        'Adobe Photoshop',
                        'Google Chrome'
                    ],
                    correctAnswer: 0,
                    explanation: 'Ansible ist ein beliebtes Open-Source-Tool für die Automatisierung von IT-Aufgaben, einschließlich der Netzwerkkonfiguration.'
                }
            ]
        },
        {
            id: 'ensa-module-13-14',
            title: 'ENSA: Module 13-14 - Netzwerkvirtualisierung und -architekturen',
            description: 'Virtualisierung, Cloud-Computing und Netzwerkarchitekturen',
            questions: [
                {
                    question: 'Was ist der Hauptvorteil der Netzwerkvirtualisierung?',
                    options: [
                        'Erhöhte physische Sicherheit',
                        'Bessere Auslastung der Hardware-Ressourcen',
                        'Schnellere Internetverbindungen',
                        'Einfachere Kabelverlegung'
                    ],
                    correctAnswer: 1,
                    explanation: 'Netzwerkvirtualisierung ermöglicht eine bessere Auslastung der physischen Hardware-Ressourcen, indem mehrere virtuelle Netzwerke auf derselben physischen Infrastruktur betrieben werden können.'
                },
                {
                    question: 'Welche der folgenden ist KEINE gängige Cloud-Bereitstellungsmodell?',
                    options: [
                        'Public Cloud',
                        'Private Cloud',
                        'Hybrid Cloud',
                        'Closed Cloud'
                    ],
                    correctAnswer: 3,
                    explanation: 'Die gängigen Cloud-Bereitstellungsmodelle sind Public Cloud, Private Cloud, Hybrid Cloud und Community Cloud. "Closed Cloud" ist kein Standardbegriff in diesem Kontext.'
                },
                {
                    question: 'Was ist der Hauptzweck von SDN (Software-Defined Networking)?',
                    options: [
                        'Erhöhung der physischen Sicherheit',
                        'Trennung der Kontroll- und Datenebene',
                        'Erhöhung der Kabelgeschwindigkeit',
                        'Verschlüsselung aller Netzwerkdaten'
                    ],
                    correctAnswer: 1,
                    explanation: 'SDN trennt die Kontroll- von der Datenebene, was eine zentralisierte und programmierbare Verwaltung des Netzwerks ermöglicht.'
                },
                {
                    question: 'Welche Technologie ermöglicht die Erstellung mehrerer logischer Netzwerke auf derselben physischen Infrastruktur?',
                    options: [
                        'VLAN',
                        'VPN',
                        'STP',
                        'NAT'
                    ],
                    correctAnswer: 0,
                    explanation: 'VLANs (Virtual Local Area Networks) ermöglichen die logische Segmentierung eines physischen Netzwerks in mehrere virtuelle Netzwerke.'
                },
                {
                    question: 'Was ist der Hauptvorteil von Netzwerkautomatisierung im Vergleich zur manuellen Konfiguration?',
                    options: [
                        'Geringere Hardwarekosten',
                        'Schnellere und konsistentere Konfiguration',
                        'Bessere drahtlose Abdeckung',
                        'Höhere Übertragungsgeschwindigkeiten'
                    ],
                    correctAnswer: 1,
                    explanation: 'Netzwerkautomatisierung ermöglicht schnellere, konsistentere und wiederholbare Konfigurationen mit geringerer Fehleranfälligkeit im Vergleich zur manuellen Konfiguration.'
                }
            ]
        }
    ]
};
