<?php
// Track visitor information
$visitor_data = [
    'ip' => $_SERVER['REMOTE_ADDR'],
    'browser' => $_SERVER['HTTP_USER_AGENT'],
    'visited_at' => date('Y-m-d H:i:s'),
    'page' => $_SERVER['REQUEST_URI']
]; 