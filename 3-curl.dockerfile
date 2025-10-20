FROM alpine:latest

RUN apk add curl

RUN adduser -D user
USER user

ENTRYPOINT [ "curl" ]