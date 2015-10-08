#!/usr/bin/env bash
#
# Apply boxen

puppet apply \
  --modulepath=/opt/rusty-boxen/modules \
  manifests/site.pp
