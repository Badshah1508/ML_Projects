FROM python:3.10-slim

WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    curl \
    unzip \
    && rm -rf /var/lib/apt/lists/*

# Install AWS CLI (official way)
RUN pip install --no-cache-dir awscli

# Copy only requirements first (Docker cache optimization)
COPY requirements.txt .

RUN pip install -r requirements.txt

# Copy application code
COPY . .

CMD ["python", "app.py"]