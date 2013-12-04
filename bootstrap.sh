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
#
# Todos:
#        mount apt-cache to speed-up provisioning https://gist.github.com/millisami/3798773

apt-get update

## update all packages
apt-get upgrade -y

## Git
apt-get install -y git

## Apache
apt-get install -y apache2
rm -rf /var/www
ln -fs /vagrant /var/www

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