// Goose-Port-Spiegel von: projects/ai-&-llm-projects-ai-assistant-html,-css,-javascript,-python-(flask)-for-openai-api/src/app.py
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/ai-&-llm-projects-ai-assistant-html,-css,-javascript,-python-(flask)-for-openai-api/src/app.py");
}

// ---- Original-Code (projects/ai-&-llm-projects-ai-assistant-html,-css,-javascript,-python-(flask)-for-openai-api/src/app.py), unveraendert, als Inline-Doku ----
// from flask import Flask, render_template, request, jsonify
// import openai
// import os
// from dotenv import load_dotenv
//
// # Lade Umgebungsvariablen
// load_dotenv()
//
// app = Flask(__name__)
// openai.api_key = os.getenv('OPENAI_API_KEY')
//
// @app.route('/')
// def home():
//     return render_template('index.html')
//
// @app.route('/api/chat', methods=['POST'])
// def chat():
//     try:
//         user_message = request.json.get('message')
//         
//         # OpenAI API Aufruf
//         response = openai.ChatCompletion.create(
//             model="gpt-3.5-turbo",
//             messages=[
//                 {"role": "system", "content": "Du bist ein hilfreicher KI-Assistent."},
//                 {"role": "user", "content": user_message}
//             ]
//         )
//         
//         ai_response = response.choices[0].message.content
//         
//         return jsonify({'response': ai_response})
//     
//     except Exception as e:
//         return jsonify({'error': str(e)}), 500
//
// if __name__ == '__main__':
//     app.run(debug=True) 
