"""Isolierter Browser-Worker: nur SSRF-geprüfte URLs, ohne Secrets."""
from app.tools.registry import ssrf_geprueft
def abrufen(url: str) -> str:
    if not ssrf_geprueft(url): raise ValueError("URL blockiert (SSRF-Schutz)")
    return f"[Platzhalter] Abruf von {url} erfolgt isoliert und protokolliert."
