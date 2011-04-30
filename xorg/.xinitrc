#!/bin/bash

#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

rc-xfce4 () {
startxfce4 > /dev/null
return 0
}

DEFAULT_SESSION=startxfce4
#DEFAULT_SESSION=dbus-launch --exit-with-session ck-launch-session startxfce4


case $1 in
xfce4)
#  exec dbus-launch --exit-with-session ck-launch-session startxfce4
  exec startxfce4
	;;
fluxbox)
	exec startfluxbox
;;
xterm)
	exec xterm
;;
*)
  exec $DEFAULT_SESSION
;;
esac
#return 0

