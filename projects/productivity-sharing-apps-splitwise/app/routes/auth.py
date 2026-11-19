from flask import Blueprint, request, jsonify
from app import db
from app.models.user import User
from marshmallow import Schema, fields, ValidationError

auth_bp = Blueprint('auth', __name__)

class UserSchema(Schema):
    username = fields.Str(required=True)
    email = fields.Email(required=True)
    password = fields.Str(required=True, validate=lambda p: len(p) >= 6)

user_schema = UserSchema()

@auth_bp.route('/register', methods=['POST'])
def register():
    try:
        # Validate input
        data = user_schema.load(request.json)
        
        # Check if user already exists
        existing_user = User.query.filter(
            (User.username == data['username']) | 
            (User.email == data['email'])
        ).first()
        
        if existing_user:
            return jsonify({'error': 'Username or email already exists'}), 400
        
        # Create new user
        new_user = User(
            username=data['username'], 
            email=data['email']
        )
        new_user.set_password(data['password'])
        
        # Save to database
        db.session.add(new_user)
        db.session.commit()
        
        return jsonify(new_user.to_dict()), 201
    
    except ValidationError as err:
        return jsonify(err.messages), 400
    except Exception as e:
        db.session.rollback()
        return jsonify({'error': str(e)}), 500

@auth_bp.route('/login', methods=['POST'])
def login():
    try:
        data = request.json
        user = User.query.filter_by(username=data['username']).first()
        
        if user and user.check_password(data['password']):
            return jsonify(user.to_dict()), 200
        
        return jsonify({'error': 'Invalid credentials'}), 401
    
    except Exception as e:
        return jsonify({'error': str(e)}), 500
