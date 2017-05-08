#!/usr/bin/env bash

docker create -p 80:80 --name caddy -v /var/www:/var/www wplib/caddy
