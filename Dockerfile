FROM python:slim-buster
WORKDIR /app
COPY ./ozguven_website ./

RUN pip install --upgrade pip --no-cache-dir

RUN pip install -r /ozguven_website/requirements.txt --no-cache-dir

#CMD ["python3", "manage.py", "runserver", "0.0.0.0:8000"]
CMD ["gunicorn", "ozguven_website.wsgi:application", "--bind", "0.0.0.0:8000"]