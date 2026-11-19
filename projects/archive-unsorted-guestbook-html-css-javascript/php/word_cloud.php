<?php

// Generate word cloud from messages
function generateWordCloud() {
    $stmt = $pdo->query("SELECT message FROM entries");
    $words = [];
    while ($row = $stmt->fetch()) {
        $message_words = str_word_count($row['message'], 1);
        foreach ($message_words as $word) {
            $words[$word] = isset($words[$word]) ? $words[$word] + 1 : 1;
        }
    }
    return $words;
} 