FROM java:latest

#RUN \
#  apt-get update && \
#  apt-get install -y software-properties-common && \
#  rm -rf /var/lib/apt/lists/*
#
#RUN \
#  echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
#  echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections && \
#  apt-add-repository -y ppa:webupd8team/java && \
#  apt-get update && \
#  apt-get install -y oracle-java8-installer && \
#  rm -rf /var/lib/apt/lists/*

MAINTAINER geert.van.bastelaere@gmail.com

RUN \
  mkdir -p /Blynk/data && \
  mkdir -p /Blynk/logs

WORKDIR /Blynk

ADD https://github.com/blynkkk/blynk-server/releases/download/v0.14.0/server-0.14.0.jar /Blynk/server-0.14.0.jar
ADD server.properties /Blynk/server.properties

VOLUME ["/Blynk/data","/Blynk/logs"]

EXPOSE 8443 8442 7443 7444 8080 8082 8081 9443

CMD java -jar server-0.14.0.jar -dataFolder /Blynk/data