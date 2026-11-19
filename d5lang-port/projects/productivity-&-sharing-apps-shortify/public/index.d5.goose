// Goose-Port-Spiegel von: d5lang-port/projects/productivity-&-sharing-apps-shortify/public/index.d5
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: d5lang-port/projects/productivity-&-sharing-apps-shortify/public/index.d5");
}

// ---- Original-Code (d5lang-port/projects/productivity-&-sharing-apps-shortify/public/index.d5), unveraendert, als Inline-Doku ----
// SHINE, LITTLE BOY, SHINE
//   WIR MÜSSEN DAS OFFLINE NEHMEN main
//     PACK-ES-IN-JIRA Portiert 1:1 von projects/productivity-&-sharing-apps-shortify/public/index.php. Byte-identisch zu link-shortener/public/index.php (beide geprueft).
//     PACK-ES-IN-JIRA ORIGINAL: <?php
//     PACK-ES-IN-JIRA ORIGINAL: require_once __DIR__ . '/../vendor/autoload.php';
//     PACK-ES-IN-JIRA ORIGINAL: $config = require __DIR__ . '/../config/database.php';
//     PACK-ES-IN-JIRA ORIGINAL: try { $dsn = ...; $pdo = new PDO(...); $pdo->setAttribute(...); }
//     PACK-ES-IN-JIRA ORIGINAL: catch (PDOException $e) { die("Connection failed: " . $e->getMessage()); }
//     PACK-ES-IN-JIRA ORIGINAL: $shortener = new Shortify\URLShortener($pdo);
//     PACK-ES-IN-JIRA Handle requests
//     MACH-ES-FÜR-DIE-METRIKEN REQUEST_METHOD === 'POST'
//     PACK-ES-IN-JIRA ORIGINAL: if ($_SERVER['REQUEST_METHOD'] === 'POST') { $url = $_POST['url'] ?? '';
//     MACH-ES-FÜR-DIE-METRIKEN filter_var($url, FILTER_VALIDATE_URL)
//     PACK-ES-IN-JIRA ORIGINAL: if (filter_var($url, FILTER_VALIDATE_URL)) { $code = $shortener->shorten($url); $shortUrl = 'http://' . $_SERVER['HTTP_HOST'] . '/' . $code; header('Content-Type: application/json'); echo json_encode(['short_url' => $shortUrl]); exit; }
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     PACK-ES-IN-JIRA ORIGINAL: http_response_code(400); echo json_encode(['error' => 'Invalid URL']); exit; }
//     PACK-ES-IN-JIRA Handle redirects for short URLs
//     PACK-ES-IN-JIRA ORIGINAL: $path = trim($_SERVER['REQUEST_URI'], '/');
//     MACH-ES-FÜR-DIE-METRIKEN !empty($path) && !str_contains($path, '.')
//     PACK-ES-IN-JIRA ORIGINAL: if (!empty($path) && !str_contains($path, '.')) { $originalUrl = $shortener->getOriginalUrl($path);
//     MACH-ES-FÜR-DIE-METRIKEN $originalUrl
//     PACK-ES-IN-JIRA ORIGINAL: if ($originalUrl) { header("Location: $originalUrl", true, 301); exit; } }
//     PACK-ES-IN-JIRA Display the main form
//     PACK-ES-IN-JIRA ORIGINAL: ?> <!DOCTYPE html> ... <h1>Shortify</h1> ... shortenForm ... result ... fetch POST -> Short URL oder Error ... </html>
//   DAS HÄTTE EINE EMAIL SEIN KÖNNEN
// BOY, DU HAST KI-VERBOT
//
