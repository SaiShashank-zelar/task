#!/bin/bash

COMPONENT=$1

export LOG=/tmp/${COMPONENT}.log
rm -f $LOG

source go/common.sh

if [ ! -f go/${COMPONENT}.sh ]; then
  ERROR "Invalid component Name is provided"
  exit 1
fi

export COMPONENT
bash go/${COMPONENT}.sh
