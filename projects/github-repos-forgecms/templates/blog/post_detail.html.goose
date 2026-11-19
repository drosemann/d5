// Goose-Port-Spiegel von: projects/github-repos-forgecms/templates/blog/post_detail.html
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/github-repos-forgecms/templates/blog/post_detail.html");
}

// ---- Original-Code (projects/github-repos-forgecms/templates/blog/post_detail.html), unveraendert, als Inline-Doku ----
// {% extends "base.html" %}
//
// {% block title %}{{ post.title }}{% endblock %}
//
// {% block content %}
// <article class="blog-post">
//     {% if is_preview %}
//     <div class="alert alert-warning">Preview mode: this post may not be publicly visible yet.</div>
//     {% endif %}
//
//     {% if post.featured_image %}
//     <img src="{{ url_for('static', filename='uploads/' + post.featured_image) }}" class="img-fluid mb-4 rounded" alt="{{ post.title }}">
//     {% endif %}
//     
//     <h1 class="mb-4">{{ post.title }}</h1>
//     
//     <div class="text-muted mb-4">
//         Posted by {{ post.author.username }} on {{ post.created_at.strftime('%B %d, %Y') }}
//     </div>
//
//     <div class="blog-content">
//         {{ post.rendered_content | safe }}
//     </div>
// </article>
// {% endblock %}
//
