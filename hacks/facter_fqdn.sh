#!/usr/bin/env bash
#
# Ensures facter fqdn provides a hostname

if [ -z "$(facter fqdn)" ]; then
  echo "Hack: FQDN not set, fixing..."
  hostname="$(facter hostname)"
  echo "domain ${hostname}.local" >> /etc/resolvconf/resolv.conf.d/head
  resolvconf -u
fi
