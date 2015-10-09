#!/usr/bin/env bash
#
# Bootstraps Rusty from 0 to puppet

echo "Installing git..."
apt-get install -y git >/dev/null
apt-get install -y xclip >/dev/null

echo "Cloning rusty-boxen to /opt/rusty-boxen..."
git clone --recurse-submodules https://github.com/michaeldfallen/rusty-boxen.git /opt/rusty-boxen

cd /opt/rusty-boxen

echo "Create ssh key..."
./bin/newsshkey "github.com"
read -p "Upload ssh key to Github then press any key to continue... " -n1 -s </dev/tty

echo "Boostrapping puppet..."
apt-get install -y puppet >/dev/null

echo "Running hacks..."
./hacks/facter_fqdn.sh

echo "Running rusty..."
/opt/rusty-boxen/bin/rusty update
