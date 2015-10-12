# Install and configure VIM the way I like it
class vim (
  $user = 'michael'
) {
  require ::vim::plugins

  package { 'vim-gtk': }

  file { "/home/${user}/.vim":
    ensure => 'link',
    target => '/opt/rusty-boxen/modules/vim/files/vim',
  }

  file { "/home/${user}/.vimrc":
    ensure => 'link',
    target => '/opt/rusty-boxen/modules/vim/files/vimrc',
  }
}
