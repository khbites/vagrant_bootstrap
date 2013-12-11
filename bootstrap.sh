#!/usr/bin/env bash
#
#
#
#
# Title bootstrap for vagrant dev environment
# Focus
#        - wordpress (apache, postgres, php)
#        - zurb (node.js, gems, ruby, compass)
#
# Author: @khbites github.com/khbites
#
# Install: First, get the vbguest plugin
#               $ vagrant plugin install vagrant-vbguest
#
# Todos:
#        mount apt-cache to speed-up provisioning https://gist.github.com/millisami/3798773

apt-get update

## update all packages
apt-get upgrade -y

## Git
apt-get install -y git

# Generate a ssh key and put it into github
# ssh-keygen -t rsa -b 4096 -C "your_email"
# cat .ssh/id_rsa.pub
# got to github to add the public key https://github.com/settings/ssh

## Apache
apt-get install -y apache2
rm -rf /var/www
ln -fs /home/vagrant/vagrant_zurb_template /var/www
# Or do the following manually
# create /etc/apache2/sites-available/zurb from the default file
# add the following directory to access your zurb template share

        # Alias /zurb/ "/home/vagrant/vagrant_zurb_template/"
        # <Directory "/home/vagrant/vagrant_zurb_template/">
                # Options Indexes FollowSymLinks MultiViews
                # AllowOverride None
                # Order allow,deny
                # allow from all
        # </Directory>

# cd ../sites-enabled
# sudo ln -fs ../sites-available/zurb . 
# sudo rm 00*default


## Ruby
apt-get install ruby1.9.3
# manual on command line:
# update-alternatives --config ruby
update-alternatives --set ruby /usr/bin/ruby1.9.1

## node.js (for zurb dev)
# from https://github.com/joyent/node/wiki/Installing-Node.js-via-package-manager
apt-get install -y python-software-properties python g++ make
apt-get install -y software-properties-common
add-apt-repository -y ppa:chris-lea/node.js
apt-get update
apt-get install -y nodejs

## zurb specifics (bower, foundation gem)
# do we need "npm install -g grunt-cli" <- PreRelease versions dependency?
npm install -g bower
gem install foundation
gem install compass

# create zurb template with:
# "foundation new vagrant_zurb_template" (in /home/vagrant)
# You need to change the cache-pass, as you get errors with running
# "compass watch" on shared folders (see echo "cache_path = \"/tmp/.sass-cache\"" >> config.rb)
# echo "cache_path = \"/tmp/.sass-cache\"" >> config.rb