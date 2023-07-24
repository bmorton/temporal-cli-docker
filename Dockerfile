FROM ubuntu:23.04
ARG CLI_VERSION=0.10.3
ARG TCTL_VERSION=1.18.0

RUN apt-get update && apt-get install -y curl

WORKDIR /usr/local/bin
RUN ARCH=`dpkg --print-architecture` && \
      curl -L https://github.com/temporalio/cli/releases/download/v{$CLI_VERSION}/temporal_cli_{$CLI_VERSION}_linux_{$ARCH}.tar.gz | tar -xz && \
      chmod +x /usr/local/bin/temporal
RUN ARCH=`dpkg --print-architecture` && \
      curl -L https://github.com/temporalio/tctl/releases/download/v{$TCTL_VERSION}/tctl_{$TCTL_VERSION}_linux_{$ARCH}.tar.gz | tar -xz && \
      chmod +x /usr/local/bin/tctl

EXPOSE 7233
EXPOSE 8233

ENTRYPOINT ["/usr/local/bin/temporal", "server", "start-dev", "--ip" , "0.0.0.0"]
