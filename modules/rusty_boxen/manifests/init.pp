# Install rusty, to ensure our bootstrap didn't make mistakes
class rusty_boxen {

  zsh::path { '/opt/rusty-boxen/bin': }

  file { '/etc/init/boxen.conf':
    ensure => 'link',
    target => '/opt/rusty-boxen/modules/rusty_boxen/files/upstart.conf',
    notify => Exec['initctl-reload'],
  }

  exec { 'initctl-reload':
    command     => '/sbin/initctl reload-configuration',
    refreshonly => true,
    require     => File['/etc/init/boxen.conf'],
  }
}
