#!/bin/bash
docker run -h cfy-manager -d -v /sys/fs/cgroup:/sys/fs/cgroup:ro -v /tmp/$(mktemp -d):/run -p 80:80 taranik/cfy-centos7
