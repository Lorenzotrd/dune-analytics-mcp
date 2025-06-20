FROM python:3.12-alpine

WORKDIR /app

# Install build dependencies
RUN apk add --no-cache gcc musl-dev libffi-dev openssl-dev python3-dev

# Upgrade pip
RUN pip install --upgrade pip

# Install Python dependencies
RUN pip install "mcp[cli]>=1.4.1" "pandas>=2.2.3" "httpx" "python-dotenv"

# Copy project files
COPY . .

ENV DUNE_API_KEY=""
ENV PORT=10000

EXPOSE 10000

CMD ["python", "main.py"]
