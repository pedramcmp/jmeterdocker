FROM openjdk:9

RUN apt-get update && \
    apt-get upgrade -y

RUN apt-get install -y wget --no-install-recommends

RUN mkdir -p /opt/jmeter
WORKDIR /opt/jmeter

RUN wget http://apache.uvigo.es//jmeter/binaries/apache-jmeter-5.0.tgz && \
    tar xvf apache-jmeter-5.0.tgz 

COPY run.sh /run.sh
RUN chmod +x /run.sh

ENV PATH $PATH:/opt/jmeter/apache-jmeter-5.0/bin

ENV JPROT https
ENV JIP staging.marketing.manycomponents.com
ENV JPORT 443

CMD [ "/run.sh" ]
