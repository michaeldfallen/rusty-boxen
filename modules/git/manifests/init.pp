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
  file { "/home/${user}/.zsh/_git":
    source => 'https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.zsh',
    owner  => $user,
    group  => $user,
  } ~> zsh::path { 'git.zsh':
    content => 'fpath=(~/.zsh $fpath)'
  }
}
