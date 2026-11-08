<!-- Use this file to provide workspace-specific custom instructions to Copilot -->

# Shortify Project Instructions

This is a PHP-based URL shortener project using MariaDB and NGINX. When working with this codebase:

1. Follow PSR-4 autoloading standards for PHP classes
2. Use prepared statements for all database queries to prevent SQL injection
3. Implement proper input validation for URLs
4. Maintain URL visit tracking functionality
5. Keep the Docker configuration synchronized across Dockerfile, docker-compose.yml, and nginx.conf
6. Follow RESTful principles for API endpoints
7. Maintain responsive design in the frontend HTML/CSS
8. Ensure proper error handling and logging
9. Keep security best practices in mind, especially for URL validation and database access

Key components:
- URLShortener class handles the core URL shortening logic
- Database schema includes urls table with visit tracking
- Frontend uses vanilla JavaScript for API interactions
- Docker setup includes PHP-FPM, NGINX, and MariaDB containers