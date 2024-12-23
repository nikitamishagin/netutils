# Using the official Ubuntu 24.04 image as a base
FROM ubuntu:noble

# Installing netutils packages and clean apt cache
RUN apt update && \
    apt install -y \
    bash-completion \
    curl \
    dnsutils \
    iproute2 \
    iputils-ping \
    nmap \
    tcpdump \
    telnet \
    traceroute \
    wget \
    && apt clean && rm -rf /var/lib/apt/lists/*
