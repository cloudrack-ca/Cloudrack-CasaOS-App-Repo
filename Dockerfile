FROM ubuntu:latest

# install packages
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    git \
    unzip \
    zip \
    nano \
    vim \
    sudo \
    iputils-ping \
    net-tools \
    dnsutils \
    iproute2 \
    iperf3 \
    traceroute \
    telnet \
    openssh-client \
    openssh-server \
    software-properties-common \
    apt-transport-https \
    ca-certificates \
    gnupg \
    lsb-release \
    && rm -rf /var/lib/apt/lists/*

# https://cloudpanel.io
RUN curl -sSL https://raw.githubusercontent.com/cloudpanel-io/cloudpanel-ce-installer/master/installer.sh | bash

# install cloudpanel-cli   
RUN curl -sSL https://raw.githubusercontent.com/cloudpanel-io/cloudpanel-cli/master/installer.sh | bash
