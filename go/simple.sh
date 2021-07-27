#!/bin/bash

source go/common.sh

OS_PREREQ

head "Installing golang"

cd /root
wget -c https://dl.google.com/go/go1.14.2.linux-amd64.tar.gz -O - | sudo tar -xz -C /usr/local &>>$LOG
export PATH=$PATH:/usr/local/go/bin
source ~/.profile
Stat $?
head "version of golang"
go version
Stat $?
head "To create a directory"
    mkdir /go && cd /go
head "To clone the git Repo in to login"
git clone https://github.com/SaiShashank-zelar/SimpleCRUDApp.git &>>$LOG
cd SimpleCRUDApp && export GOPATH=/go
apt install go-dep &>>$LOG
Stat $?
head "replace the ip address"
sed -i -e 's/127.0.0.1:6379/172.31.94.31:6379/' /go/SimpleCRUDApp/config/config.toml &&
sed -i -e 's/127.0.0.1/172.31.0.35/' /go/SimpleCRUDApp/config/config.toml

Stat $?
head "to build the golang"
go get
go build
Stat $?

head "To create a systemd file"
mv go.service /etc/systemd/system/go.service &>>$LOG
head "To start a service"
systemctl daemon-reload &&
service go start &&
service go restart
Stat $?

