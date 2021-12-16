#! /bin/bash

######### DEPLOYMENT CONFIG ############
# Setup your local application deployment here
########################################

PRIMO_TAG='local-dev'

# Container Registery
CONTAINER_REG_ORG=gcr.io/ucdlib-pubreg
CONTAINER_CACHE_TAG="latest"

PRIMO_IMAGE_NAME=$CONTAINER_REG_ORG/primo

PRIMO_IMAGE_NAME_TAG=$PRIMO_IMAGE_NAME:$PRIMO_TAG

ALL_DOCKER_BUILD_IMAGES=( $PRIMO_IMAGE_NAME )

ALL_DOCKER_BUILD_IMAGE_TAGS=(
  $PRIMO_IMAGE_NAME_TAG
)

##
# Repositories
##

GITHUB_ORG_URL=https://github.com/UCDavisLibrary
PRIMO_REPO_NAME=primo-devenv
PRIMO_REPO_URL=$GITHUB_ORG_URL/$PRIMO_REPO_NAME
PACKAGE_REPO_NAME=primo-packages
PACKAGE_REPO_URL=$GITHUB_ORG_URL/$PACKAGE_REPO_NAME


##
# Git
##
GIT=git
GIT_CLONE="$GIT clone"

ALL_GIT_REPOSITORIES=( $PRIMO_REPO_NAME $PACKAGE_REPO_NAME)

# directory we are going to cache our various git repos at different tags
# if using pull.sh or the directory we will look for repositories (can by symlinks)
# if local development
REPOSITORY_DIR=repositories