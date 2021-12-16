# Primo Local Development

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
3. Next, we will build our docker image and compose file:
   1. `cd primo-devenv-deploy`
   2. `./cmds/init-local-dev.sh`
   3. `./cmds/build.sh`
   4. `./cmds/generate-deployment-files.sh`

## Usage

Now that the initial set up is done, we can start Primo:
1. `cd primo-local-dev`
2. `docker compose up`

Primo should now be running at http://localhost:8003/discovery/search?vid=01UCD_INST:UCD

To edit the primary package file, you can edit the `primo-packages` repository you cloned during the setup. All changes should display immediately.

When satisfied with your changes, run `docker compose exec primo gulp create-package`, which will zip your code and place it in the `packages` directory in this repo. See the next section for instructions on uploading your code to production.

`^c` will stop the application, and `docker compose down` will completely remove the container.

## Uploading to Production
Once you have your zipped package file, you will upload and deploy it to the production Primo instance.
1. Login in to [Alma](https://ucdavis.alma.exlibrisgroup.com/SAML)
2. Select "Discovery" in the left-hand menu. If you don't see it, you will need to be granted the appropriate permissions.
3. Click "Configure Views" and then select the 'Edit' for the view.
4. Go to 'Manage Customization Packages'
5. Download the Current View Customization Package, and stash it somewhere in case something goes awry and you have to roll back
6. Upload the new package and save

## Editing the Build Process
We use a forked version of the official Primo build process. If you need to edit this process, the gulp files are a volume. To be able to quickly start/stop the environment without restarting the container, 
1. uncomment the `bash -c "tail -f /dev/null"` command in the docker-compose file
2. `docker compose up`
3. `docker compose exec primo bash`
4. `bash run.sh` to start the process, ctr-c to stop.

