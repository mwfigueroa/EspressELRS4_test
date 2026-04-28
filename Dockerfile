FROM python:3.11-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    curl \
    gcc \
    g++ \
    make \
    libffi-dev \
    libssl-dev \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir platformio==6.1.16

WORKDIR /project

COPY . .

# Pre-install platforms and libs so builds don't need internet access
RUN pio pkg install --no-save

CMD ["pio", "run"]
