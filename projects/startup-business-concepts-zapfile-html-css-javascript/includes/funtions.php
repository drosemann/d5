<?php
require_once 'db.php';

function getCurrentUserStorage($ip) {
    global $conn;
    $stmt = $conn->prepare("SELECT SUM(file_size) FROM files WHERE ip_address = ?");
    $stmt->bind_param('s', $ip);
    $stmt->execute();
    $result = $stmt->get_result();
    $row = $result->fetch_row();
    return $row[0] ?? 0;
}

function generateFileUrl($fileName) {
    return SITE_URL . '/download.php?file=' . urlencode($fileName);
}

function storeFileInfo($fileName, $fileSize, $ip) {
    global $conn;
    $stmt = $conn->prepare("INSERT INTO files (filename, file_size, ip_address, upload_date) VALUES (?, ?, ?, NOW())");
    $stmt->bind_param('sis', $fileName, $fileSize, $ip);
    $stmt->execute();
}

// Cleanup function to be run via cron job
function cleanupExpiredFiles() {
    global $conn;
    $stmt = $conn->prepare("SELECT filename FROM files WHERE upload_date < DATE_SUB(NOW(), INTERVAL ? DAY)");
    $stmt->bind_param('i', FILE_EXPIRY_DAYS);
    $stmt->execute();
    $result = $stmt->get_result();
    
    while ($row = $result->fetch_assoc()) {
        $filePath = '../uploads/' . $row['filename'];
        if (file_exists($filePath)) {
            unlink($filePath);
        }
    }
    
    $conn->query("DELETE FROM files WHERE upload_date < DATE_SUB(NOW(), INTERVAL " . FILE_EXPIRY_DAYS . " DAY)");
}