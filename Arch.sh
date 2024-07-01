#!/bin/bash

# Tạo bảng phân vùng GPT và tạo các phân vùng mới
sgdisk -o -n 1:0:+10M -t 1:EF02 -n 2:0:+500M -t 2:EF00 -n 3:0:+14436M -t 3:8300 -n 4:0:0 -t 4:0C00 /dev/sdb

# Định dạng phân vùng sdb2 thành FAT32
mkfs.fat -F32 /dev/sdb2

# Định dạng phân vùng sdb3 thành ext4
mkfs.ext4 /dev/sdb3

# Tạo thư mục gắn kết và gắn kết các phân vùng
mkdir -p /mnt/usb
mount /dev/sdb3 /mnt/usb

mkdir /mnt/usb/boot
mount /dev/sdb2 /mnt/usb/boot

# Cài đặt hệ thống cơ bản
pacstrap /mnt/usb linux linux-firmware base vim

# Tạo file fstab
genfstab -U /mnt/usb > /mnt/usb/etc/fstab

# Chuyển vào hệ thống mới
arch-chroot /mnt/usb
