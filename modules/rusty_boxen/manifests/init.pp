# Install rusty, to ensure our bootstrap didn't make mistakes
class rusty_boxen {
  path::bin { '/opt/rusty-boxen/bin/rusty': }

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

  exec { "/bin/sed -i 's/ errors=remount-ro/ discard,noatime,errors=remount-ro/' /etc/fstab":
    unless => 'grep "discard,noatime,errors=remount-ro" /etc/fstab'
  }

  file { '/etc/udev/rules.d/60-schedulers.rules':
    ensure => 'link',
    target => '/opt/rusty-boxen/modules/rusty_boxen/files/schedulers.rules',
  }
}
