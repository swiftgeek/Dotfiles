#!/bin/bash

# TODO:
# rewrite to check existance of network daemon (NM/wicd)
# if not then stuff from toyanet.sh
# check if there is > 1 arguments and what about that?
# /sys/class/net/wlan0/device

cabledev="eth0"
vapdev="ath0"
wifidev="wlan0"
MAC="00:1e:6b:8f:6e:fd"

if [ "$@" = "$1" ]; then
	ip link set dev $1 down
	macchanger --mac=$MAC $1
	ip link set dev $1 up
else
	echo "U can pass only ONE argument!"
fi

if [ "$1" = "-u" ]; then
	MODULE=`readlink /sys/class/net/$2/device/driver -m -n`
	MODULE=${MODULE:21}
	ip link set dev $2 down
	rmmod $MODULE
	sleep 1
	modprobe $MODULE
	ip link set dev $2 up
fi
