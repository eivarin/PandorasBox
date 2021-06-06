eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK
export XDG_SESSION_TYPE=x11
export GDK_BACKEND=x11
#exec gnome-session
#exec xbindkeys
exec i3
