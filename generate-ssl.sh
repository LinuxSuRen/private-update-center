#!/bin/sh

openssl genrsa -out rootCA/suren.key 1024
openssl req -new -x509 -days 1095 -key rootCA/suren.key \
    -out rootCA/suren.crt \
    -subj "/C=CN/ST=GD/L=SZ/O=vihoo/OU=dev/CN=surenpi.com/emailAddress=suren@surenpi.com"