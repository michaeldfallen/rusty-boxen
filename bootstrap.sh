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

echo "Boostrapping puppet..."
apt-get install -y puppet >/dev/null

echo "Running hacks..."
./hacks/facter_fqdn.sh

echo "Running puppet..."
./puppet-apply.sh
