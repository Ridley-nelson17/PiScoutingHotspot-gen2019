# Define some quick variables
ARG ORGANIZATION=Ridley-nelson17
ARG IMAGE_NAME=PiScoutingHotspot-gen2019
ARG IMAGE_VERSION=master

FROM $ORGANIZATION/$IMAGE_NAME:$IMAGE_VERSION
# FROM python:3.6-slim-stretch

MAINTAINER Ridley Nelson <rnelson009@stpaul.k12.mn.us>

ADD ./main ./app
COPY ./main/Pipfile .

# Main dependencies
RUN apt-get update && apt-get install -y \
  python-pip
  
RUN pip install -r requirements.txt

# Set work directory to 'main'
WORKDIR ./main

# Upgrading pip, not in use because of apt-get apt-update
# pip install -U pip

# Make Pipfile.lock
RUN pip install pipenv
RUN pipenv lock -r 
RUN pipenv install --system

EXPOSE 8080

CMD ["python3", "./startup.py"]
