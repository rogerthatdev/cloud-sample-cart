FROM node:20

# Install system dependencies
RUN apt-get update -y && apt-get install -y \
    tini \
    nfs-common \
    && apt-get clean

# Set fallback mount directory
ENV MNT_DIR /mnt/nfs/filestore

# Copy local code to the container image.
ENV APP_HOME /app
WORKDIR $APP_HOME
COPY package*.json ./

# Install production dependencies.
RUN npm install --only=production

# Copy local code to the container image.
COPY . ./

# Ensure the script is executable
RUN chmod +x /app/wrapper.sh

# Use tini to manage zombie processes and signal forwarding
# https://github.com/krallin/tini
ENTRYPOINT ["/usr/bin/tini", "--"]

# Pass the wrapper script as arguments to tini
CMD ["/app/wrapper.sh"]
# [END cloudrun_fs_dockerfile]
