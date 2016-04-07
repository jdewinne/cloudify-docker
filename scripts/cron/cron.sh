#!/bin/bash

yum -y -q install cronie
systemctl enable crond.service
