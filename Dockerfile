FROM python:3.6-slim-stretch
MAINTAINER Ridley Nelson <rnelson009@stpaul.k12.mn.us>
RUN pip install -U pip
RUN pip install pipenv
COPY ./main/Pipfile .
RUN pipenv lock -r 
RUN pipenv install --system
EXPOSE 8080
COPY ./main /app
WORKDIR /app
CMD ["python3", "startup.py"]
