#!/usr/bin/env bash

docker stop caddy 2>&1 > /dev/null

docker rm caddy
docker rmi wplib/caddy

webserver=$(jq '.services.webserver' /vagrant/project.json)

if [ $webserver = "caddy" ]; then
    echo "Setting Nginx as default web server. You can switch to Apache using the 'box apache' CLI command."
    jq --arg webserver "nginx" '.services.webserver = $webserver' /vagrant/project.json > new.json && mv new.json /vagrant/project.json
    echo "Starting default Nginx webserver"
    docker start nginx
fi