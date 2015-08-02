#!/usr/bin/env bash
#
# Bootstraps Rusty from 0 to puppet

if [ "$(id -u)" != "0" ]; then
  echo "This script must be run as root." >&2
  exit 1
fi

echo "Installing git..."
apt-get install -y git >/dev/null

echo "Cloning rusty-boxen to /opt/rusty-boxen..."
git clone --recurse-submodules --force https://github.com/michaeldfallen/rusty-boxen.git /opt/rusty-boxen >/dev/null

cd /opt/rusty-boxen

echo "Boostrapping puppet..."
chmod u+x ./bootstrap/puppet-bootstrap/ubuntu.sh
./bootstrap/puppet-bootstrap/ubuntu.sh
