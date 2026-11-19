// Goose-Port-Spiegel von: projects/github-repos-forum-for-nerds/Blog, CMS & Community Platforms/blog website (modern ui, admin panel)/blog_website/templates/base.html
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/github-repos-forum-for-nerds/Blog, CMS & Community Platforms/blog website (modern ui, admin panel)/blog_website/templates/base.html");
}

// ---- Original-Code (projects/github-repos-forum-for-nerds/Blog, CMS & Community Platforms/blog website (modern ui, admin panel)/blog_website/templates/base.html), unveraendert, als Inline-Doku ----
// <!DOCTYPE html>
// <html lang="en">
// <head>
//     <meta charset="UTF-8">
//     <meta name="viewport" content="width=device-width, initial-scale=1.0">
//     <title>{% block title %}Modern Blog{% endblock %}</title>
//     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
//     <style>
//         body {
//             background-color: #f4f6f9;
//             font-family: 'Arial', sans-serif;
//         }
//         .blog-header {
//             background-color: #2c3e50;
//             color: white;
//             padding: 2rem 0;
//         }
//         .blog-card {
//             transition: all 0.3s ease;
//             box-shadow: 0 4px 6px rgba(0,0,0,0.1);
//         }
//         .blog-card:hover {
//             transform: translateY(-5px);
//             box-shadow: 0 6px 12px rgba(0,0,0,0.15);
//         }
//     </style>
//     {% block extra_css %}{% endblock %}
// </head>
// <body>
//     <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
//         <div class="container">
//             <a class="navbar-brand" href="{{ url_for('index') }}">Modern Blog</a>
//             <div class="navbar-nav ms-auto">
//                 {% if current_user.is_authenticated %}
//                     <a class="nav-link" href="{{ url_for('admin_dashboard') }}">Dashboard</a>
//                     <a class="nav-link" href="{{ url_for('logout') }}">Logout</a>
//                 {% else %}
//                     <a class="nav-link" href="{{ url_for('login') }}">Admin Login</a>
//                 {% endif %}
//             </div>
//         </div>
//     </nav>
//
//     <div class="container mt-4">
//         {% with messages = get_flashed_messages(with_categories=true) %}
//             {% if messages %}
//                 {% for category, message in messages %}
//                     <div class="alert alert-{{ category or 'info' }}">
//                         {{ message }}
//                     </div>
//                 {% endfor %}
//             {% endif %}
//         {% endwith %}
//
//         {% block content %}{% endblock %}
//     </div>
//
//     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
//     {% block extra_js %}{% endblock %}
// </body>
// </html>
//
