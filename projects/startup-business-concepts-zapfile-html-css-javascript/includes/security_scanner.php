<?php
require_once 'config.php';
require_once 'functions.php';

class SecurityScanner {
    private $suspiciousExtensions = ['exe', 'bat', 'cmd', 'sh', 'php', 'js'];
    private $maxSizeThreshold = 400 * 1024 * 1024; // 400MB
    private $adminEmail = 'daniel.rosemann10@gmail.com';

    public function scanFile($filePath, $fileName, $fileSize) {
        $suspicious = false;
        $reasons = [];

        // Überprüfe Dateierweiterung
        $extension = strtolower(pathinfo($fileName, PATHINFO_EXTENSION));
        if (in_array($extension, $this->suspiciousExtensions)) {
            $suspicious = true;
            $reasons[] = "Verdächtige Dateierweiterung: .$extension";
        }

        // Überprüfe Dateigröße
        if ($fileSize > $this->maxSizeThreshold) {
            $suspicious = true;
            $reasons[] = "Ungewöhnlich große Datei: " . round($fileSize / 1024 / 1024, 2) . "MB";
        }

        // Wenn verdächtig, sende E-Mail
        if ($suspicious) {
            $this->sendAlertEmail($fileName, $reasons);
        }
    }

    private function sendAlertEmail($fileName, $reasons) {
        $subject = "ZapFile - Verdächtige Datei erkannt";
        $message = "Eine verdächtige Datei wurde hochgeladen:\n\n";
        $message .= "Dateiname: $fileName\n";
        $message .= "Gründe:\n- " . implode("\n- ", $reasons);
        
        mail(
            $this->adminEmail,
            $subject,
            $message,
            "From: ZapFile Security <noreply@" . $_SERVER['SERVER_NAME'] . ">"
        );
    }
} 