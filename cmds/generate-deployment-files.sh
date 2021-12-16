#! /bin/bash

##
# Generate docker-compose local development files based on
# config.sh parameters
##

set -e
ROOT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd $ROOT_DIR/../templates

source ../config.sh

# generate local development dc file
content=$(cat local-dev.yaml)
PRIMO_TAG='local-dev'
for key in $(compgen -v); do
  if [[ $key == "COMP_WORDBREAKS" || $key == "content" ]]; then
    continue;
  fi
  escaped=$(printf '%s\n' "${!key}" | sed -e 's/[\/&]/\\&/g')
  content=$(echo "$content" | sed "s/{{$key}}/${escaped}/g") 
done
if [ ! -d "../primo-local-dev" ]; then
  mkdir ../primo-local-dev
  touch ../primo-local-dev/.env
fi

echo "$content" > ../primo-local-dev/docker-compose.yaml