#!/usr/bin/env bash

# nginx
sudo apt-get -y install nginx
sudo service nginx start

# clean /var/www
sudo rm -Rf /var/www
# symlink /var/www => /vagrant
sudo ln -s /vagrant/provision/nginx/www /var/www

# set up nginx server
sudo rm -f /etc/nginx/sites-available/site.conf /etc/nginx/sites-enabled/site.conf /etc/nginx/sites-enabled/default

sudo cp /vagrant/provision/nginx/nginx.conf /etc/nginx/sites-available/site.conf
sudo chmod 644 /etc/nginx/sites-available/site.conf
sudo ln -s /etc/nginx/sites-available/site.conf /etc/nginx/sites-enabled/site.conf
#sudo unlink /etc/nginx/sites-enabled/default
sudo service nginx restart
