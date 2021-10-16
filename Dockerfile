FROM ubuntu:latest

VOLUME ["/data"]

RUN apt-get update \
    && apt-get install -y wget usbutils \
    && rm -rf /var/lib/apt/lists/*
RUN mkdir -p /data

COPY entrypoint.sh /etc/entrypoint.sh

EXPOSE 7575

CMD ["bash", "/etc/entrypoint.sh"]
