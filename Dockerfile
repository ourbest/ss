FROM jdeathe/centos-ssh:centos-7

WORKDIR /root/
ADD install-shadowsocks.sh /root/install-shadowsocks.sh
RUN sh install-shadowsocks.sh

ADD ss.conf /etc/supervisord.d/ss.conf

RUN mkdir /root/kcptun

ADD /kcptun/ /root/kcptun/

ADD kcp.conf /etc/supervisord.d/kcp.conf

EXPOSE 8989
EXPOSE 22
EXPOSE 6688/udp

EXPOSE 8000

# RUN yum -y install https://centos7.iuscommunity.org/ius-release.rpm
RUN yum -y install python36u python36u-pip
RUN pip3.6 install requests
RUN pip3.6 install Flask

EXPOSE 5000
ADD flask.conf /etc/supervisord.d/flask.conf

ADD code /root/code
