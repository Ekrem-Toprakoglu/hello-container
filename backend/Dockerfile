# Identisch zum Frontend-Dockerfile, nur Port 6000 statt 5000.
FROM python:3.12-slim
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY . .
EXPOSE 6000
CMD ["python", "app.py"]
