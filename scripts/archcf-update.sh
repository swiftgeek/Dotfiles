#!/bin/bash

# TODO:
# * Check return != 0 behavior
# * sth better than 3x sync
# * emergency lazy unmount in case of disconnect!


echo "ArchCF updater v0.0.1"

cd ~
WD=`pwd`

sshfs sleekbook:// ~/sshfs
sudo mount -o bind $WD/sshfs/var/cache/pacman/pkg32 /var/cache/pacman/pkg
pacman -Syu --noconfirm
sync
sync
sync
fusermount -u ~/sshfs
