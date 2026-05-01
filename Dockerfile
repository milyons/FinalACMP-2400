# 1. Use an official Python runtime as a parent image
FROM python:3.10-slim

# 2. Set environment variables to ensure python output is sent to terminal
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# 3. Set the working directory in the container
WORKDIR /app

# 4. Install dependencies
# We copy this first to leverage Docker's cache
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

# 5. Copy the rest of your application code
COPY . /app/

# 6. Expose the port Django runs on
EXPOSE 8000

# 7. Start the application
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
