# Dockerfile to build python application.
FROM python:3.8-slim-buster
RUN apt-get update && \
    apt-get install python-psycopg2 -y && \
    python3 -m pip install --upgrade pip && \
    python3 -m pip install kafka-python psycopg2-binary
RUN groupadd -r appgroup && \
    useradd -r appuser -g appgroup
USER appuser
WORKDIR /app
COPY ./*.py ./
ENTRYPOINT python3 app.py
