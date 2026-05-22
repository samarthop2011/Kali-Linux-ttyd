FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y \
    curl \
    wget \
    git \
    bash \
    sudo \
    build-essential \
    cmake \
    libjson-c-dev \
    libwebsockets-dev

RUN git clone https://github.com/tsl0922/ttyd.git /opt/ttyd && \
    cd /opt/ttyd && \
    mkdir build && \
    cd build && \
    cmake .. && \
    make && \
    make install

EXPOSE 8080

COPY start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]
