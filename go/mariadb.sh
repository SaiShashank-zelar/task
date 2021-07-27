#!/bin/bash

source components/common.sh

OS_PREREQ
head "To install mariadb server"
apt install mariadb-server -y &&
sed -i -e 's/127.0.0.0/0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf
Stat $?
head "To Restart the Service"
systemctl restart mariadb
Stat $?
