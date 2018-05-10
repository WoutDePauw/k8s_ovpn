FROM alpine:3.7

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/community/" >> /etc/apk/repositories && \
    echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing/" >> /etc/apk/repositories && \
    apk add --update openvpn=2.4.4-r1 && \
    apk add --update openssl

ADD ovpn_run.sh /root/ovpn_run.sh
ADD server.conf /root/server.conf

RUN ./root/create_server_cert.sh; exit 0

EXPOSE 1194

CMD ./root/ovpn_run.sh
