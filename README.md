## Dockerized Cloudify orchestrate tool


Cloudify latest CLI in Docker container

Usage:

docker run --rm -v $(pwd):/cfy pure/cfy init
docker run --rm -v $(pwd):/cfy cloudify:latest bootstrap --install-plugins -p /cfy/aws_example.yaml -i /cfy/aws_example-inputs.yaml


