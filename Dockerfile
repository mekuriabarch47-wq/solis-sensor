FROM python:3.11-slim

WORKDIR /app

# Install system dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    git \
    && rm -rf /var/lib/apt/lists/*

# Copy application code
COPY . .

# Install Python dependencies needed to exercise the integration and tests
RUN pip install --no-cache-dir \
    aiofiles \
    aiohttp \
    requests \
    homeassistant \
    pytest

CMD ["python", "-m", "pytest", "-v"]
