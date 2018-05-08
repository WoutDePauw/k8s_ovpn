openssl genrsa -out server.key 2048
chmod 600 server.key
cat /server/ca.srl
openssl req -new -key server.key -out server.csr -subj /CN=vpn.team05.labci.eu/
openssl x509 -req -in server.csr -out server.crt -CA /server/ca.crt -CAkey /server/ca.key -CAserial /server/ca.srl -days 365
