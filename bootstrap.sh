#!/bin/bash

echo " "
echo " INSTALL BASIC COMPONENTS ------------------------------- "
echo " "

apt-get update
apt-get upgrade
apt-get -y install vim mc tree git python-pip python-setuptools build-essential
ln -s /sbin/ifconfig /bin/ifconfig
sudo apt-get -y install zsh

echo " Install phpunit "
wget https://phar.phpunit.de/phpunit.phar
chmod +x phpunit.phar
mv phpunit.phar /usr/local/bin/phpunit
phpunit --version

echo " Install NodeJS "
apt-get install -y nodejs npm
ln -s /usr/bin/nodejs /usr/bin/node

echo " Update nodejs and npm "
npm cache clean -f
npm install -g n
n stable

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
