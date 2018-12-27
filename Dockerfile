# docker build -t artifactory.nsd.ru:18079/ansible:2.5.5 .
FROM alpine:3.8

ARG proxy=""

ENV http_proxy $proxy
ENV https_proxy $proxy

COPY ./certs/ /usr/local/share/ca-certificates/.

COPY ./ansible.cfg /etc/ansible/ansible.cfg

RUN apk update && apk upgrade && apk add --update --no-cache \
    ansible \
    sshpass \
    ca-certificates \
    && update-ca-certificates
