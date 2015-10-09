# Install rusty, to ensure our bootstrap didn't make mistakes
class rusty_boxen {

  vcsrepo { '/opt/rusty-boxen':
    ensure   => present,
    provider => git,
    source   => 'git://github.com/michaeldfallen/rusty-boxen.git'
  }

  file { '/etc/init/boxen.conf':
    ensure => 'link',
    target => '/opt/rusty-boxen/modules/auto_puppet_apply/files/upstart.conf',
    notify => Exec['initctl-reload'],
  }

  exec { 'initctl-reload':
    command     => '/sbin/initctl reload-configuration',
    refreshonly => true,
    require     => File['/etc/init/boxen.conf'],
  }
}
