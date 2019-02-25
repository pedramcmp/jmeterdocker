FROM openjdk:9

RUN apt-get update && \
    apt-get upgrade -y

RUN apt-get install -y wget --no-install-recommends

RUN mkdir -p /opt/jmeter
WORKDIR /opt/jmeter

RUN wget http://apache.uvigo.es//jmeter/binaries/apache-jmeter-5.1.tgz && \
    tar xvf apache-jmeter-5.1.tgz 

COPY run.sh /run.sh
RUN chmod +x /run.sh

ENV PATH $PATH:/opt/jmeter/apache-jmeter-5.1/bin

ENV JPROT http
ENV JIP localhost
ENV JPORT 80

CMD [ "/run.sh" ]
