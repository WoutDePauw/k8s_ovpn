mkdir -p /dev/net
if [ ! -c /dev/net/tun ]; then
    mknod /dev/net/tun c 10 200
fi
iptables -I INPUT -p udp --dport 1194 -j ACCEPT
exec openvpn --config /root/server.conf
