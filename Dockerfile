FROM python:slim-buster
WORKDIR /app
COPY ./ozguven_website ./

RUN apt-get update && \
    apt-get install -y libpq-dev && \
    pip install --upgrade pip && \
    pip install -r requirements.txt --no-cache-dir

#CMD ["python3", "manage.py", "runserver", "0.0.0.0:8000"]
CMD ["gunicorn", "ozguven_website.wsgi:application", "--bind", "0.0.0.0:8000"]