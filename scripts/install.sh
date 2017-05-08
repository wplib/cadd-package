#!/usr/bin/env bash

# Create the docker container
docker create -p 80:80 --name caddy -v /var/www:/var/www wplib/caddy

# Add the command to set the box to use the caddy server
cp ../commands/caddy /box/scripts/guest/cli/commands/caddy
