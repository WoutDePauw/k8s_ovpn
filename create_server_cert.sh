openssl genrsa -out /root/server.key 2048
chmod 600 /root/server.key
{
  openssl req -new -key /root/server.key -out /root/server.csr -subj /CN=vpn.team05.labci.eu/
} || echo 'could not create request'
{
  openssl x509 -req -in /root/server.csr -out /root/server.cert -CA /server/cert/ca.crt -CAkey /server/key/ca.key -CAserial /server/srl/ca.srl -days 365
} || echo 'could not sign cert'

