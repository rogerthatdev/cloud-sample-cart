#!/usr/bin/env bash
set -eo pipefail

# Create a directory to mount the NFS to.
mkdir -p $MNT_DIR

# Mount the NFS filesystem to the mount point
mount -o nolock $FILESTORE_IP:/$FILESTORE_SHARE_NAME $MNT_DIR

# Start the sample code.
node sample.js
