FROM alpine
RUN apk add --update  gcc libc-dev libc6-compat python python-dev py-pip libffi-dev openssl-dev
RUN pip install --upgrade pip && pip install --upgrade virtualenv requests[security]
RUN virtualenv /cfy
RUN source /cfy/bin/activate
WORKDIR /cfy
RUN pip install requests[security]
RUN pip install cloudify

RUN apk del gcc libc-dev libc6-compat python-dev libffi-dev openssl-dev && \
    rm -rf /var/cache/apk/*

VOLUME /cfy

ENTRYPOINT ["cfy"]
CMD ["-h"]
