#!/bin/bash

echo " "
echo " INSTALL BASIC COMPONENTS ------------------------------- "
echo " "

apt-get update
apt-get upgrade
apt-get -y install vim mc tree git python-pip python-setuptools
ln -s /sbin/ifconfig /bin/ifconfig
sudo apt-get -y install zsh

#echo " INSTALL OH-MY-ZSH "
#sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
#curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh > /root/install-ohmyzsh.sh
#cp /root/install-ohmyzsh.sh /home/vagrant
#chown vagrant:vagrant /home/vagrant/install-ohmyzsh.sh
#source /root/install-ohmyzsh.sh
#sudo -H -u vagrant bash -c 'chmod u+x /home/vagrant/install-ohmyzsh.sh && ./home/vagrant/install-ohmyzsh.sh'
#sudo -H -u vagrant bash -c 'sudo chsh -s $(which zsh) vagrant'
#chsh -s $(which zsh)

if ! [[ -L /var/www ]]; then
    rm -rf /var/www
    ln -fs /home/web /var/www
fi
