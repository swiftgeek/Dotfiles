#!/bin/bash

# TODO:
# rewrite to check existance of network daemon (NM/wicd)
wifidev="wlan0"
ifconfig $wifidev down
killall wpa_supplicant
killall dhcpcd
killall dhclient
/home/swiftgeek/Apps/bin/getpublic.sh wifidev
ifconfig $wifidev up
#iwconfig $wifidev essid toya12345957
sleep 1
#wpa_supplicant -B -Dwext -i $wifidev -c /etc/wpa_supplicant.conf
sleep 2 
#dhclient $wifidev

