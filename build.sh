#!/bin/bash
docker build --rm -t taranik/cfy-centos7 . && \
docker run  --name cfy-build -d -v /sys/fs/cgroup:/sys/fs/cgroup:ro -v /tmp/$(mktemp -d):/run taranik/cfy-centos7 && \
docker exec cfy-build /scripts/cfy-manager.sh && \
docker exec cfy-build yum -y clean all && \
docker exec cfy-build rm -rf /scripts /tmp/* /var/tmp/* && \
docker stop cfy-build && \
docker commit cfy-build taranik/cfy-centos7 && \
docker rm cfy-build