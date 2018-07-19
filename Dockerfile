FROM openjdk:8

ENV KAFKA_HEAP_OPTS="-Xmx500M -Xms500M"

RUN \
	mkdir /kafka && \
	mkdir /tmp/kafka && \
	cd /tmp/kafka && \
	wget -O kafka.tgz http://apache.forsale.plus/kafka/1.1.0/kafka_2.12-1.1.0.tgz && \
	tar -xzf kafka.tgz -C /kafka --strip 1 && \
        cd /kafka && \
	rm -rf /tmp/kafka

ADD ./start.sh /kafka

WORKDIR /kafka

ENTRYPOINT ["/kafka/start.sh"]
