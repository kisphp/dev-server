#!/bin/bash

apt-get update
apt-get install -y vim mc tree git setup-tools

if ! [[ -L /var/www ]]; then
    rm -rf /var/www
    ln -fs /home/web /var/www
fi
