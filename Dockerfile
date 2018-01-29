#FROM gcr.io/google_containers/spark-base:latest
#FROM java:openjdk-8-jdk
FROM alex202/spark

ENV ZEPPELIN_VER 0.7.3
ENV ZEPPELIN_HOME /opt/zeppelin

RUN mkdir -p /opt && \
    cd /opt && \
    curl http://www.eu.apache.org/dist/zeppelin/zeppelin-${ZEPPELIN_VER}/zeppelin-${ZEPPELIN_VER}-bin-all.tgz | \
        tar -zx && \
    ln -s zeppelin-${ZEPPELIN_VER}-bin-all zeppelin

ENV DATANODE ''
ENV WORKER ''

COPY log4j.properties ${ZEPPELIN_HOME}/conf/log4j.properties
COPY zeppelin-env.sh ${ZEPPELIN_HOME}/conf/zeppelin-env.sh
COPY start-zeppelin.sh /usr/local/bin/start-zeppelin.sh
EXPOSE 8080
ENTRYPOINT ["/usr/local/bin/start-zeppelin.sh"]
