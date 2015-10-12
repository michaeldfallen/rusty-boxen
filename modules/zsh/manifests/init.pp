# Sets up my preferred Zsh
class zsh (
    $user = 'michael',
    $path='/usr/bin/zsh'
) {
  package { ['zsh', 'tilda']:
    ensure => present,
  }

  exec { "/usr/bin/chsh -s ${path} ${user}":
    unless => "/bin/grep -E '^${user}.+:${path}$' /etc/passwd",
  }

  if $user != 'root' {
    file { "/home/${user}/.zshrc":
      ensure => 'file',
      source => 'puppet:///modules/zsh/zshrc',
      owner  => $user,
      group  => $user,
    }

    file { "/home/${user}/.zshrc.d":
      ensure => 'directory',
      owner  => $user,
      group  => $user,
    }

    file { "/home/${user}/.zshrc.d/path":
      ensure => 'directory',
      owner  => $user,
      group  => $user,
    }

    file { "/home/${user}/.zshrc.d/completion":
      ensure => 'directory',
      owner  => $user,
      group  => $user,
    }
  }
}
