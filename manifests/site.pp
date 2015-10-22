require ::rusty_boxen

Exec {
  group => 'adm',
  path  => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ]
}

node default {
  include ::zsh
  include ::zsh::default
  include ::vim
  include ::git
  include ::fonts
}
