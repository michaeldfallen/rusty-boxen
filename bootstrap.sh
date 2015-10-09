#!/usr/bin/env bash
#
# Bootstraps Rusty from 0 to puppet

sudo -v

echo "Installing git..."
sudo apt-get install -y git >/dev/null
sudo apt-get install -y xclip >/dev/null

echo "Cloning rusty-boxen to /tmp/rusty-boxen..."
rm -rf /tmp/rusty-boxen
git clone --recurse-submodules https://github.com/michaeldfallen/rusty-boxen.git /tmp/rusty-boxen

cd /tmp/rusty-boxen

echo "Create ssh key..."
./bin/newsshkey "github.com"
read -p "Upload ssh key to Github then press any key to continue... " -n1 -s </dev/tty

echo "Boostrapping puppet..."
sudo apt-get install -y puppet >/dev/null

echo "Running hacks..."
sudo ./hacks/facter_fqdn.sh

echo "Running bootstrap..."
puppet apply \
  --modulepath=/tmp/rusty-boxen/modules \
  /tmp/rusty-boxen/manifests/bootstrap.pp

echo "Running rusty..."
sudo /opt/bin/rusty update

echo "Cleaning up..."
rm -rf /tmp/rusty-boxen
