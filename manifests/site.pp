require ::rusty_boxen

node default {
  include ::zsh
  include ::zsh::default
  include ::vim
  include ::git
  include ::fonts
}
