FROM kalilinux/kali-rolling

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt upgrade -y && \
    apt install -y \
    ttyd \
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
    python3-pip && \
    apt clean

RUN useradd -m -s /bin/bash kali && \
    echo 'kali:kali' | chpasswd && \
    usermod -aG sudo kali

WORKDIR /home/kali

COPY start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE 7681

CMD ["/start.sh"]
