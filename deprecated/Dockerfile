FROM centos:7
MAINTAINER "Andrew Taranik" <andrew.taranik@gmail.com>
ENV container docker
RUN yum -y update
RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done); \
rm -f /lib/systemd/system/multi-user.target.wants/*;\
rm -f /etc/systemd/system/*.wants/*;\
rm -f /lib/systemd/system/local-fs.target.wants/*; \
rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
rm -f /lib/systemd/system/basic.target.wants/*;\
rm -f /lib/systemd/system/anaconda.target.wants/*;
VOLUME [ "/sys/fs/cgroup" ]

ADD scripts /scripts

RUN /scripts/sshd/sshd.sh && /usr/sbin/enable_insecure_key
RUN /scripts/cron/cron.sh
RUN /scripts/cfy.sh

RUN yum -y clean all
RUN rm -rf /tmp/* /var/tmp/*

EXPOSE 22
EXPOSE 80

CMD ["/usr/sbin/init"]
