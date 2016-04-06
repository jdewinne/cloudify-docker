yum -y update
yum -y install wget unzip curl nano which
yum -y install python python-setuptools
easy_install --upgrade pip virtualenv

cd
wget -q http://repository.cloudifysource.org/org/cloudify3/3.3.1/sp-RELEASE/cloudify-centos-Core-cli-3.3.1-sp_b310.x86_64.rpm
rpm -i  cloudify-centos-Core-cli-3.3.1-sp_b310.x86_64.rpm
source /opt/cfy/env/bin/activate
echo "source /opt/cfy/env/bin/activate" >>/root/.bashrc

mkdir ~/cfy-manager
cd ~/cfy-manager
cfy init

cp /opt/cfy/cloudify-manager-blueprints-commercial/simple-manager-blueprint-inputs.yaml ~/cfy-manager/input.yaml
sed -ie "s/public_ip: ''/public_ip: '127.0.0.1'/" ~/cfy-manager/input.yaml
sed -ie "s/private_ip: ''/private_ip: '127.0.0.1'/" ~/cfy-manager/input.yaml
sed -ie "s/ssh_user: ''/ssh_user: 'root'/" ~/cfy-manager/input.yaml
sed -ie "s/ssh_key_filename: ''/ssh_key_filename: '\/etc\/insecure_key'/" ~/cfy-manager/input.yaml

#cfy bootstrap --install-plugins -p /opt/cfy/cloudify-manager-blueprints-commercial/simple-manager-blueprint.yaml -i ~/cfy-manager/input.yaml
