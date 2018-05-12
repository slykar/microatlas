FROM python:3.6.5-alpine3.7

ARG APP_DIR=/usr/src/app

RUN mkdir -p ${APP_DIR}
WORKDIR ${APP_DIR}

ADD requirements.txt ${APP_DIR}/
RUN pip install --no-cache-dir -r requirements.txt

ADD . ${APP_DIR}

# TODO: add default EXPOSE, ENTRYPOINT and CMD
