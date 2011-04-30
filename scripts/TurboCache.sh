#!/bin/bash

#TODO: 
# * check free space (near OOM warning too!)
# * create ramdisk
# * copy path to ramdisk
# * bind to origin
# * echo some msg ;)
# * check if number of args == 1 else warn;exit
# * check if arg is a path/catalog


# should be sth insted of hard loop1 (loop2)
mount -t tmpfs /dev/loop1 /mnt/ramdisk

mount -o bind /ramdisk /$path

