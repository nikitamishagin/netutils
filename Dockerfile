# Using the official Alpine 3.22 image as a base
FROM alpine:3.23

# Installing bash and netutils packages
RUN apk update && \
    apk add --no-cache \
    bash \
    bash-completion \
    bind-tools \
    busybox-extras \
    curl \
    iproute2 \
    iputils \
    jq \
    nmap \
    tcpdump \
    traceroute \
    vim \
    wget \
    yq

# Set entrypoint to bash for kubectl debug compatibility
# This can be overridden at runtime if needed
ENTRYPOINT ["/bin/bash"]
