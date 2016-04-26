#!/bin/bash

# Update and install dependicies

sudo yum -y -q update
sudo yum -y -q install wget unzip curl nano which gcc
sudo yum -y -q install python python-setuptools python-devel
sudo easy_install --quiet --upgrade pip virtualenv

# Install CFY 3.3.1
cd \
  && wget -q http://repository.cloudifysource.org/org/cloudify3/3.3.1/sp-RELEASE/cloudify-centos-Core-cli-3.3.1-sp_b310.x86_64.rpm \
  && sudo rpm --quiet -i cloudify-centos-Core-cli-3.3.1-sp_b310.x86_64.rpm \
  && rm -f cloudify-centos-Core-cli-3.3.1-sp_b310.x86_64.rpm \
  && echo "source /opt/cfy/env/bin/activate" >>~/.bashrc \
  && sudo yum -y -q clean all \
  && echo -e "\nRelogin or enter:  source /opt/cfy/env/bin/activate\n" \
  || echo -e "\nWARNING! Something wrong\n"
