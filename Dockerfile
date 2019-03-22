#tests

ARG ORGANIZATION = Ridley-nelson17
ARG IMAGE_NAME = PiScoutingHotspot-gen2019_1
FROM $ORGANIZATION/rpi-debian-swig:$IMAGE_NAME

#end tests

#FROM python:3.6-slim-stretch
MAINTAINER Ridley Nelson <rnelson009@stpaul.k12.mn.us>
ADD ./main ./app
COPY ./main/Pipfile .

WORKDIR ./app
RUN pip3 install -r requirements.txt

RUN pip install -U pip
RUN pip install pipenv
RUN pipenv lock -r 
RUN pipenv install --system
EXPOSE 8080
CMD ["python3", "./startup.py"]
