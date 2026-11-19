// Goose-Port-Spiegel von: projects/github-repos-forum-for-nerds-blog,-cms-&-community-platforms-blog-website-frontend-backend/delete_article.php
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/github-repos-forum-for-nerds-blog,-cms-&-community-platforms-blog-website-frontend-backend/delete_article.php");
}

// ---- Original-Code (projects/github-repos-forum-for-nerds-blog,-cms-&-community-platforms-blog-website-frontend-backend/delete_article.php), unveraendert, als Inline-Doku ----
// <?php
// // delete_article.php
// session_start();
// require_once 'config.php';
//
// if (!isset($_SESSION['admin_logged_in'])) {
//     header("Location: login.php");
//     exit;
// }
//
// $id = $_GET['id'] ?? '';
// if ($id) {
//     $stmt = $pdo->prepare("DELETE FROM articles WHERE id = ?");
//     $stmt->execute([$id]);
// }
// header("Location: admin.php");
// exit;
// ?>
