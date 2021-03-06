# Sets up my preferred Zsh
class zsh (
    $user = 'michael',
    $path='/usr/bin/zsh'
) {
  package { ['zsh', 'tilda']:
    ensure => present,
  }

  ::ubuntu::autostart { 'tilda':
    exec => 'tilda -h'
  }

  exec { "/usr/bin/chsh -s ${path} ${user}":
    unless => "/bin/grep -E '^${user}.+:${path}$' /etc/passwd",
  }

  if $user != 'root' {
    file { "/home/${user}/.zshrc":
      ensure => 'link',
      target => '/opt/rusty-boxen/modules/zsh/files/zshrc',
      owner  => $user,
      group  => $user,
    }

    file { ["/home/${user}/.config", "/home/${user}/.config/tilda"]:
      ensure => 'directory',
      owner  => $user,
      group  => $user,
    } ~>
    file { "/home/${user}/.config/tilda/config_0":
      ensure => 'link',
      target => '/opt/rusty-boxen/modules/zsh/files/tilda_config',
      owner  => $user,
      group  => $user,
    }

    file { "/home/${user}/.zshrc.d":
      ensure => 'directory',
      owner  => $user,
      group  => $user,
    }

    file { [
      "/home/${user}/.zshrc.d/path",
      "/home/${user}/.zshrc.d/completion",
      "/home/${user}/.zshrc.d/alias",
    ]:
      ensure => 'directory',
      owner  => $user,
      group  => $user,
      require => File["/home/${user}/.zshrc.d"],
    }
  }
}
