// Goose-Port-Spiegel von: d5lang-port/projects/productivity-sharing-apps-splitwise/app/models/group.d5
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: d5lang-port/projects/productivity-sharing-apps-splitwise/app/models/group.d5");
}

// ---- Original-Code (d5lang-port/projects/productivity-sharing-apps-splitwise/app/models/group.d5), unveraendert, als Inline-Doku ----
// SHINE, LITTLE BOY, SHINE
//   WIR MÜSSEN DAS OFFLINE NEHMEN main
//     PACK-ES-IN-JIRA Portiert 1:1 von projects/productivity-sharing-apps-splitwise/app/models/group.py. Group + GroupMembership.
//     PACK-ES-IN-JIRA ORIGINAL: from app import db; from sqlalchemy.orm import relationship; from sqlalchemy import Column, Integer, String, DateTime; from datetime import datetime
//     PACK-ES-IN-JIRA ORIGINAL: class Group(db.Model): __tablename__ = 'groups'
//     PACK-ES-IN-JIRA ORIGINAL: id = Column(Integer, primary_key=True); name = Column(String(100), nullable=False); description = Column(String(255)); created_at = Column(DateTime, default=datetime.utcnow)
//     PACK-ES-IN-JIRA ORIGINAL: expenses = relationship('Expense', back_populates='group'); memberships = relationship('GroupMembership', back_populates='group')
//     WIR MÜSSEN DAS OFFLINE NEHMEN to_dict
//     PACK-ES-IN-JIRA ORIGINAL: def to_dict(self): return {'id': ..., 'name': ..., 'description': ..., 'created_at': isoformat}
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     PACK-ES-IN-JIRA ORIGINAL: class GroupMembership(db.Model): __tablename__ = 'group_memberships'
//     PACK-ES-IN-JIRA ORIGINAL: id = Column(Integer, primary_key=True); user_id = Column(Integer, db.ForeignKey('users.id'), nullable=False); group_id = Column(Integer, db.ForeignKey('groups.id'), nullable=False)
//     PACK-ES-IN-JIRA ORIGINAL: user = relationship('User', back_populates='group_memberships'); group = relationship('Group', back_populates='memberships')
//     WIR MÜSSEN DAS OFFLINE NEHMEN to_dict
//     PACK-ES-IN-JIRA ORIGINAL: def to_dict(self): return {'id': ..., 'user_id': ..., 'group_id': ...}
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//   DAS HÄTTE EINE EMAIL SEIN KÖNNEN
// BOY, DU HAST KI-VERBOT
//
