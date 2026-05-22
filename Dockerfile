FROM tsl0922/ttyd:latest

RUN apk add --no-cache \
    bash \
    curl \
    wget \
    git \
    nano \
    vim

CMD ["ttyd", "--writable", "--port", "8080", "bash"]
