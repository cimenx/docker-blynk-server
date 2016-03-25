FROM java:latest

MAINTAINER geert.van.bastelaere@gmail.com

RUN mkdir -p /Blynk/certs

WORKDIR /Blynk

ADD certs.sh certs.sh

RUN chmod 755 certs.sh

VOLUME ["/Blynk/certs"]

CMD ./certs.sh