FROM debian:stable-slim

ENV COMPOSE_VERSION 1.25.5

RUN apt-get update -q \
	&& apt-get install -y -q --no-install-recommends curl ca-certificates \
	&& curl -o /usr/local/bin/docker-compose -L \
		"https://github.com/docker/compose/releases/download/${COMPOSE_VERSION}/docker-compose-Linux-x86_64" \
	&& chmod +x /usr/local/bin/docker-compose

WORKDIR /app

ENTRYPOINT ["/usr/local/bin/docker-compose"]
CMD ["up"]

VOLUME [ "/app" ]
