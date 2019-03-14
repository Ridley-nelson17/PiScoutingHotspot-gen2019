FROM python:3.6-slim-stretch
RUN pip install -U pip
RUN pip install pipenv
COPY ./ezw/Pipfile .
COPY ./ezw/Pipfile.lock .
RUN pipenv install --system
EXPOSE 8080
COPY ./main /app
WORKDIR /app
CMD ["python3", "HTTPSServer.py"]
