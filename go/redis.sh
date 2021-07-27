#!/bin/bash

source components/common.sh

OS_PREREQ

head "To install Redis-Server"
apt install redis-server -y &&
sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/redis/redis.conf
Stat $?
head "To Restart the Service"
systemctl restart redis
Stat $?
