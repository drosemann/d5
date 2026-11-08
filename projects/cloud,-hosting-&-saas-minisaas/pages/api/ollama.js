export default async function handler(req, res) {
  if (req.method === 'POST') {
    let prompt = '';
    if (req.headers['content-type']?.includes('application/json')) {
      prompt = req.body.prompt;
    } else {
      prompt = req.body.prompt || '';
    }
    try {
      const response = await fetch('http://localhost:11434/api/generate', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json'
        },
        body: JSON.stringify({
          model: "llama2",
          prompt: prompt,
          stream: false
        })
      });
      const data = await response.json();
      res.status(200).json(data);
    } catch (e) {
      res.status(500).json({ error: 'Ollama call failed', details: e.toString() });
    }
  } else {
    res.status(405).json({ error: 'Method not allowed' });
  }
}
