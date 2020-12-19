FROM python:3.7.9-alpine3.12


RUN apk add --update libxslt-dev libxml2-dev
RUN apk add --virtual .build-deps \
	build-base \
	py-lxml

RUN python3 -m pip install --upgrade pip
RUN python3 -m pip install setuptools wheel
RUN python3 -m pip install poca
RUN apk del .build-deps

