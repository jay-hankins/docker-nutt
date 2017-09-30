#!/bin/sh
LOCAL_NETWORK=192.168.1.1/24
GW=192.168.1.1
INT=eth0

# TRANSMISSION_CONTROL_OPTS="--script-security 2 --up-delay --up /etc/transmission/start.sh --down /etc/transmission/stop.sh"

# if [ -n "${LOCAL_NETWORK-}" ]; then
#   eval $(/sbin/ip r l m 0.0.0.0 | awk '{if($5!="tun0"){print "GW="$3"\nINT="$5; exit}}')
#   if [ -n "${GW-}" -a -n "${INT-}" ]; then
    
#   fi
# fi

echo "adding route to local network $LOCAL_NETWORK via $GW dev $INT"
/sbin/ip r a "$LOCAL_NETWORK" via "$GW" dev "$INT"
exec openvpn $TRANSMISSION_CONTROL_OPTS --config /etc/openvpn/airvpn/default.ovpn
