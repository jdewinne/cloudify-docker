FROM centos:7
MAINTAINER Andrew Taranik

RUN yum -y -q --nogpgcheck update \
 && yum -y -q --nogpgcheck install which python-setuptools unzip \
 && easy_install --quiet --upgrade --no-deps  pip virtualenv \
 && curl -sSL http://repository.cloudifysource.org/org/cloudify3/LatestRelease/cloudify-3.4.1~sp-410.el6.x86_64.rpm -o cfy.rpm \
 && rpm --quiet -i cfy.rpm \
 && rm -f cfy.rpm \
 && yum -y -q clean all \
 && rm -rf ~/.cache

RUN mkdir -p /cfy
ADD . /cfy
WORKDIR /cfy
RUN curl -sSL https://github.com/cloudify-cosmo/cloudify-manager-blueprints/archive/3.4.1.zip -o blueprints.zip \
    && unzip blueprints.zip \
    && mv cloudify-manager-blueprints-3.4.1/* . \
    && rm -rf cloudify-manager-blueprints-3.4.1 \
    && mkdir ~/.ssh \
    && cp keypairs/* ~/.ssh \
    && chmod 400 ~/.ssh/*

RUN cfy init \
    && cfy bootstrap --install-plugins -p /cfy/aws_example.yaml -i /cfy/aws_example-inputs.yaml

ENTRYPOINT ["run_cfy"]
CMD ["-h"]
