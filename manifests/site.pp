require ::rusty_boxen
require ::ubuntu

Exec {
  group => 'adm',
  path  => [ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/' ]
}
exec { 'apt-get update':
  command => '/usr/bin/apt-get update',
  onlyif  => '/bin/sh -c "[ ! -f /var/cache/apt/pkgcache.bin ]' +
    ' || /usr/bin/find /etc/apt/* -cnewer /var/cache/apt/pkgcache.bin' +
    ' | /bin/grep . > /dev/null"',
}
Package {
  require => Exec['apt-get update']
}

node default {
  include ::zsh
  include ::zsh::default
  include ::vim
  include ::git
  include ::fonts
  include ::libs
  include ::ubuntu::apps
}
