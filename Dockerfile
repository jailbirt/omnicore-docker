FROM alpine:3.4

MAINTAINER Javier Ailbirt <jailbirt@theeye.io>

ENV omnicore_version=omnicore-0.3.0-x86_64-linux-gnu.tar.gz

LABEL omnicore_version="$omnicore_version" architecture="amd64"

RUN apk update \
    && apk upgrade \
    && apk add tar curl git openssh

RUN curl --silent -O "https://bintray.com/artifact/download/omni/OmniBinaries/$omnicore_version" \
        | tar -C /tmp/ -xvz $omnicore_version \
    && mv /tmp/omnicore*/bin/* /usr/bin/ \

EXPOSE 18332,8332

WORKDIR /

CMD ["/usr/bin/omnicored", "-conf=", "/data/", "-testnet"]
