FROM python:3.12-slim

WORKDIR /app

# Системные зависимости (curl нужен для healthcheck)
RUN apt-get update && apt-get install -y --no-install-recommends curl \
  && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY app ./app

EXPOSE 8000

# Gunicorn для прод-стиля запуска
CMD ["gunicorn", "-b", "0.0.0.0:8000", "app.main:app"]
