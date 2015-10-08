#!/usr/bin/env bash
#
# Apply boxen

echo "Updating rusty-boxen..."
git fetch
git reset --hard origin/master
git submodule update --init --recursive

echo "Running Puppet apply..."
puppet apply \
  --modulepath=modules \
  manifests/site.pp
