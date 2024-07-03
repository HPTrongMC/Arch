#!/bin/bash

# Tạo thư mục gắn kết và gắn kết các phân vùng
mkdir -p /mnt/usb
mount /dev/sdb3 /mnt/usb

mkdir /mnt/usb/boot
mount /dev/sdb2 /mnt/usb/boot

# Chuyển vào hệ thống mới
arch-chroot /mnt/usb
