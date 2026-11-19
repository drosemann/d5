// Goose-Port-Spiegel von: projects/startup-business-concepts-video-platform/templates/login.html
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/startup-business-concepts-video-platform/templates/login.html");
}

// ---- Original-Code (projects/startup-business-concepts-video-platform/templates/login.html), unveraendert, als Inline-Doku ----
// {% extends "base.html" %}
//
// {% block title %}Login{% endblock %}
//
// {% block content %}
// <div class="row justify-content-center mt-4">
//     <div class="col-md-6">
//         <div class="card">
//             <div class="card-header">
//                 <h2>Login</h2>
//             </div>
//             <div class="card-body">
//                 <form method="POST">
//                     <div class="mb-3">
//                         <label for="username" class="form-label">Username</label>
//                         <input type="text" class="form-control" id="username" name="username" required>
//                     </div>
//                     <div class="mb-3">
//                         <label for="password" class="form-label">Password</label>
//                         <input type="password" class="form-control" id="password" name="password" required>
//                     </div>
//                     <button type="submit" class="btn btn-primary">Login</button>
//                     <p class="mt-3">Don't have an account? <a href="{{ url_for('register') }}">Register here</a></p>
//                 </form>
//             </div>
//         </div>
//     </div>
// </div>
// {% endblock %}
//
