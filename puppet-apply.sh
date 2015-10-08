#!/usr/bin/env bash
#
# Apply boxen

curl https://raw.githubusercontent.com/michaeldfallen/rusty-boxen/master/bootstrap.sh

puppet apply \
  --modulepath=/opt/rusty-boxen/modules \
  /opt/rusty-boxen/manifests/site.pp
