FROM python:3.6-slim-stretch
MAINTAINER Ridley Nelson <rnelson009@stpaul.k12.mn.us>
COPY ./main /app
COPY ./main/Pipfile .

WORKDIR ./app
RUN pip3 install -r requirements.txt

RUN pip install -U pip
RUN pip install pipenv
RUN pipenv lock -r 
RUN pipenv install --system
EXPOSE 8080
CMD ["python3", "startup.py"]
