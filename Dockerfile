from ubuntu:eoan

WORKDIR /app
RUN apt update && apt install -y wget unzip git qemu-system-arm && rm -rf /var/lib/apt/lists/*
RUN git clone https://github.com/dhruvvyas90/qemu-rpi-kernel
RUN wget http://downloads.raspberrypi.org/raspbian_lite/images/raspbian_lite-2020-02-14/2020-02-13-raspbian-buster-lite.zip \
    && unzip *.zip \
    && rm -rf *.zip \
    && mv *.img raspbian.img
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]