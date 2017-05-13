FROM jdeathe/centos-ssh:centos-7

WORKDIR /root/
ADD install-shadowsocks.sh /root/install-shadowsocks.sh
RUN sh install-shadowsocks.sh


RUN mkdir /root/kcptun

ADD /kcptun/ /root/kcptun/
RUN yum -y install python36u python36u-pip
RUN pip3.6 install requests Flask

EXPOSE 8989
EXPOSE 6688/udp
EXPOSE 5000

ENV SS_PASSWORD kexueshangwang

ADD ss.conf /etc/supervisord.d/ss.conf
ADD kcp.conf /etc/supervisord.d/kcp.conf
ADD flask.conf /etc/supervisord.d/flask.conf

ADD code /root/code
