FROM python:3.8

# Disable python stdout buffering
ENV PYTHONUNBUFFERED 1

# Default LOG_LEVEL
ENV LOG_LEVEL debug

# Install postgres client
RUN apt-get update && apt-get install -y
    
# Make /app the working directory
WORKDIR /app

# Copy dependency manifest
COPY ./requirements.txt .

# Install dependencies
RUN pip install -r requirements.txt

# Copy files
COPY . /app

# Set default command
CMD python manage.py runserver 0.0.0.0:80
