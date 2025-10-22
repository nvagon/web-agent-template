# Use lightweight Python image
FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Install git (required for submodules)
RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

# Copy source code
COPY . .

# Initialize and update submodules
RUN git submodule update --init

# Install Python deps
RUN pip install --no-cache-dir -r requirements.txt

# Expose default port (can be overridden)
EXPOSE 8000

# Use shell so env vars can expand dynamically
CMD ["sh", "-c", "uvicorn app.main:app --host 0.0.0.0 --port 8000"]
