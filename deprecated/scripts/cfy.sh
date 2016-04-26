#!/bin/bash

yum -y -q install wget unzip curl nano which
yum -y -q install python python-setuptools
easy_install --quiet --upgrade pip virtualenv

cd
wget -q http://repository.cloudifysource.org/org/cloudify3/3.3.1/sp-RELEASE/cloudify-centos-Core-cli-3.3.1-sp_b310.x86_64.rpm
rpm --quiet -i cloudify-centos-Core-cli-3.3.1-sp_b310.x86_64.rpm
source /opt/cfy/env/bin/activate
echo "source /opt/cfy/env/bin/activate" >>/root/.bashrc
