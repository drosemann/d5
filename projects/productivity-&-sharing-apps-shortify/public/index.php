<?php
require_once __DIR__ . '/../vendor/autoload.php';

$config = require __DIR__ . '/../config/database.php';

try {
    $dsn = "mysql:host={$config['host']};dbname={$config['database']};charset={$config['charset']}";
    $pdo = new PDO($dsn, $config['username'], $config['password']);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die("Connection failed: " . $e->getMessage());
}

$shortener = new Shortify\URLShortener($pdo);

// Handle requests
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $url = $_POST['url'] ?? '';
    if (filter_var($url, FILTER_VALIDATE_URL)) {
        $code = $shortener->shorten($url);
        $shortUrl = 'http://' . $_SERVER['HTTP_HOST'] . '/' . $code;
        header('Content-Type: application/json');
        echo json_encode(['short_url' => $shortUrl]);
        exit;
    }
    http_response_code(400);
    echo json_encode(['error' => 'Invalid URL']);
    exit;
}

// Handle redirects for short URLs
$path = trim($_SERVER['REQUEST_URI'], '/');
if (!empty($path) && !str_contains($path, '.')) {
    $originalUrl = $shortener->getOriginalUrl($path);
    if ($originalUrl) {
        header("Location: $originalUrl", true, 301);
        exit;
    }
}

// Display the main form
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shortify - URL Shortener</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            max-width: 800px;
            margin: 40px auto;
            padding: 0 20px;
        }
        .form-container {
            text-align: center;
            margin-top: 50px;
        }
        input[type="url"] {
            width: 80%;
            padding: 10px;
            margin: 10px 0;
        }
        button {
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            border: none;
            cursor: pointer;
        }
        #result {
            margin-top: 20px;
            padding: 10px;
            display: none;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h1>Shortify</h1>
        <p>Enter a URL to shorten:</p>
        <form id="shortenForm">
            <input type="url" name="url" required placeholder="https://example.com">
            <button type="submit">Shorten</button>
        </form>
        <div id="result"></div>
    </div>
    <script>
        document.getElementById('shortenForm').addEventListener('submit', async (e) => {
            e.preventDefault();
            const form = e.target;
            const result = document.getElementById('result');
            
            try {
                const response = await fetch('/', {
                    method: 'POST',
                    body: new FormData(form)
                });
                const data = await response.json();
                
                if (response.ok) {
                    result.style.display = 'block';
                    result.innerHTML = `Short URL: <a href="${data.short_url}" target="_blank">${data.short_url}</a>`;
                } else {
                    result.style.display = 'block';
                    result.innerHTML = `Error: ${data.error}`;
                }
            } catch (err) {
                result.style.display = 'block';
                result.innerHTML = 'An error occurred. Please try again.';
            }
        });
    </script>
</body>
</html>