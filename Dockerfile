FROM kalilinux/kali-rolling

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt upgrade -y && \
    apt install -y \
    bash \
    curl \
    wget \
    git \
    nano \
    vim \
    net-tools \
    iproute2 \
    sudo \
    openssh-server \
    python3 \
    python3-pip \
    xz-utils && \
    apt clean

# Install ttyd manually
RUN wget https://github.com/tsl0922/ttyd/releases/download/1.7.7/ttyd.x86_64 \
    -O /usr/local/bin/ttyd && \
    chmod +x /usr/local/bin/ttyd

RUN useradd -m -s /bin/bash kali && \
    echo 'kali:kali' | chpasswd && \
    usermod -aG sudo kali

WORKDIR /home/kali

COPY start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE 7681

CMD ["/start.sh"]
