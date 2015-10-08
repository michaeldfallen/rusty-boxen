# Ensures puppet apply is run on boot
class auto_puppet_apply {

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
