FROM python:2.7

# Creating Application Source Code Directory
RUN mkdir -p /usr/src/app01

# Setting Home Directory for containers
WORKDIR /usr/src/app01

# Installing python dependencies
COPY requirements.txt /usr/src/app01/
RUN pip install --no-cache-dir -r requirements.txt

# Copying src code to Container
COPY . /usr/src/app01

# Application Environment variables
#ENV APP_ENV development
ENV PORT 8091

# Exposing Ports
EXPOSE $PORT

# Running Python Application
CMD gunicorn -b :$PORT -c gunicorn.conf.py main:app
