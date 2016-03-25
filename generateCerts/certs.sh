#!/usr/bin/env bash

openssl genrsa -out certs/server.key 4096
openssl req -new -out certs/server.csr -subj "/C=US/ST=Denial/L=Springfield/O=Dis/CN=www.example.com" -key certs/server.key
openssl x509 -req -days 1825 -in certs/server.csr -signkey certs/server.key -out certs/server.crt
openssl pkcs8 -topk8 -inform PEM -outform PEM -in certs/server.key -out certs/server.pem -passout pass:secret
