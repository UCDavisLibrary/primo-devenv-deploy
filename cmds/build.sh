#! /bin/bash

###
# Main build process to cutting production images
###

set -e
ROOT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd $ROOT_DIR/..
source config.sh

LOCAL_BUILD=true


##
# Primo
##
docker build \
  -t $PRIMO_IMAGE_NAME_TAG \
  ./
