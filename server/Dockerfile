FROM java:latest

MAINTAINER geert.van.bastelaere@gmail.com

RUN \
  mkdir -p /Blynk/data && \
  mkdir -p /Blynk/logs && \
  mkdir -p /Blynk/certs

WORKDIR /Blynk

ADD https://github.com/blynkkk/blynk-server/releases/download/v0.14.0/server-0.14.0.jar /Blynk/server.jar

ADD server.properties /Blynk/server.properties

VOLUME ["/Blynk/certs","/Blynk/data","/Blynk/logs"]

EXPOSE 8443 8442 7443 7444 8080 8082 8081 9443

CMD java -jar server.jar