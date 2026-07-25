# Using the official Alpine image as a base
FROM alpine:3.24

# Installing bash and netutils packages
RUN apk add --no-cache \
    bash \
    bash-completion \
    bind-tools \
    busybox-extras \
    curl \
    iproute2 \
    iputils \
    jq \
    nmap \
    openssl \
    tcpdump \
    traceroute \
    wget \
    yq

# Set entrypoint to bash for kubectl debug compatibility
# This can be overridden at runtime if needed
ENTRYPOINT ["/bin/bash"]
