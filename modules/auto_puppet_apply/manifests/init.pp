# Ensures puppet apply is run on boot
class auto_puppet_apply {

  file { '/etc/init/boxen.conf':
    ensure => 'link',
    target => "puppet:///modules/${module_name}/upstart.conf",
  }
}
