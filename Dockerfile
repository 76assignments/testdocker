# Use an official Python runtime as a parent image
FROM python:3

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy the local Flask wheel file to the container
COPY flask-3.0.3-py3-none-any.whl ./

# Copy the current directory contents into the container at /usr/src/app
COPY . .

# Install the Flask package from the local wheel file
RUN pip install flask-3.0.3-py3-none-any.whl

# Make port 5000 available to the world outside this container
EXPOSE 5000

# Define environment variable
ENV FLASK_APP=app.py

# Run app.py when the container launches
CMD ["flask", "run", "--host=0.0.0.0"]
