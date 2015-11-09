#!/bin/bash

echo " "
echo " INSTALL BASIC COMPONENTS ------------------------------- "
echo " "

apt-get update
apt-get upgrade
apt-get -y install vim mc tree git python-pip python-setuptools
ln -s /sbin/ifconfig /bin/ifconfig

echo " INSTALL OH-MY-ZSH "
sudo apt-get -y install zsh
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

if ! [[ -L /var/www ]]; then
    rm -rf /var/www
    ln -fs /home/web /var/www
fi
