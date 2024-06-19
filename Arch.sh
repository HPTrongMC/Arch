dd if=/dev/zero of=/dev/sdb status=progress && sync


sgdisk -o -n 1:0:+10M -t 1:EF02 -n 2:0:+500M -t 2:EF00 -n 3:0:+14436M -t 3:8300 -n 4:0:0 -t 4:0C00 /dev/sdb


mkfs.fat -F32 /dev/sdb2

mkfs.ext4 /dev/sdb3


mkdir -p /mnt/usb

mount /dev/sdb3 /mnt/usb

mkdir /mnt/usb/boot

mount /dev/sdb2 /mnt/usb/boot


pacstrap /mnt/usb linux linux-firmware base vim


genfstab -U /mnt/usb > /mnt/usb/etc/fstab


arch-chroot /mnt/usb
