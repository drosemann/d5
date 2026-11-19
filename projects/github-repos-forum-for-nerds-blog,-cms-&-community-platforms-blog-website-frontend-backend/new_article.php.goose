// Goose-Port-Spiegel von: projects/github-repos-forum-for-nerds-blog,-cms-&-community-platforms-blog-website-frontend-backend/new_article.php
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/github-repos-forum-for-nerds-blog,-cms-&-community-platforms-blog-website-frontend-backend/new_article.php");
}

// ---- Original-Code (projects/github-repos-forum-for-nerds-blog,-cms-&-community-platforms-blog-website-frontend-backend/new_article.php), unveraendert, als Inline-Doku ----
// <?php
// // new_article.php
// session_start();
// require_once 'config.php';
//
// if (!isset($_SESSION['admin_logged_in'])) {
//     header("Location: login.php");
//     exit;
// }
//
// $message = '';
//
// if ($_SERVER["REQUEST_METHOD"] == "POST") {
//     $title = trim($_POST['title'] ?? '');
//     $content = trim($_POST['content'] ?? '');
//
//     if ($title && $content) {
//         $stmt = $pdo->prepare("INSERT INTO articles (title, content, created_at) VALUES (?, ?, NOW())");
//         if ($stmt->execute([$title, $content])) {
//             $message = "Artikel erfolgreich erstellt.";
//         } else {
//             $message = "Fehler beim Erstellen des Artikels.";
//         }
//     } else {
//         $message = "Bitte sowohl einen Titel als auch Inhalt eingeben.";
//     }
// }
// ?>
// <!DOCTYPE html>
// <html lang="de">
// <head>
//     <meta charset="UTF-8">
//     <title>Neuer Artikel</title>
// </head>
// <body>
//     <h1>Neuer Artikel</h1>
//     <?php if($message): ?>
//         <p><?php echo $message; ?></p>
//     <?php endif; ?>
//     <form method="post" action="new_article.php">
//         <label>Titel: <input type="text" name="title" required></label><br>
//         <label>Inhalt:<br>
//             <textarea name="content" rows="10" cols="50" required></textarea>
//         </label><br>
//         <input type="submit" value="Artikel erstellen">
//     </form>
//     <p><a href="admin.php">Zurück zum Admin-Bereich</a></p>
// </body>
// </html>
