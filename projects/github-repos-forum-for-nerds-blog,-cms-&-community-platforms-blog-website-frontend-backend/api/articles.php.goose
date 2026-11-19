// Goose-Port-Spiegel von: projects/github-repos-forum-for-nerds-blog,-cms-&-community-platforms-blog-website-frontend-backend/api/articles.php
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/github-repos-forum-for-nerds-blog,-cms-&-community-platforms-blog-website-frontend-backend/api/articles.php");
}

// ---- Original-Code (projects/github-repos-forum-for-nerds-blog,-cms-&-community-platforms-blog-website-frontend-backend/api/articles.php), unveraendert, als Inline-Doku ----
// <?php
// // api/articles.php
// header('Content-Type: application/json');
// require_once '../config.php';
//
// $stmt = $pdo->query("SELECT * FROM articles ORDER BY created_at DESC");
// $articles = $stmt->fetchAll(PDO::FETCH_ASSOC);
// echo json_encode($articles);
// ?>
