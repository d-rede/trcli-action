FROM python:3.10.12-alpine
RUN apk add gcc musl-dev
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
