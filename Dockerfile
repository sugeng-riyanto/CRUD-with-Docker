FROM python:3.9-slim

WORKDIR /app

COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# Membuat folder upload jika belum ada di dalam container
RUN mkdir -p static/uploads

CMD ["python", "app.py"]
