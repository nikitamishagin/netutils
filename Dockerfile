# Using the official Ubuntu 24.04 image as a base
FROM ubuntu:noble

# Installing netutils packages and clean apt cache
RUN apt update && \
    apt install -y \
    curl \
    dnsutils \
    iproute2 \
    iputils-ping \
    nmap \
    telnet \
    traceroute \
    wget \
    && apt clean && rm -rf /var/lib/apt/lists/*
