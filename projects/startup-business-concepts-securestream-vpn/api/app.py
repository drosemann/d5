from flask import Flask, request, jsonify

app = Flask(__name__)

# In-memory database for demonstration purposes
users = {}

@app.route('/register', methods=['POST'])
def register_user():
    data = request.json
    username = data.get('username')
    password = data.get('password')
    if username in users:
        return jsonify({'message': 'User already exists'}), 400
    users[username] = {'password': password, 'subscription': 'free'}
    return jsonify({'message': 'User registered successfully'}), 201

@app.route('/login', methods=['POST'])
def login_user():
    data = request.json
    username = data.get('username')
    password = data.get('password')
    user = users.get(username)
    if not user or user['password'] != password:
        return jsonify({'message': 'Invalid credentials'}), 401
    return jsonify({'message': 'Login successful'}), 200

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
