#!/bin/bash

# Save private ssh key from env var
echo $JEKYLL_DEPLOY_KEY > /ssh.key

# Make sure the key has correct permissions
chmod 0600 /ssh.key

# Sync the files
rsync \
  -e "ssh -i /ssh.key -o StrictHostKeyChecking=no -p $DEPLOY_PORT" \
  -rtzh \
  _site/ \
  --progress \
  $DEPLOY_USER@$DEPLOY_HOST:$DEPLOY_DIR
