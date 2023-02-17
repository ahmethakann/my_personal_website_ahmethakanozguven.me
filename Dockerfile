FROM python:3.11.2-alpine3.17

ENV PATH="/scripts:${PATH}"

COPY ./requirements.txt /requirements.txt

RUN apk add --update --no-cache --virtual .tmp gcc libc-dev linux-headers 
RUN pip install -r /requirements.txt
RUN apk del .tmp

RUN mkdir /ozguven_website
COPY ./ozguven_website /ozguven_website
WORKDIR /ozguven_website
COPY ./scripts /scripts

RUN chmod +x /scripts/*

RUN mkdir -p /vol/web/mediafiles
RUN mkdir -p /vol/web/static

RUN adduser -D user
RUN chown -R user:user /vol
RUN chmod -R 755 /vol/web
USER user

CMD ["entrypoint.sh"]