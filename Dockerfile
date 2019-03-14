FROM python:3.6-slim-stretch
RUN pip install -U pip
RUN pip install pipenv
COPY ./config/Pipfile .
COPY ./config/Pipfile.lock .
RUN pipenv install --system
EXPOSE 8080
COPY ./
WORKDIR /
CMD ["python3", "startup.py"]
