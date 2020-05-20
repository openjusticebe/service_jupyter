FROM python:3.7-slim-buster

ARG PW="oj_jupyter"
ENV PW=$PW

RUN pip install --upgrade pip && pip install pipenv
RUN apt-get update &&  apt-get install -yq \
    git \
    gcc \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

COPY ./* /jupyter/
WORKDIR /jupyter
RUN pipenv install --system --deploy
RUN ls

ENTRYPOINT [ "/jupyter/start.sh", "$PW"]
