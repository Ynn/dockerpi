FROM alpine:3.11

EXPOSE 8088

WORKDIR /app
RUN apk update && apk add qemu-system-arm qemu-img  && rm -rf /var/cache/apk/*
RUN apk add git && git clone https://github.com/dhruvvyas90/qemu-rpi-kernel && rm -fr qemu-rpi-kernel/.git && apk del git  && rm -rf /var/cache/apk/*
RUN wget http://downloads.raspberrypi.org/raspbian_lite/images/raspbian_lite-2020-02-14/2020-02-13-raspbian-buster-lite.zip \
    && unzip *.zip \
    && rm -rf *.zip \
    && mv *.img raspbian.img \ 
    && qemu-img convert -f raw -O qcow2 raspbian.img raspbian.qcow \
    && qemu-img resize raspbian.qcow +6G \
    && rm raspbian.img

# This is based on (https://hub.docker.com/r/uphy/novnc-alpine/dockerfile)
RUN \
    # Install required packages
    apk --update --upgrade add \
    bash \
    fluxbox \
    git \
    supervisor \
    xvfb \
    x11vnc \
    && rm -rf /var/cache/apk/* \
    && \
    # Install noVNC
    git clone --depth 1 https://github.com/novnc/noVNC.git /root/noVNC && \
    git clone --depth 1 https://github.com/novnc/websockify /root/noVNC/utils/websockify && \
    rm -rf /root/noVNC/.git && \
    rm -rf /root/noVNC/utils/websockify/.git && \
    apk del git && \
    sed -i -- "s/ps -p/ps -o pid | grep/g" /root/noVNC/utils/launch.sh

RUN ln -s /usr/bin/python3 /usr/bin/python

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]