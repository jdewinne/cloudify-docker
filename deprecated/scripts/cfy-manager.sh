#!/bin/bash

source /opt/cfy/env/bin/activate
mkdir ~/cfy-manager
cd ~/cfy-manager
cfy init

cp /opt/cfy/cloudify-manager-blueprints-commercial/simple-manager-blueprint-inputs.yaml ~/cfy-manager/input.yaml
sed -ie "s/public_ip: ''/public_ip: '127.0.0.1'/" ~/cfy-manager/input.yaml
sed -ie "s/private_ip: ''/private_ip: '127.0.0.1'/" ~/cfy-manager/input.yaml
sed -ie "s/ssh_user: ''/ssh_user: 'root'/" ~/cfy-manager/input.yaml
sed -ie "s/ssh_key_filename: ''/ssh_key_filename: '\/etc\/insecure_key'/" ~/cfy-manager/input.yaml

cfy bootstrap --install-plugins -p /opt/cfy/cloudify-manager-blueprints-commercial/simple-manager-blueprint.yaml -i ~/cfy-manager/input.yaml
