from flask import Flask, request, jsonify

app = Flask(__name__)

@app.route('/submit-url', methods=['POST'])
def submit_url():
    url = request.json.get('url')
    # Placeholder for URL processing logic
    return jsonify({'message': 'URL received', 'url': url})

if __name__ == '__main__':
    app.run(debug=True)