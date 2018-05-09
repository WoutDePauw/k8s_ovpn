FROM centos:7

RUN yum update -y && \
    yum install -y epel-release && \
    yum update -y && \
    yum install -y openvpn openssl

ADD create_server_cert.sh create_server_cert.sh

ADD server.conf server.conf


RUN ./create_server_cert.sh; exit 0 && ovpn_run.sh; exit 0
EXPOSE 1194
