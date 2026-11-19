<?php
header('Content-Type: application/json');
require_once 'config.php';

$page = isset($_GET['page']) ? (int)$_GET['page'] : 1;
$per_page = 10;
$offset = ($page - 1) * $per_page;

// Add search functionality
$search = isset($_GET['search']) ? $_GET['search'] : '';
if ($search) {
    $stmt = $pdo->prepare("SELECT * FROM entries WHERE message LIKE ? OR name LIKE ?");
    $stmt->execute(["%$search%", "%$search%"]);
}

try {
    $stmt = $pdo->query("SELECT * FROM entries ORDER BY created_at DESC LIMIT $offset, $per_page");
    $entries = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // Get total count for pagination
    $total = $pdo->query("SELECT COUNT(*) FROM entries")->fetchColumn();
    $total_pages = ceil($total / $per_page);

    echo json_encode([
        'entries' => $entries,
        'total_pages' => $total_pages,
        'current_page' => $page
    ]);
} catch(PDOException $e) {
    echo json_encode(['error' => $e->getMessage()]);
}
?> 