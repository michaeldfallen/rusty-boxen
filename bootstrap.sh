#!/usr/bin/env bash
#
# Bootstraps Rusty from 0 to puppet

sudo -v

echo "Update apt-get..."
sudo apt-get update

echo "Installing git..."
sudo apt-get install -y git >/dev/null
sudo apt-get install -y xclip >/dev/null

echo "Cloning rusty-boxen to /opt/rusty-boxen..."
sudo git clone --recurse-submodules https://github.com/michaeldfallen/rusty-boxen.git /opt/rusty-boxen
sudo chown -R michael:michael /opt/rusty-boxen

cd /opt/rusty-boxen

echo "Create ssh key..."
./bin/newsshkey "github.com"
read -p "Upload ssh key to Github then press any key to continue... " -n1 -s </dev/tty

git remote remove origin
git remote add origin git@github.com:michaeldfallen/rusty-boxen

echo "Boostrapping puppet..."
sudo apt-get install -y puppet >/dev/null

echo "Running hacks..."
sudo ./hacks/facter_fqdn.sh

echo "Running rusty..."
/opt/rusty-boxen/bin/rusty update
