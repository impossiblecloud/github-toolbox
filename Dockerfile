#
# Image with Github tools
#

FROM alpine:3.21
WORKDIR /
RUN apk add --no-cache git github-cli bash \
    && mkdir -p /root/.ssh \
    && echo "github.com ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOMqqnkVzrm0SdG6UOoqKLsabgH5C9okWi0dh2l9GKJl" > /root/.ssh/known_hosts

ENTRYPOINT ["/bin/bash"]
