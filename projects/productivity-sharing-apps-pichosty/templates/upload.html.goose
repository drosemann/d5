// Goose-Port-Spiegel von: projects/productivity-sharing-apps-pichosty/templates/upload.html
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/productivity-sharing-apps-pichosty/templates/upload.html");
}

// ---- Original-Code (projects/productivity-sharing-apps-pichosty/templates/upload.html), unveraendert, als Inline-Doku ----
// {% extends "base.html" %}
//
// {% block content %}
// <div class="row">
//     <div class="col-md-8 offset-md-2">
//         <h2 class="mb-4">Bild Hochladen</h2>
//         <form id="uploadForm" enctype="multipart/form-data">
//             <div class="mb-3">
//                 <label for="imageFile" class="form-label">Wählen Sie ein Bild</label>
//                 <input class="form-control" type="file" id="imageFile" name="file" accept="image/*" required>
//             </div>
//             <div class="mb-3 form-check">
//                 <input type="checkbox" class="form-check-input" id="privateImage" name="is_private">
//                 <label class="form-check-label" for="privateImage">Privates Bild</label>
//             </div>
//             <button type="submit" class="btn btn-primary">Hochladen</button>
//         </form>
//         <div id="uploadStatus" class="mt-3"></div>
//     </div>
// </div>
// {% endblock %}
//
// {% block scripts %}
// <script>
// document.getElementById('uploadForm').addEventListener('submit', function(e) {
//     e.preventDefault();
//     
//     const formData = new FormData(this);
//     const uploadStatus = document.getElementById('uploadStatus');
//     
//     fetch('/upload', {
//         method: 'POST',
//         body: formData
//     })
//     .then(response => response.json())
//     .then(data => {
//         if (data.message) {
//             uploadStatus.innerHTML = `
//                 <div class="alert alert-success">
//                     ${data.message}
//                     <br>Dateiname: ${data.filename}
//                 </div>
//             `;
//         } else {
//             uploadStatus.innerHTML = `
//                 <div class="alert alert-danger">
//                     ${data.error}
//                 </div>
//             `;
//         }
//     })
//     .catch(error => {
//         uploadStatus.innerHTML = `
//             <div class="alert alert-danger">
//                 Ein Fehler ist aufgetreten: ${error}
//             </div>
//         `;
//     });
// });
// </script>
// {% endblock %}
//
