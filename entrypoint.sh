#!/usr/bin/env bash
set -e 

qemu-system-arm -M versatilepb \
                -cpu arm1176 \
		        -kernel qemu-rpi-kernel/kernel-qemu-4.14.79-stretch \
                -append "root=/dev/sda2 panic=1 rootfstype=ext4 rw" \
                -hda raspbian.qcow \
                -m 256 \
                -dtb qemu-rpi-kernel/versatile-pb.dtb \
                -no-reboot \
                -net nic -net user,hostfwd=tcp::5022-:22