FROM python:3.10-slim

RUN apt-get update \
    && apt-get install -y ffmpeg nodejs npm \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY . /app/
WORKDIR /app/

RUN pip install --upgrade pip setuptools
RUN pip install --no-cache-dir -r requirements.txt

CMD ["python3", "-m", "Spy"]
