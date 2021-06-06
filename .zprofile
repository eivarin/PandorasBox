export TERM=xterm
if [[ -z $DISPLAY && $(tty) == /dev/tty1 ]]; then
     XDG_SESSION_TYPE=x11 GDK_BACKEND=x11 exec startx
fi

#if [ "$(tty)" = "/dev/tty1" ]; then
#    rm -rf /tmp/startx.log
#    startx &> /tmp/startx.log
#    clear
#fi

