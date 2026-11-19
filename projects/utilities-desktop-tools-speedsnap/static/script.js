document.getElementById('test-speed').addEventListener('click', function() {
    fetch('/api/speedtest')
        .then(response => response.json())
        .then(data => {
            const resultsDiv = document.getElementById('results');
            resultsDiv.innerHTML = `
                <p>Download Speed: ${data.download_speed.toFixed(2)} Mbps</p>
                <p>Upload Speed: ${data.upload_speed.toFixed(2)} Mbps</p>
                <p>Ping: ${data.ping} ms</p>
            `;
        })
        .catch(error => {
            console.error('Error:', error);
        });
});
