#!/bin/bash
docker build --rm -t taranik/cfy-centos7 . && \
CONTAINER=`docker run -d -v /sys/fs/cgroup:/sys/fs/cgroup:ro -v /tmp/$(mktemp -d):/run taranik/cfy-centos7` && \
docker exec $CONTAINER /scripts/cfy-manager.sh && \
docker exec $CONTAINER yum -y clean all && \
docker exec $CONTAINER rm -rf /scripts /tmp/* /var/tmp/* && \
docker stop $CONTAINER && \
docker commit $CONTAINER taranik/cfy-centos7 && \
docker rm $CONTAINER && \
docker push taranik/cfy-centos7
