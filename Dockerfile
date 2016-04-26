FROM alpine
MAINTAINER Andrew Taranik

RUN mkdir -p /cfy
WORKDIR /cfy

RUN apk add --update python py-pip py-crypto \
 && pip install --upgrade pip cloudify \
 && rm -rf /var/cache/apk/*

VOLUME /cfy

ENTRYPOINT ["cfy"]
CMD ["-h"]
