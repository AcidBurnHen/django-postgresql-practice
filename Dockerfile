# Pull base image
FROM python:3.10

# Set enviroment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
ENV PYTHONPATH=/hello/postgresql

# Set work directory
WORKDIR /postgresql

# Install dependencies 
RUN python -m pip install --upgrade pip
COPY Pipfile Pipfile.lock /postgresql/
RUN pip install django
RUN pip install pipenv && pipenv install --system

# Copy project
COPY . /postgresql/

