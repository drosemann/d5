// Goose-Port-Spiegel von: projects/github-repos-forum-for-nerds-blog,-cms-&-community-platforms-blog-website-frontend-backend/login.php
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/github-repos-forum-for-nerds-blog,-cms-&-community-platforms-blog-website-frontend-backend/login.php");
}

// ---- Original-Code (projects/github-repos-forum-for-nerds-blog,-cms-&-community-platforms-blog-website-frontend-backend/login.php), unveraendert, als Inline-Doku ----
// <?php
// // login.php
// session_start();
// require_once 'config.php';
//
// $message = '';
// if ($_SERVER["REQUEST_METHOD"] == "POST") {
//     // Einfaches, fest vorgegebenes Admin-Passwort (nur zu Demonstrationszwecken)
//     $admin_username = "admin";
//     $admin_password = "admin123";
//
//     $username = trim($_POST['username'] ?? '');
//     $password = trim($_POST['password'] ?? '');
//
//     if ($username === $admin_username && $password === $admin_password) {
//         $_SESSION['admin_logged_in'] = true;
//         header("Location: admin.php");
//         exit;
//     } else {
//         $message = "Ungültige Anmeldeinformationen.";
//     }
// }
// ?>
// <!DOCTYPE html>
// <html lang="de">
// <head>
//     <meta charset="UTF-8">
//     <title>Admin Login</title>
// </head>
// <body>
//     <h1>Admin Login</h1>
//     <?php if($message): ?>
//         <p style="color: red;"><?php echo $message; ?></p>
//     <?php endif; ?>
//     <form method="post" action="login.php">
//         <label>Benutzername: <input type="text" name="username" required></label><br>
//         <label>Passwort: <input type="password" name="password" required></label><br>
//         <input type="submit" value="Login">
//     </form>
// </body>
// </html>
