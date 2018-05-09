FROM centos:7

RUN yum update -y && \
    yum install -y epel-release && \
    yum update -y && \
    yum install -y openvpn openssl

ADD create_server_cert.sh /root/create_server_cert.sh
ADD ovpn_run.sh /root/ovpn_run.sh
ADD server.conf /root/server.conf
EXPOSE 1194
