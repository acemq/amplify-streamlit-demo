FROM python:3.11-slim

RUN apt-get update && apt-get install -y \
    build-essential && \
    pip install --upgrade pip && \
    pip install streamlit

WORKDIR /app
COPY app.py .

EXPOSE 8501

CMD ["streamlit", "run", "app.py", "--server.port=8501", "--server.enableCORS=false"]
