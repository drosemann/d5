<?php
header('Content-Type: application/json');
require_once 'config.php';

// Add at the start of the file
session_start();

// Basic rate limiting
if (isset($_SESSION['last_post_time'])) {
    $timeSinceLastPost = time() - $_SESSION['last_post_time'];
    if ($timeSinceLastPost < 60) { // 1 minute cooldown
        echo json_encode(['success' => false, 'error' => 'Please wait before posting again']);
        exit;
    }
}
$_SESSION['last_post_time'] = time();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $data = json_decode(file_get_contents('php://input'), true);
    
    $stmt = $pdo->prepare("INSERT INTO entries (name, email, message) VALUES (?, ?, ?)");
    
    try {
        $stmt->execute([$data['name'], $data['email'], $data['message']]);
        echo json_encode(['success' => true, 'id' => $pdo->lastInsertId()]);
    } catch(PDOException $e) {
        echo json_encode(['success' => false, 'error' => $e->getMessage()]);
    }

    // Add file handling
    if (isset($_FILES['attachment'])) {
        $uploadDir = 'uploads/';
        $uploadFile = $uploadDir . basename($_FILES['attachment']['name']);
        move_uploaded_file($_FILES['attachment']['tmp_name'], $uploadFile);
        // Save file path to database
    }

    // Add scheduled posting
    if (isset($data['schedule_time'])) {
        $stmt = $pdo->prepare("INSERT INTO scheduled_entries (message, publish_at) VALUES (?, ?)");
        $stmt->execute([$data['message'], $data['schedule_time']]);
    }

    // Messages that become visible after a certain date
    if (isset($data['reveal_date'])) {
        $stmt = $pdo->prepare("INSERT INTO time_capsule_entries (message, reveal_date) VALUES (?, ?)");
        $stmt->execute([$data['message'], $data['reveal_date']]);
    }

    // Add category support
    if (isset($data['tags'])) {
        $stmt = $pdo->prepare("INSERT INTO entry_tags (entry_id, tag) VALUES (?, ?)");
        foreach ($data['tags'] as $tag) {
            $stmt->execute([$entry_id, $tag]);
        }
    }

    // Add auto-expiring messages
    if (isset($data['expire_after'])) {
        $expire_date = date('Y-m-d H:i:s', strtotime("+{$data['expire_after']} hours"));
        $stmt = $pdo->prepare("INSERT INTO entries (message, expire_at) VALUES (?, ?)");
        $stmt->execute([$data['message'], $expire_date]);
    }
}
?> 