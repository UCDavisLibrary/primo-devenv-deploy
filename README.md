# Primo Local Deployment

Use this repo to start a local [Primo environment](https://search.library.ucdavis.edu/discovery/search?vid=01UCD_INST:UCD).

## Setup

1. Create a directory for the required repos: `mkdir primo && cd primo`
2. Clone the repos so that they are sibling directories:
   1. This repo:
   `git clone https://github.com/UCDavisLibrary/primo-devenv-deploy.git`
   2. The development environment:
   `git clone https://github.com/UCDavisLibrary/primo-devenv.git`
   3. The UC Davis cusomization package:
   `git clone https://github.com/UCDavisLibrary/primo-packages.git`
3. Copy the contents of `.env_default` into `.env`

## Usage

1. Start the primo environment with `docker compose up -d` from this directory.
2. Edit the files in the `primo-packages` repository. Updates should be immediate.
3. When satisfied with your changes, run `docker compose exec primo gulp create-package`, which will zip your code and place it in the `packages` directory in this repo. See the next section for instructions on uploading your code to production.
4. Take down your container with `docker compose down`

## Uploading to Production