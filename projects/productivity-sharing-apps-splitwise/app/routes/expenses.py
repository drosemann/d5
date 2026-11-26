from flask import Blueprint, request, jsonify
from app import db
from app.models.expense import Expense, ExpenseSplit
from app.models.user import User
from app.services.balance_service import BalanceService
from marshmallow import Schema, fields

expenses_bp = Blueprint('expenses', __name__)

class ExpenseSchema(Schema):
    description = fields.Str(required=True)
    amount = fields.Float(required=True)
    user_id = fields.Int(required=True)
    group_id = fields.Int(required=False, allow_none=True)
    splits = fields.List(fields.Dict(), required=False)

expense_schema = ExpenseSchema()

@expenses_bp.route('/create', methods=['POST'])
def create_expense():
    try:
        # Validate input
        data = expense_schema.load(request.json)
        
        # Create expense
        new_expense = Expense(
            description=data['description'],
            amount=data['amount'],
            user_id=data['user_id'],
            group_id=data.get('group_id')
        )
        
        db.session.add(new_expense)
        db.session.flush()  # To get the new expense ID
        
        # Handle splits
        if 'splits' in data:
            for split in data['splits']:
                expense_split = ExpenseSplit(
                    expense_id=new_expense.id,
                    user_id=split['user_id'],
                    amount=split['amount']
                )
                db.session.add(expense_split)
        
        db.session.commit()
        
        return jsonify(new_expense.to_dict()), 201
    
    except Exception as e:
        db.session.rollback()
        return jsonify({'error': str(e)}), 500

@expenses_bp.route('/user/<int:user_id>', methods=['GET'])
def get_user_expenses(user_id):
    try:
        expenses = Expense.query.filter_by(user_id=user_id).all()
        return jsonify([expense.to_dict() for expense in expenses]), 200
    except Exception as e:
        return jsonify({'error': str(e)}), 500

@expenses_bp.route('/balance/<int:user_id>', methods=['GET'])
def get_balance(user_id):
    try:
        if User.query.get(user_id) is None:
            return jsonify({'error': 'User not found'}), 404
        group_id = request.args.get('group_id', type=int)
        return jsonify(BalanceService.calculate_user_balance(user_id, group_id)), 200
    except Exception as e:
        return jsonify({'error': str(e)}), 500

@expenses_bp.route('/group/<int:group_id>/balances', methods=['GET'])
def get_group_balances(group_id):
    try:
        return jsonify(BalanceService.calculate_group_balances(group_id)), 200
    except Exception as e:
        return jsonify({'error': str(e)}), 500

class SettleSchema(Schema):
    from_user_id = fields.Int(required=True)
    to_user_id = fields.Int(required=True)
    amount = fields.Float(required=True)
    group_id = fields.Int(required=False, allow_none=True)

settle_schema = SettleSchema()

@expenses_bp.route('/settle', methods=['POST'])
def settle():
    try:
        data = settle_schema.load(request.json or {})
        if data['amount'] <= 0:
            return jsonify({'error': 'Amount must be positive'}), 400
        if data['from_user_id'] == data['to_user_id']:
            return jsonify({'error': 'Users must differ'}), 400
        result = BalanceService.settle_up(
            data['from_user_id'], data['to_user_id'], data['amount'], data.get('group_id')
        )
        return jsonify(result), 201
    except Exception as e:
        return jsonify({'error': str(e)}), 400
