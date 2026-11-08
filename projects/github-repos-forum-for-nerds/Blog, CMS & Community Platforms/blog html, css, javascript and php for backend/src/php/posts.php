<?php
include 'db.php'; // Ensure the correct path is used
// ... PHP-Logik zum Abrufen von Blogbeiträgen ...
$query = $pdo->query("SELECT * FROM posts ORDER BY created_at DESC");
$posts = $query->fetchAll(PDO::FETCH_ASSOC);
?> 