#!/bin/bash
select1='feh --bg-fill'
select2='xwallpaper --zoom'
select3='xloadimage -onroot -fullscreen'
select4='xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitor0/workspace0/last-image -s'
select5='gsettings set org.gnome.desktop.background picture-uri'
prog=$select5
[ "$#" -lt "1" ] || [ "$#" -gt "2" ] && {  echo -e "ERROR : args number invalid \n $0 speed /path/name.gif" ; echo "try 0.010 as speed" ; exit 1 ; }
dir=/tmp/back4  
#example of speed  : 0.010
speed=$1
name=$2


[[ "$name" == "" ]] && { name=$speed ; speed=${name##*-} ; }

hash=`md5sum $name | cut -f1 -d" "`

[[ ! -d $dir ]] && mkdir $dir 

[[ ! -d $dir/$hash ]] && { mkdir $dir/$hash ; echo "spliting .." ; convert -coalesce $name $dir/$hash/$hash.png ; echo ok ; }

compatiblePrograms=( nautilus kdeinit kded4 pulseaudio trackerd )

# Attempt to get a program pid
for index in ${compatiblePrograms[@]}; do
  PID=$(pidof -s ${index})
  if [[ "${PID}" != "" ]]; then
    break
  fi
done
if [[ "${PID}" == "" ]]; then
  echo "Could not detect active login session"
  return 1
fi

QUERY_ENVIRON="$(tr '\0' '\n' < /proc/${PID}/environ | grep "DBUS_SESSION_BUS_ADDRESS" | cut -d "=" -f 2-)"
if [[ "${QUERY_ENVIRON}" != "" ]]; then
  export DBUS_SESSION_BUS_ADDRESS="${QUERY_ENVIRON}"
  echo "Connected to session:"
  echo "DBUS_SESSION_BUS_ADDRESS=${DBUS_SESSION_BUS_ADDRESS}"
else
  echo "Could not find dbus session ID in user environment."
  return 1
fi
while : ; do for i in ` ls $dir/$hash -v ` ; do $prog $dir/$hash/$i ; sleep $speed ; done ; done    
