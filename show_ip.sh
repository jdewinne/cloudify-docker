#!/bin/bash
docker inspect -f "{{ .NetworkSettings.IPAddress }}" $*