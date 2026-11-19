// Goose-Port-Spiegel von: projects/ai-&-llm-projects-ai-chat-website-ai/src/backend/main.py
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/ai-&-llm-projects-ai-chat-website-ai/src/backend/main.py");
}

// ---- Original-Code (projects/ai-&-llm-projects-ai-chat-website-ai/src/backend/main.py), unveraendert, als Inline-Doku ----
// from fastapi import FastAPI, HTTPException
// from pydantic import BaseModel
// import requests
// from model import HousePricePredictor
//
// app = FastAPI()
// model = HousePricePredictor()
//
// class PredictionRequest(BaseModel):
//     size: float
//     rooms: int
//     year: int
//     distance_to_center: float
//
// class ChatRequest(BaseModel):
//     message: str
//
// @app.post("/predict")
// async def predict(request: PredictionRequest):
//     try:
//         features = [
//             request.size,
//             request.rooms,
//             request.year,
//             request.distance_to_center
//         ]
//         prediction = model.predict(features)
//         return {"predicted_price": prediction}
//     except Exception as e:
//         raise HTTPException(status_code=400, detail=str(e))
//
// @app.post("/chat")
// async def chat(request: ChatRequest):
//     try:
//         # Ollama API integration
//         response = requests.post(
//             "http://localhost:11434/api/generate",
//             json={
//                 "model": "llama2",
//                 "prompt": request.message
//             }
//         )
//         return {"response": response.json()["response"]}
//     except Exception as e:
//         raise HTTPException(status_code=500, detail=str(e)) 
