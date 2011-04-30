#!/bin/bash
eval `keychain --eval --nogui -Q -q /root/.ssh/id_dsa`
ssh -f -N -L 24800:sleekbook:24800 sleekbook
