#!/usr/bin/env bash
#
# Apply boxen

echo "Updating rusty-boxen..."
git fetch --quiet >/dev/null
git reset --quiet --hard origin/master >/dev/null
git submodule update --init --recursive >/dev/null

echo "Running Puppet apply..."
puppet apply \
  --modulepath=modules \
  manifests/site.pp
