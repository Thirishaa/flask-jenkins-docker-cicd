# Use an official Python runtime as base image
FROM python:3.9

# Set the working directory inside the container
WORKDIR /app

# Copy application files correctly
COPY app/ . 

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose port 5000
EXPOSE 5000

# Run the Flask app
CMD ["python", "app.py"]
