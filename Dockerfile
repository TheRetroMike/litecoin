FROM ubuntu:20.04
RUN apt-get update -y
RUN apt-get install wget build-essential -y
WORKDIR /opt/
RUN wget https://github.com/litecoin-project/litecoin/releases/download/v0.21.4/litecoin-0.21.4-x86_64-linux-gnu.tar.gz
RUN tar zxvf litecoin-0.21.4-x86_64-linux-gnu.tar.gz
RUN mv litecoin-0.21.4/bin/* /usr/bin/
RUN wget https://raw.githubusercontent.com/TheRetroMike/rmt-nomp/master/scripts/blocknotify.c
RUN gcc blocknotify.c -o /usr/bin/blocknotify
CMD /usr/bin/litecoind -printtoconsole
