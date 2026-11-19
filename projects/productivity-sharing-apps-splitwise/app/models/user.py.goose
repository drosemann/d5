// Goose-Port-Spiegel von: projects/productivity-sharing-apps-splitwise/app/models/user.py
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/productivity-sharing-apps-splitwise/app/models/user.py");
}

// ---- Original-Code (projects/productivity-sharing-apps-splitwise/app/models/user.py), unveraendert, als Inline-Doku ----
// from app import db, bcrypt
// from sqlalchemy.orm import relationship
// from sqlalchemy import Column, Integer, String, Float
//
// class User(db.Model):
//     __tablename__ = 'users'
//     
//     id = Column(Integer, primary_key=True)
//     username = Column(String(50), unique=True, nullable=False)
//     email = Column(String(120), unique=True, nullable=False)
//     password_hash = Column(String(255), nullable=False)
//     
//     # Relationships
//     expenses = relationship('Expense', back_populates='user')
//     group_memberships = relationship('GroupMembership', back_populates='user')
//     
//     def set_password(self, password):
//         self.password_hash = bcrypt.generate_password_hash(password).decode('utf-8')
//     
//     def check_password(self, password):
//         return bcrypt.check_password_hash(self.password_hash, password)
//     
//     def to_dict(self):
//         return {
//             'id': self.id,
//             'username': self.username,
//             'email': self.email
//         }
//
