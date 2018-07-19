## kafka-docker-dev

### Usage

```sh

docker run \ 
  -e KAFKA_LOGS=/kafka-logs \
  -e KAFKA_ADVERTISED_LISTENERS=PLAINTEXT://localhost:9092 \
  -p 9092:9092 \
  -v <YOUR_VOLUME>:/kafka-logs \
  darrenmce/kafka-dev
```
