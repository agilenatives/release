FROM alpine:edge

RUN apk add --update --no-cache bash coreutils curl ca-certificates jq openssh py-pip
