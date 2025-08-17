# AI-Native B2B GenAI SaaS

This is a Next.js-based SaaS application that provides AI capabilities using Ollama.

## Prerequisites

1. Node.js 18 or later
2. Ollama running locally on port 11434
3. Docker (for deployment)

## Local Development

1. Install dependencies:
```bash
npm install
```

2. Run the development server:
```bash
npm run dev
```

3. Open [http://localhost:3000](http://localhost:3000) in your browser.

## Docker Deployment

1. Build the Docker image:
```bash
docker build -t minisaas .
```

2. Run the container:
```bash
docker run -p 3000:3000 minisaas
```

## Features

- Custom authentication system
- Protected dashboard
- Integration with local Ollama instance
- Containerized deployment support
