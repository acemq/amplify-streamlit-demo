FROM public.ecr.aws/docker/library/python:3.11-slim

# Install system tools
RUN apt-get update && apt-get install -y \
    curl \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Upgrade pip and install Python packages
RUN pip install --upgrade pip && pip install streamlit

# Set working directory and copy app
WORKDIR /app
COPY app.py .

EXPOSE 8501

CMD ["streamlit", "run", "app.py", "--server.port=8501", "--server.enableCORS=false"]
