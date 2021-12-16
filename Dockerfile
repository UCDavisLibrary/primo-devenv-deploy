FROM node:fermium

# Install gulp globally
WORKDIR /home/node
RUN npm install -g gulp

# Install dev environment
RUN git clone --progress --verbose https://github.com/UCDavisLibrary/primo-devenv.git
WORKDIR /home/node/primo-devenv
RUN npm install

# expose ports
EXPOSE 8003
EXPOSE 3001

# run
COPY cmds/primo-run.sh primo-run.sh
CMD ["./primo-run.sh"]