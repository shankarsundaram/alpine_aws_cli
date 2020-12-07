FROM alpine:3.10

LABEL maintainer="Shankar Sundaram<shank.iam88@gmail.com>"

RUN apk update

# Install base and dev packages
RUN apk add --no-cache --virtual .build-deps
RUN apk add bash

# Install build packages
RUN apk add make && apk add curl && apk add openssh

# Install aws-cli
RUN apk -Uuv add groff less python py-pip
RUN pip install awscli boto3 requests requests-aws4auth
RUN apk --purge -v del py-pip
RUN rm /var/cache/apk/*

CMD ["/bin/bash"]
