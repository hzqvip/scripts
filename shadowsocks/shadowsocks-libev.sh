#!/bin/bash
# vultr vps centos 7 fast installation shadowsocks-libev
CFG={\"server\":\"0.0.0.0\",\"server_port\":${1},\"local_port\":1080,\"password\":\"${2}\",\"timeout\":60,\"method\":\"chacha20\"}
echo ${CFG} > /test.txt
set -ex; \
    yum install -y \
        epel-release \
        gcc \
        gettext \
        autoconf \
        libtool \
        automake \
        make \
        pcre-devel \
        asciidoc \
        xmlto \
        c-ares-devel \
        libev-devel \
        libsodium-devel \
        mbedtls-devel \
        wget; \
    wget -O /etc/yum.repos.d/librehat-shadowsocks-epel-7.repo \
    https://copr.fedorainfracloud.org/coprs/librehat/shadowsocks/repo/epel-7/librehat-shadowsocks-epel-7.repo; \
    yum update -y; \
    yum install -y shadowsocks-libev; \
    # set config
    echo ${CFG} > /etc/shadowsocks-libev/config.json; \
    ln -s /usr/lib64/libmbedcrypto.so.1 /usr/lib64/libmbedcrypto.so.0

# firewall
set -ex; \
    firewall-cmd --add-port=${1}/tcp --permanent; \
    firewall-cmd --add-port=${1}/udp --permanent; \
    firewall-cmd --reload
# start shadowsocks-libev
set -ex; \
    systemctl start shadowsocks-libev; \
    systemctl status shadowsocks-libev; \
    echo ${CFG}





