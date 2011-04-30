#!/bin/bash
NewArch=""
ArchBoot=""
ArchRoot=""
ArchFoo=""
printf "ArchReproduce 0.0\n\n"
printf "Write the mountpoint: "
read NewArch
printf "Write the boot device: "
read ArchBoot
printf "Write the root device: "
read ArchRoot

#Summ.
printf "Mountpoint: $NewArch \n \
	Root device: $ArchRoot \n \
	Boot device: $ArchBoot \n \
	Sure? (Enter to proceed, C-c to escape)"
	read ArchFoo

mount -o noatime $ArchRoot $NewArch
mkdir -p $NewArch/boot $NewArch/var/lib/pacman $NewArch/var/cache/pacman/pkg
mount -o noatime $ArchBoot $NewArch/boot
mount -o bind /var/cache/pacman/pkg $NewArch/var/cache/pacman/pkg
pacman -Sy -r $NewArch
pacman -S base -r $NewArch

cp /etc/resolv.conf $NewArch/etc/resolv.conf
cp /etc/pacman.d/mirrorlist $NewArch/etc/pacman.d/mirrorlist

# Preparing dev nodes
cd $NewArch/dev 
rm console ; mknod -m 600 console c 5 1 
rm null ; mknod -m 666 null c 1 3 
rm zero ; mknod -m 666 zero c 1 5

# Mounting needfulls fs 
mount -t proc proc /$NewArch/proc
mount -t sysfs sys /$NewArch/sys
mount -o bind /dev /$NewArch/dev

# DIVE!
chroot $NewArch /bin/bash

cd
