from flask import Flask, jsonify
from flask_cors import CORS
import speedtest

app = Flask(__name__)
CORS(app)

@app.route('/api/speedtest', methods=['GET'])
def run_speedtest():
    st = speedtest.Speedtest()
    st.get_best_server()
    download_speed = st.download() / 1e+6  # Convert to Mbps
    upload_speed = st.upload() / 1e+6  # Convert to Mbps
    ping = st.results.ping

    return jsonify({
        'download_speed': download_speed,
        'upload_speed': upload_speed,
        'ping': ping
    })

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=7000)
