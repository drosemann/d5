// Goose-Port-Spiegel von: projects/productivity-sharing-apps-pichosty/templates/gallery.html
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/productivity-sharing-apps-pichosty/templates/gallery.html");
}

// ---- Original-Code (projects/productivity-sharing-apps-pichosty/templates/gallery.html), unveraendert, als Inline-Doku ----
// {% extends "base.html" %}
//
// {% block content %}
// <div class="row">
//     <div class="col-12">
//         <h2 class="mb-4">Meine Bildergalerie</h2>
//         {% if images %}
//             <div class="row row-cols-1 row-cols-md-3 g-4">
//                 {% for image in images %}
//                 <div class="col">
//                     <div class="card h-100">
//                         <img src="{{ url_for('serve_image', filename=image.filename) }}" 
//                              class="card-img-top" 
//                              alt="{{ image.filename }}"
//                              style="object-fit: cover; height: 200px;">
//                         <div class="card-body">
//                             <h5 class="card-title">{{ image.filename }}</h5>
//                             <p class="card-text">
//                                 Hochgeladen am: {{ image.upload_date.strftime('%d.%m.%Y') }}
//                                 {% if image.is_private %}
//                                     <span class="badge bg-secondary ms-2">Privat</span>
//                                 {% endif %}
//                             </p>
//                         </div>
//                         <div class="card-footer">
//                             <button class="btn btn-sm btn-outline-primary copy-link" 
//                                     data-link="{{ url_for('serve_image', filename=image.filename, _external=True) }}">
//                                 Link kopieren
//                             </button>
//                         </div>
//                     </div>
//                 </div>
//                 {% endfor %}
//             </div>
//         {% else %}
//             <div class="alert alert-info">
//                 Sie haben noch keine Bilder hochgeladen. 
//                 <a href="{{ url_for('upload_image') }}" class="alert-link">Laden Sie jetzt ein Bild hoch!</a>
//             </div>
//         {% endif %}
//     </div>
// </div>
// {% endblock %}
//
// {% block scripts %}
// <script>
// document.querySelectorAll('.copy-link').forEach(button => {
//     button.addEventListener('click', function() {
//         const link = this.getAttribute('data-link');
//         navigator.clipboard.writeText(link).then(() => {
//             this.textContent = 'Kopiert!';
//             this.classList.remove('btn-outline-primary');
//             this.classList.add('btn-success');
//             
//             setTimeout(() => {
//                 this.textContent = 'Link kopieren';
//                 this.classList.remove('btn-success');
//                 this.classList.add('btn-outline-primary');
//             }, 2000);
//         });
//     });
// });
// </script>
// {% endblock %}
//
