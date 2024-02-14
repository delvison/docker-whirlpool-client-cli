FROM maven:3.9.3-amazoncorretto-8 AS builder

ARG VERSION

WORKDIR /tmp
ADD https://code.samourai.io/whirlpool/whirlpool-client-cli/-/archive/$VERSION/whirlpool-client-cli-$VERSION.tar.gz whirlpool-cli.tar.gz

RUN tar xvf whirlpool-cli.tar.gz \
  && cd whirlpool-client-cli-$VERSION \
  && mvn clean install -Dmaven.test.skip=true

# #############################################################################
FROM openjdk:22-slim-bullseye

ARG VERSION

WORKDIR /app
COPY --from=builder /tmp/whirlpool-client-cli-$VERSION/target /app/target
COPY start.sh /usr/bin/start

RUN apt-get update && apt-get install tor -y \
  && chmod +x /usr/bin/start \
 && useradd whirlpool \
 && chown -R whirlpool: /app \
 && ln -s /app/target/whirlpool-client-cli-$VERSION-run.jar /app/target/whirlpool-client-cli-run.jar

WORKDIR /app/data
USER whirlpool

CMD /usr/bin/start
