# Use an official Python runtime as a parent image
FROM python:3.8-slim

RUN apt-get update && apt-get install -y python3-opencv
RUN apt-get install libsm6 libxext6 libxrender-dev -y

# Set the working directory to /app
WORKDIR /app

# To cache python package
COPY requirements.txt .

# Install any needed packages specified in requirements.txt
RUN pip install --default-timeout=100 -r requirements.txt

COPY . .

# GUI debug
ENV QT_DEBUG_PLUGINS=1

# Run application when the container launches
ENTRYPOINT ["python", "cam.py"]