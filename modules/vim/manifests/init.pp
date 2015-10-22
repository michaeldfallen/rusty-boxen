# Install and configure VIM the way I like it
class vim (
  $user = 'michael'
) {
  include ::vim::plugins

  package { 'vim-gtk': }

  file { "/home/${user}/.gtkrc-2.0":
    ensure => 'link',
    target => '/opt/rusty-boxen/modules/vim/files/gtkrc-2.0',
  }

  file { "/home/${user}/.vim":
    ensure => 'link',
    target => '/opt/rusty-boxen/modules/vim/files/vim',
  }

  file { "/home/${user}/.vimrc":
    ensure => 'link',
    target => '/opt/rusty-boxen/modules/vim/files/vimrc',
  }
}
