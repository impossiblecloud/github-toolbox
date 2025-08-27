#
# Image with Github tools
#

FROM alpine:3.21

RUN apk add --no-cache git github-cli bash \
    && adduser -u 1100 -s /sbin/nologin -D git \
    && mkdir -p /home/git/.ssh \
    && chown 1100:1100 /home/git/.ssh

ADD files/known_hosts /home/git/.ssh/known_hosts

WORKDIR /home/git
USER 1100
ENTRYPOINT ["/bin/bash"]
