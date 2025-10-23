# Use lightweight Python image
FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Copy source code
COPY . .

# Install Python deps
RUN pip install --no-cache-dir -r requirements.txt

# Expose default port (can be overridden)
EXPOSE 8000

# Use shell so env vars can expand dynamically
CMD ["sh", "-c", "uvicorn app.main:app --host 0.0.0.0 --port 8000"]
