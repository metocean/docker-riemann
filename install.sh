#!/bin/sh
set -e

# Update & Install
apt-get update
apt-get upgrade -y
apt-get install -y curl default-jre-headless

# Install runit
cp -R /install/runit/* /

# install init.sh
cp -R /install/initsh/* /

# Download the latest .deb and install
curl https://aphyr.com/riemann/riemann_0.2.10_all.deb > /tmp/riemann_0.2.10_all.deb
dpkg -i /tmp/riemann_0.2.10_all.deb
cp /install/riemann.config /etc/riemann/
mkdir /etc/service/riemann
cp /install/riemann.sh /etc/service/riemann/run

# # Install riemann-dash
# apt-get install -y ruby ruby-dev build-essential
# gem install riemann-client riemann-tools riemann-dash
# cp /install/config.rb /etc/riemann/
# cp /install/dash-config.json /etc/riemann/
# mkdir /etc/service/riemann-dash
# cp /install/riemann-dash.sh /etc/service/riemann-dash/run

# remove everything
apt-get remove -y curl
apt-get autoremove -y
apt-get clean all
rm -rf /install /var/lib/apt/lists/* /tmp/* /var/tmp/*