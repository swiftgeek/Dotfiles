#!/bin/bash

wicd-cli --wireless -x
sleep 2
sudo macchanger -a wlan0
sleep 2
wicd-cli --wireless -c -n 0
