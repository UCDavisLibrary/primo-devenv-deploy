#! /bin/bash

###
# Init the /repositories folder with symbolic links to folders that exist in the same parent
# directory as this primo-devenv-deploy folder.
# Note: This script does not checkout any repository, it simply cleans the /repositories folders
# and makes the symbolic links and installs npm dependencies
###

set -e
ROOT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd $ROOT_DIR/..

source ./config.sh

if [ -d "./${REPOSITORY_DIR}" ]; then
  rm -rf ./$REPOSITORY_DIR
fi
mkdir ./$REPOSITORY_DIR

for repo in "${ALL_GIT_REPOSITORIES[@]}"; do
  ln -s ../../$repo ./$REPOSITORY_DIR/$repo
done

(cd $REPOSITORY_DIR/$PACKAGE_REPO_NAME/01UCD_INST-UCD
 npm install
)

ls -al $REPOSITORY_DIR