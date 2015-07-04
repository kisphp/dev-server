#!/bin/bash

apt-get update
apt-get install -y vim mc tree git

if ! [[ -L /var/www ]]; then
    rm -rf /var/www
    ln -fs /home/web /var/www
fi
