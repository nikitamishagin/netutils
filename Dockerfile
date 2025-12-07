# Using the official Alpine 3.22 image as a base
FROM alpine:3.22

# Installing bash and netutils packages
RUN apk update && \
    apk add --no-cache \
    bash \
    bash-completion \
    bind-tools \
    curl \
    iproute2 \
    iputils \
    nmap \
    tcpdump \
    busybox-extras \
    traceroute \
    vim \
    wget

# Set entrypoint to bash for kubectl debug compatibility
# This can be overridden at runtime if needed
ENTRYPOINT ["/bin/bash"]
