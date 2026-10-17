FROM python:3.12-slim
ENV PYTHONDONTWRITEBYTECODE=1 PYTHONUNBUFFERED=1 AKTIENWERK_DATA_DIR=/data
WORKDIR /app
COPY app /app/app
COPY aktienwerk.png /app/aktienwerk.png
COPY LICENSE /app/LICENSE
RUN mkdir -p /data && chown -R 10001:10001 /data /app
USER 10001:10001
EXPOSE 8080
VOLUME ["/data"]
CMD ["python", "-m", "app", "serve"]

