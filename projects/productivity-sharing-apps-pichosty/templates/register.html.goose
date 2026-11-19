// Goose-Port-Spiegel von: projects/productivity-sharing-apps-pichosty/templates/register.html
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/productivity-sharing-apps-pichosty/templates/register.html");
}

// ---- Original-Code (projects/productivity-sharing-apps-pichosty/templates/register.html), unveraendert, als Inline-Doku ----
// {% extends "base.html" %}
//
// {% block content %}
// <div class="row">
//     <div class="col-md-6 offset-md-3">
//         <h2 class="mb-4">Registrieren</h2>
//         <form id="registerForm">
//             <div class="mb-3">
//                 <label for="username" class="form-label">Benutzername</label>
//                 <input type="text" class="form-control" id="username" name="username" required minlength="3" maxlength="50">
//             </div>
//             <div class="mb-3">
//                 <label for="email" class="form-label">E-Mail</label>
//                 <input type="email" class="form-control" id="email" name="email" required>
//             </div>
//             <div class="mb-3">
//                 <label for="password" class="form-label">Passwort</label>
//                 <input type="password" class="form-control" id="password" name="password" required minlength="8">
//                 <div class="form-text">Mindestens 8 Zeichen</div>
//             </div>
//             <div class="mb-3">
//                 <label for="confirm_password" class="form-label">Passwort bestätigen</label>
//                 <input type="password" class="form-control" id="confirm_password" required minlength="8">
//             </div>
//             <button type="submit" class="btn btn-primary">Registrieren</button>
//             <p class="mt-3">
//                 Bereits ein Konto? <a href="{{ url_for('login') }}">Anmelden</a>
//             </p>
//         </form>
//         <div id="registerStatus" class="mt-3"></div>
//     </div>
// </div>
// {% endblock %}
//
// {% block scripts %}
// <script>
// document.getElementById('registerForm').addEventListener('submit', function(e) {
//     e.preventDefault();
//     
//     const password = document.getElementById('password').value;
//     const confirmPassword = document.getElementById('confirm_password').value;
//     const registerStatus = document.getElementById('registerStatus');
//     
//     if (password !== confirmPassword) {
//         registerStatus.innerHTML = `
//             <div class="alert alert-danger">
//                 Passwörter stimmen nicht überein
//             </div>
//         `;
//         return;
//     }
//     
//     const formData = new FormData(this);
//     
//     fetch('/register', {
//         method: 'POST',
//         body: formData
//     })
//     .then(response => response.json())
//     .then(data => {
//         if (data.message) {
//             registerStatus.innerHTML = `
//                 <div class="alert alert-success">
//                     ${data.message}
//                     <br>Weiterleitung zur Anmeldung...
//                 </div>
//             `;
//             setTimeout(() => {
//                 window.location.href = '/login';
//             }, 2000);
//         } else {
//             registerStatus.innerHTML = `
//                 <div class="alert alert-danger">
//                     ${data.error}
//                 </div>
//             `;
//         }
//     })
//     .catch(error => {
//         registerStatus.innerHTML = `
//             <div class="alert alert-danger">
//                 Ein Fehler ist aufgetreten: ${error}
//             </div>
//         `;
//     });
// });
// </script>
// {% endblock %}
//
