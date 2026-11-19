// Goose-Port-Spiegel von: projects/github-repos-forgecms/templates/auth/login.html
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/github-repos-forgecms/templates/auth/login.html");
}

// ---- Original-Code (projects/github-repos-forgecms/templates/auth/login.html), unveraendert, als Inline-Doku ----
// {% extends "base.html" %}
//
// {% block title %}Login{% endblock %}
//
// {% block content %}
// <div class="row justify-content-center">
//     <div class="col-md-6">
//         <div class="card">
//             <div class="card-header">
//                 <h4 class="mb-0">Login</h4>
//             </div>
//             <div class="card-body">
//                 <form method="POST">
//                     <div class="mb-3">
//                         <label for="email" class="form-label">Email</label>
//                         <input type="email" class="form-control" id="email" name="email" required>
//                     </div>
//                     <div class="mb-3">
//                         <label for="password" class="form-label">Password</label>
//                         <input type="password" class="form-control" id="password" name="password" required>
//                     </div>
//                     <button type="submit" class="btn btn-primary">Login</button>
//                 </form>
//                 <p class="mt-3">
//                     Don't have an account? <a href="{{ url_for('auth.register') }}">Register here</a>
//                 </p>
//             </div>
//         </div>
//     </div>
// </div>
// {% endblock %}
