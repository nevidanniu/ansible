# docker build -t artifactory.nsd.ru:18079/ansible:latest .
FROM alpine:3.8

ARG proxy=""

ENV http_proxy $proxy
ENV https_proxy $proxy
ENV HTTP_PROXY=$proxy
ENV HTTPS_PROXY=$proxy

COPY ./certs/ /usr/local/share/ca-certificates/.

RUN apk update && apk upgrade && apk add --update --no-cache \
    ansible \
    sshpass \
    ca-certificates \
    && update-ca-certificates

