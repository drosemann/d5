# d5 super-app — Vercel Container deploy
# Serves the framework-free app/ shell (static, no build) on $PORT.
# The SolidJS variant in app-solid/ can be swapped in later;
# this is the zero-dependency path that works on a fresh import.
FROM python:3.11-slim

WORKDIR /app
COPY . .

EXPOSE 3000
ENV PORT=3000
CMD ["sh", "-c", "python3 -m http.server \"$PORT\" --directory app"]
