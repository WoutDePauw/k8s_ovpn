mkdir -p /dev/net
if [ ! -c /dev/net/tun ]; then
    mknod /dev/net/tun c 10 200
fi
iptables -I INPUT -p udp --dport 1194 -j ACCEPT
iptables -I FORWARD -i tun0 -o eth0 -s 10.8.0.0/24 -m conntrack --ctstate NEW -j ACCEPT
iptables -I FORWARD -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
iptables -t nat -I POSTROUTING -o eth0 -s 10.8.0.0/24 -j MASQUERADE
exec openvpn --config /root/server.conf
