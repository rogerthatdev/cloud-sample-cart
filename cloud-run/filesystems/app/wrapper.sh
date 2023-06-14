# Create a directory to mount the NFS to.
mkdir -p mountpoint

# Mount the NFS filesystem to the mount point
mount -o nolock $FILESTORE_IP:/$FILESTORE_SHARE_NAME mountpoint

# Start the application

