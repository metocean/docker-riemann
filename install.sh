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
tar xvfj riemann-$RIEMANN_VERSION.tar.bz2
cp -R /riemann-$RIEMANN_VERSION/* /usr
rm -rf /riemann-$RIEMANN_VERSION
mkdir /etc/riemann
cp /install/riemann.config /etc/riemann/
mkdir /etc/service/riemann
cp /install/riemann.sh /etc/service/riemann/run

# Clean up
rm -rf /install
rm -rf /tmp/*
rm -rf /var/cache/apk/*