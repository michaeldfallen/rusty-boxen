# Install nodejs and npm
class libs::node ( $user='michael' ) {
  vcsrepo { "/home/${user}/.nvm":
    ensure   => latest,
    provider => git,
    source   => 'git://github.com/creationix/nvm',
    owner    => $user,
    group    => $user,
  }
  zsh::config { 'nvm.zsh':
    content => 'NVM_DIR="$HOME/.nvm"; [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"',
  }
}
