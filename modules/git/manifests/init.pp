#Install and configure git
class git {
  package { 'git':
    ensure => present
  }
  $config = [
    '/usr/bin/git config --global user.name "Michael Allen"',
    '/usr/bin/git config --global user.email "michael@michaelallen.io"'
  ]
  exec { $config:
    require => Package['git']
  }
}
