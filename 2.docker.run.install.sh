#!/usr/bin/env bash
set -x

export CMD_PATH=$(cd `dirname $0`; pwd)
export PROJECT_NAME="${CMD_PATH##*/}"
echo $PROJECT_NAME
cd $CMD_PATH

docker pull openeuler/openeuler:22.03-lts

docker run -i -v ./:/code -w /code openeuler/openeuler:22.03-lts /code/files/install.sh
