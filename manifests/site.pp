require ::rusty_boxen

Exec {
  group => 'adm',
  path  => [ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/' ]
}
Class['apt::update'] -> Package<| |>

node default {
  include ::zsh
  include ::zsh::default
  include ::vim
  include ::git
  include ::fonts
  include ::libs
  include ::ubuntu
}
