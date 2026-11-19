// Goose-Port-Spiegel von: projects/productivity-sharing-apps-splitwise/app/models/group.py
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/productivity-sharing-apps-splitwise/app/models/group.py");
}

// ---- Original-Code (projects/productivity-sharing-apps-splitwise/app/models/group.py), unveraendert, als Inline-Doku ----
// from app import db
// from sqlalchemy.orm import relationship
// from sqlalchemy import Column, Integer, String, DateTime
// from datetime import datetime
//
// class Group(db.Model):
//     __tablename__ = 'groups'
//     
//     id = Column(Integer, primary_key=True)
//     name = Column(String(100), nullable=False)
//     description = Column(String(255))
//     created_at = Column(DateTime, default=datetime.utcnow)
//     
//     # Relationships
//     expenses = relationship('Expense', back_populates='group')
//     memberships = relationship('GroupMembership', back_populates='group')
//     
//     def to_dict(self):
//         return {
//             'id': self.id,
//             'name': self.name,
//             'description': self.description,
//             'created_at': self.created_at.isoformat()
//         }
//
// class GroupMembership(db.Model):
//     __tablename__ = 'group_memberships'
//     
//     id = Column(Integer, primary_key=True)
//     user_id = Column(Integer, db.ForeignKey('users.id'), nullable=False)
//     group_id = Column(Integer, db.ForeignKey('groups.id'), nullable=False)
//     
//     # Relationships
//     user = relationship('User', back_populates='group_memberships')
//     group = relationship('Group', back_populates='memberships')
//     
//     def to_dict(self):
//         return {
//             'id': self.id,
//             'user_id': self.user_id,
//             'group_id': self.group_id
//         }
//
