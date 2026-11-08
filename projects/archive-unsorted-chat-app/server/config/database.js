const mysql = require('mysql2');

const pool = mysql.createPool({
    host: process.env.DB_HOST || 'localhost',
    user: process.env.DB_USER || 'chatapp_user',
    password: process.env.DB_PASSWORD || 'your_password',
    database: process.env.DB_NAME || 'chatapp_db',
    waitForConnections: true,
    connectionLimit: 10,
    queueLimit: 0
});

module.exports = pool.promise();
