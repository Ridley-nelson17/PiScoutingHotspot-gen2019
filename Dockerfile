FROM python:3.6-slim-stretch
RUN pip install -U pip
RUN pip install pipenv
COPY ./main/Pipfile .
RUN pipenv install --system
EXPOSE 8080
COPY ../main 
WORKDIR /
CMD ["python3", "startup.py"]
