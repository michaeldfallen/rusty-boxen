#!/usr/bin/env bash
#
# Apply boxen

touch /opt/boxen-ran

puppet apply \
  --modulepath=/opt/rusty-boxen/modules \
  manifests/site.pp