#based on this release https://github.com/lensesio/stream-reactor/releases/tag/1.2.3
#and inspired by this Dockerfile: https://github.com/lensesio/stream-reactor-dockers/blob/master/stream-reactor/Dockerfile
FROM streamreactor/stream-reactor-base:1.2.3

ENV BASE_VERSION=1.2.3



ENV STREAM_REACTOR_VERSION=${BASE_VERSION}
ENV KAFKA_VERSION=2.1.0



ENV ARCHIVE=kafka-connect-${STREAM_REACTOR_COMPONENT}-${STREAM_REACTOR_VERSION}-${KAFKA_VERSION}-all.tar.gz
ENV URL=https://github.com/landoop/stream-reactor/releases/download

RUN wget ${URL}/${STREAM_REACTOR_VERSION}/kafka-connect-cassandra-${STREAM_REACTOR_VERSION}-${KAFKA_VERSION}-all.tar.gz && tar -xf kafka-connect-cassandra-${STREAM_REACTOR_VERSION}-${KAFKA_VERSION}-all.tar.gz -C /opt/lenses/lib
RUN wget ${URL}/${STREAM_REACTOR_VERSION}/kafka-connect-jms-${STREAM_REACTOR_VERSION}-${KAFKA_VERSION}-all.tar.gz && tar -xf kafka-connect-jms-${STREAM_REACTOR_VERSION}-${KAFKA_VERSION}-all.tar.gz -C /opt/lenses/lib

CMD ["dumb-init", "/opt/lenses/bin/entry-point"]
