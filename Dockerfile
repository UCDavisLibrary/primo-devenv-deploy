FROM node:fermium

# Install system dependencies required for the canvas package
RUN apt-get update && apt-get install -y \
    libcairo2-dev \
    libjpeg-dev \
    libpango1.0-dev \
    libgif-dev \
    build-essential \
    g++ \
    libpng-dev

# Install gulp globally
WORKDIR /home/node
RUN npm install -g gulp

# Install dev environment
RUN git clone --progress --verbose https://github.com/UCDavisLibrary/primo-devenv.git
WORKDIR /home/node/primo-devenv

# Ensure prebuilt binaries are preferred, fallback to build if necessary
RUN npm install --build-from-source=false

# Expose necessary ports
EXPOSE 8003
EXPOSE 3001

# Copy and run the startup script
COPY cmds/primo-run.sh primo-run.sh
CMD ["./primo-run.sh"]