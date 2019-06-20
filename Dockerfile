
FROM python:3.6-alpine as base

RUN apk update && apk add bash

# add postgres depedencies
RUN apk add postgresql-dev gcc python3-dev musl-dev

FROM base as dev

WORKDIR /app

COPY . /app

RUN pip install -r requirements.txt

CMD [ "python", "manage.py", "runserver", "0.0.0.0:3000" ]