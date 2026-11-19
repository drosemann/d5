"""Strukturierte JSON-Logs ohne Secrets."""
import json, logging, sys

class JsonFormatter(logging.Formatter):
    def format(self, record):
        payload = {"level": record.levelname, "msg": record.getMessage(),
                   "logger": record.name, "corr": getattr(record, "corr", "-")}
        return json.dumps(payload, ensure_ascii=False)

h = logging.StreamHandler(sys.stdout); h.setFormatter(JsonFormatter())
root = logging.getLogger(); root.handlers = [h]; root.setLevel(logging.INFO)
def get_logger(name: str): return logging.getLogger(name)
