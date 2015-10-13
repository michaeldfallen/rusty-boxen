#Install and configure git
class git (
  $user = 'michael',
  $git_username = 'Michael Allen',
  $git_email = 'michael@michaelallen.io',
) {
  package { 'git':
    ensure => present
  }
  $config = [
    "/usr/bin/git config --global user.name '${git_username}'",
    "/usr/bin/git config --global user.email '${git_email}'",
  ]
  exec { $config:
    require     => Package['git'],
    user        => $user,
    environment => "HOME=/home/${user}"
  }

  $zsh_dir = "/home/${user}/.zsh"
  file { $zsh_dir:
    ensure => directory,
    owner  => $user,
    group  => $user,
  } ~> exec { 'git-completion.zsh':
    command => 'wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.zsh',
    cwd     => $zsh_dir,
    creates => "${zsh_dir}/git-completion.zsh",
    user    => $user,
  } ~> zsh::path { 'git.zsh':
    content => 'fpath=(~/.zsh $fpath)'
  }
}
