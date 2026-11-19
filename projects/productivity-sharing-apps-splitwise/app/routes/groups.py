from flask import Blueprint, request, jsonify
from app import db
from app.models.group import Group, GroupMembership
from marshmallow import Schema, fields

groups_bp = Blueprint('groups', __name__)

class GroupSchema(Schema):
    name = fields.Str(required=True)
    description = fields.Str(required=False)
    members = fields.List(fields.Int(), required=True)

group_schema = GroupSchema()

@groups_bp.route('/create', methods=['POST'])
def create_group():
    try:
        # Validate input
        data = group_schema.load(request.json)
        
        # Create group
        new_group = Group(
            name=data['name'],
            description=data.get('description', '')
        )
        
        db.session.add(new_group)
        db.session.flush()  # To get the new group ID
        
        # Add members
        for user_id in data['members']:
            membership = GroupMembership(
                user_id=user_id,
                group_id=new_group.id
            )
            db.session.add(membership)
        
        db.session.commit()
        
        return jsonify(new_group.to_dict()), 201
    
    except Exception as e:
        db.session.rollback()
        return jsonify({'error': str(e)}), 500

@groups_bp.route('/user/<int:user_id>', methods=['GET'])
def get_user_groups(user_id):
    try:
        # Find groups where the user is a member
        memberships = GroupMembership.query.filter_by(user_id=user_id).all()
        groups = [Group.query.get(membership.group_id) for membership in memberships]
        
        return jsonify([group.to_dict() for group in groups]), 200
    except Exception as e:
        return jsonify({'error': str(e)}), 500
