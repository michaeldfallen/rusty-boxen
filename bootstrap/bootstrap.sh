#!/usr/bin/env bash
#
# Bootstraps Rusty from 0 to puppet

if [ "$(id -u)" != "0" ]; then
  echo "This script must be run as root." >&2
  exit 1
fi

echo "Installing git..."
apt-get install -y git >/dev/null

if [ ! -d /opt/rusty-boxen ]; then
  echo "Cloning rusty-boxen to /opt/rusty-boxen..."
  git clone --recurse-submodules https://github.com/michaeldfallen/rusty-boxen.git /opt/rusty-boxen >/dev/null
fi

cd /opt/rusty-boxen
git fetch >/dev/null
git pull >/dev/null
git submodule update --init --recursive >/dev/null

echo "Boostrapping puppet..."
chmod u+x ./bootstrap/puppet-bootstrap/ubuntu.sh
./bootstrap/puppet-bootstrap/ubuntu.sh
