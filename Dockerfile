FROM java:latest

MAINTAINER geert.van.bastelaere@gmail.com

RUN \
  mkdir -p /Blynk/data && \
  mkdir -p /Blynk/logs && \
  mkdir -p /Blynk/certs && \
  mkdir -p /Blynk/config

WORKDIR /Blynk

#ADD generateSSL.sh /Blynk/generateSSL.sh
#RUN chmod 755 /Blynk/generateSSL.sh
#RUN /Blynk/generateSSL.sh

RUN openssl genrsa -out /Blynk/certs/server.key 4096
RUN openssl req -new -out /Blynk/certs/server.csr -subj "/C=US/ST=Denial/L=Springfield/O=Dis/CN=www.example.com" -key /Blynk/certs/server.key
RUN openssl x509 -req -days 1825 -in /Blynk/certs/server.csr -signkey /Blynk/certs/server.key -out /Blynk/certs/server.crt
RUN openssl pkcs8 -topk8 -inform PEM -outform PEM -in /Blynk/certs/server.key -out /Blynk/certs/server.pem -passout pass:secret

ADD https://github.com/blynkkk/blynk-server/releases/download/v0.14.0/server-0.14.0.jar /Blynk/server.jar
ADD server.properties /Blynk/config/server.properties

RUN ln -s /Blynk/config/server.properties /Blynk/server.properties

VOLUME ["/Blynk/data","/Blynk/logs"]

EXPOSE 8443 8442 7443 7444 8080 8082 8081 9443

CMD java -jar server.jar