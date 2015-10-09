#!/usr/bin/env bash
#
# Bootstraps Rusty from 0 to puppet

sudo -v

echo "Installing git..."
sudo apt-get install -y git >/dev/null

echo "Cloning rusty-boxen to /tmp/rusty-boxen..."
git clone --recurse-submodules https://github.com/michaeldfallen/rusty-boxen.git /tmp/rusty-boxen >/dev/null

cd /tmp/rusty-boxen

echo "Boostrapping puppet..."
sudo apt-get install -y puppet >/dev/null

echo "Running hacks..."
sudo ./hacks/facter_fqdn.sh

echo "Running puppet..."
sudo ./bin/rusty update
