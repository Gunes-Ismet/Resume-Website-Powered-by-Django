# Pull official base image
FROM python:3.13.1-slim

# Install dependencies
RUN apt-get update && apt-get install -y \
    libpq-dev \
    python3-dev \
    build-essential \
    postgresql-client \
    --no-install-recommends && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV VIRTUAL_ENV=/opt/venv

# Install pip and virtualenv
RUN pip install --upgrade pip
RUN pip install virtualenv && python -m virtualenv $VIRTUAL_ENV

# Update PATH
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

# Copy requirements and install dependencies
COPY ./requirements.txt /srv/app/requirements.txt
RUN pip install --no-cache-dir -r /srv/app/requirements.txt

# Set working directory
WORKDIR /srv/app

# Copy the project files
COPY . .

# Expose the application port
EXPOSE 8000

