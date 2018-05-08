openssl genrsa -out ~/server.key 2048
chmod 600 server.key
{
  openssl req -new -key ~/server.key -out ~/server.csr -subj /CN=vpn.team05.labci.eu/
} || echo 'could not create request'
{
  openssl x509 -req -in ~/server.csr -out ~/server.crt -CA /server/cert/ca.crt -CAkey /server/key/ca.key -CAserial /server/srl/ca.srl -days 365
} || echo 'could not sign cert'
