FROM python:alpine3.6

COPY ./app /app
WORKDIR /app

ENV PYTHONUNBUFFERED=0

RUN pip install -r requirements.txt

EXPOSE 5000

CMD ["gunicorn", "-b", "0.0.0.0:5000", "-w", "6", "--threads", "6",  "--log-level", "'debug'", "app:app"]
