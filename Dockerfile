FROM alpine
RUN apk add --update python python-dev libffi-dev libssl-dev && \
    rm -rf /var/cache/apk/*
RUN easy_install --upgrade pip virtualenv
RUN virtualenv ~/cfy
RUN source ~/cfy/bin/activate
RUN pip install requests[security]
RUN pip install cloudify

ENTRYPOINT ["cfy"]
CMD ["-h"]