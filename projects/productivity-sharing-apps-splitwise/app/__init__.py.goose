// Goose-Port-Spiegel von: projects/productivity-sharing-apps-splitwise/app/__init__.py
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/productivity-sharing-apps-splitwise/app/__init__.py");
}

// ---- Original-Code (projects/productivity-sharing-apps-splitwise/app/__init__.py), unveraendert, als Inline-Doku ----
// from flask import Flask
// from flask_sqlalchemy import SQLAlchemy
// from flask_bcrypt import Bcrypt
//
// db = SQLAlchemy()
// bcrypt = Bcrypt()
//
// def create_app():
//     app = Flask(__name__)
//     
//     # Configuration
//     app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///splitwise.db'
//     app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
//     app.config['SECRET_KEY'] = 'your_secret_key_here'  # Replace with a secure random key
//     
//     # Initialize extensions
//     db.init_app(app)
//     bcrypt.init_app(app)
//     
//     # Import and register blueprints
//     from .routes.auth import auth_bp
//     from .routes.expenses import expenses_bp
//     from .routes.groups import groups_bp
//     
//     app.register_blueprint(auth_bp, url_prefix='/api/auth')
//     app.register_blueprint(expenses_bp, url_prefix='/api/expenses')
//     app.register_blueprint(groups_bp, url_prefix='/api/groups')
//     
//     return app
//
