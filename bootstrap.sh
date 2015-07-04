#!/bin/bash

apt-get update
apt-get install -y vim mc tree git

git clone https://kisphp@bitbucket.org/kisphp/ubuntu_server_install.git libs/kisphp/ubuntu_server_install

if ! [[ -L /var/www ]]; then
    rm -rf /var/www
    ln -fs /home/web /var/www
fi

. libs/kisphp/ubuntu_server_install/install.sh
