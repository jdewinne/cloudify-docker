#!/bin/bash
docker run -h cfy-test -d -v /sys/fs/cgroup:/sys/fs/cgroup:ro -v /tmp/$(mktemp -d):/run -p 80:80 local/cfy-centos7
