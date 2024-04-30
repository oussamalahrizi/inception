FROM debian:bullseye

RUN apt update -y && apt upgrade -y

ENV PORTAINER_VERSION=2.19.5 \
	PORTAINER_HOME=/var/lib/portainer


LABEL maintainer="olahrizi@student.1337.ma" \
      org.label-schema.build-date="30.04.2024" \
      org.label-schema.name="Inception portainer" \
      org.label-schema.description="Inception portainer image" \
      org.label-schema.version="$PORTAINER_VERSION"

RUN apt install curl ca-certificates tar -y


RUN curl -sSL https://github.com/portainer/portainer/releases/download/${PORTAINER_VERSION}/portainer-${PORTAINER_VERSION}-linux-amd64.tar.gz | \
tar -xzo -C /usr/local


RUN apt clean && rm -rf /var/lib/apt/lists/*


CMD ["/usr/local/portainer/portainer"]

