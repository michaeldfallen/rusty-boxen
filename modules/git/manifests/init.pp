#Install and configure git
class git (
  $user = 'michael',
  $git_username = 'Michael Allen',
  $git_email = 'michael@michaelallen.io',
) {
  apt::ppa { [
    'ppa:git-core/ppa', # Git source
  ]: }
  ensure_packages(['git'])

  exec { "/usr/bin/git config --global user.email '${git_email}'":
    require     => Package['git'],
    user        => $user,
    unless      =>
      "/bin/cat \$HOME/.gitconfig | /bin/grep 'email = ${git_email}'",
    environment => "HOME=/home/${user}"
  }
  exec { "/usr/bin/git config --global user.name '${git_username}'":
    require     => Package['git'],
    user        => $user,
    unless      =>
      "/bin/cat \$HOME/.gitconfig | /bin/grep 'name = ${git_username}'",
    environment => "HOME=/home/${user}"
  }
  exec { 'git config --global push.default simple':
    require     => Package['git'],
    user        => $user,
    unless      => '/usr/bin/git config --global push.default',
    environment => "HOME=/home/${user}",
  }

  $zsh_dir = "/home/${user}/.zsh"
  file { $zsh_dir:
    ensure => directory,
    owner  => $user,
    group  => $user,
  } ~> exec { 'git-completion.zsh':
    command => '/usr/bin/wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.zsh',
    cwd     => $zsh_dir,
    creates => "${zsh_dir}/git-completion.zsh",
    user    => $user,
  } ~> zsh::path { 'git.zsh':
    content => 'fpath=(~/.zsh $fpath)'
  }
}
