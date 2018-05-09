FROM centos:7

RUN yum update -y && \
    yum install -y epel-release && \
    yum update -y && \
    yum install -y openvpn openssl

ADD ovpn_run.sh /root/ovpn_run.sh
ADD server.conf /root/server.conf

RUN ./root/create_server_cert.sh; exit 0

EXPOSE 1194

CMD ./root/ovpn_run.sh
