FROM ubuntu

RUN apt-get update && apt-get install -y nfs-kernel-server
RUN mkdir -p /exports

VOLUME /exports

EXPOSE 111/udp 2049/tcp  32764/tcp 32764/udp 32765/tcp 32765/udp 32766/tcp 32766/udp 32767/tcp 32767/udp 32768/tcp 32768/udp 32769/tcp 32769/udp

ADD src/run.sh /usr/local/bin/run.sh
ENTRYPOINT ["/usr/local/bin/run.sh"]
