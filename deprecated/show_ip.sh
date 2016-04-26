#!/bin/bash
if [ $# -eq 0 ]; then echo; echo "USAGE: $0 <CONTAINER_ID>"; echo; exit 1; fi
docker inspect -f "{{ .NetworkSettings.IPAddress }}" $*