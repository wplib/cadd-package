#!/usr/bin/env bash

# Create the docker container
docker create -p 80:80 --name caddy -v /var/www:/var/www wplib/caddy

# Add the command to set the box to use the caddy server
cp ../commands/caddy /box/scripts/guest/cli/commands/caddy


activate="Y"
read -p "Set Caddy to be default webserver(Y/n)?: " input
activate="${input:-$activate}"

if [ "Y" = ${activate} ]; then
    current=$(jq '.services.webserver' /vagrant/project.json)
    echo "Stopping ${current}..."
    docker stop ${current} 2>&1 > /dev/null
    echo "Starting Caddy..."
    docker start caddy 2>&1 > /dev/null
    #udpate the project.json
    echo "Updating box configuration"
    jq --arg caddy "caddy" '.services.webserver = $caddy' /vagrant/project.json > new.json && mv new.json /vagrant/project.json
else
    echo "You can later set Caddy to be the active webserver using the 'box caddy' command."
fi