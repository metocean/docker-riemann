#!/bin/sh
set -e

apk update
apk upgrade

# Install real bash
rm /bin/bash
apk add bash

# Install Java
apk add openjdk8-jre

# Install riemann
wget https://aphyr.com/riemann/riemann-0.2.10.tar.bz2
tar xvfj riemann-0.2.10.tar.bz2
cp -R /riemann-0.2.10/* /usr
rm -rf /riemann-0.2.10
mkdir /etc/riemann
cp /install/riemann.config /etc/riemann/
mkdir /etc/service/riemann
cp /install/riemann.sh /etc/service/riemann/run

# Clean up
rm -rf /install
rm -rf /tmp/*
rm -rf /var/cache/apk/*