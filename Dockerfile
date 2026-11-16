FROM python:3.9

RUN mkdir -p /src/faypublic
WORKDIR /src/faypublic

COPY requirements.txt ./
RUN pip install -r requirements.txt

COPY . .

# EXPOSE 8000
# CMD ./wait-for-it.sh $POSTGRES_HOST:$POSTGRES_PORT -t 60 -- gunicorn strikelab.wsgi -w 4 -b 0.0.0.0:8000

CMD gunicorn faypublic.wsgi:application --bind 0.0.0.0:$PORT