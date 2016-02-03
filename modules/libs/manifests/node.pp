# Install nodejs and npm
class libs::node ( $user='michael' ) {
  package {
    ['nodejs', 'npm']:
  } ~> file { '/usr/bin/node':
    ensure => 'link',
    target => '/usr/bin/nodejs',
  }
  file { "/home/${user}/.npm_packages":
    ensure => directory,
    owner  => $user,
    group  => $user,
  }
  file { "/home/${user}/.npmrc":
    ensure => link,
    target => '/opt/rusty-boxen/modules/libs/files/dot_npmrc',
  }
  zsh::path { 'npm_binaries.zsh':
    content => 'PATH="$HOME/.npm_packages/bin:$PATH"',
  }
  zsh::path { 'npm_mans.zsh':
    content => 'MANPATH="$HOME/.npm_packages/share/man:$(manpath)"'
  }
}
