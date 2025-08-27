#
# Image with Github tools
#

###### Build gha-token tool
FROM golang:1.24.4-alpine3.21 AS build
RUN go install github.com/slawekzachcial/gha-token@1.1.0

###### Final image
FROM alpine:3.21

RUN apk add --no-cache git github-cli bash openssh curl \
    && adduser -u 1100 -s /sbin/nologin -D git \
    && mkdir -p /home/git/.ssh \
    && chown 1100:1100 /home/git/.ssh \
    && chmod 700 /home/git/.ssh

ADD files/known_hosts /home/git/.ssh/known_hosts
COPY --from=build /go/bin/gha-token /usr/bin/gha-token

WORKDIR /home/git
USER 1100
ENTRYPOINT ["/bin/bash"]
