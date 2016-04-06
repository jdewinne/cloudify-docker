#!/bin/bash

yum -y install cronie
systemctl enable crond.service
