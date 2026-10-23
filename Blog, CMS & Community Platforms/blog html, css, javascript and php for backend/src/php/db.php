<?php
$host = 'localhost';
$db = 'dein_datenbankname';
$user = 'dein_benutzername';
$pass = 'dein_passwort';

try {
    $pdo = new PDO("mysql:host=$host;dbname=$db", $user, $pass);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    echo "Verbindungsfehler: " . $e->getMessage();
}
?>
