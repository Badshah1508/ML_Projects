FROM python:3.10-slim

WORKDIR /app

RUN apt-get update && apt-get install -y \
    curl \
    unzip \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir awscli

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# IMPORTANT: this must copy templates/
COPY . .

CMD ["python", "app.py"]