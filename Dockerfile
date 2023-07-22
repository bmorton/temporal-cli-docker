FROM ubuntu:23.04
ARG version=0.10.3

RUN apt-get update && apt-get install -y curl

WORKDIR /usr/local/bin
RUN ARCH=`dpkg --print-architecture` && \
      curl -L https://github.com/temporalio/cli/releases/download/v{$version}/temporal_cli_{$version}_linux_{$ARCH}.tar.gz | tar -xz && \
      chmod +x /usr/local/bin/temporal

EXPOSE 7233
EXPOSE 8233

ENTRYPOINT ["/usr/local/bin/temporal", "server", "start-dev", "--ip" , "0.0.0.0"]
