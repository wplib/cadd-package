# Caddy Package for WPLib Box

This is an installable package for [WPLib Box](https://github.com/wplib/wplib-box) that installs
the [Caddy Web Server](https://caddyserver.com/).

## Package Installation

To install this package, simple execute the following command inside the box:
`box package-install wplib/caddy-package`.

This will install the Caddy web server and give you the option to set Caddy to be the default web
server.

## Commands

This package includes the `caddy` CLI command as well. You can use this command to switch from the
current webserver to Caddy.

## Remove Caddy
To remove the Caddy web server package, simply execute `box package-delete wplib/caddy-package`. This
will delete the Caddy web server from the box and return your configuration to the default web server
included with the box.
