# Use an official Python runtime as a parent image
FROM python:3.9

# Set the working directory inside the container
WORKDIR /app

# Copy only requirements.txt first (for better caching)
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application files
COPY app/ .

# Expose the application's port
EXPOSE 5000

# Command to run the application
CMD ["python", "app.py"]
