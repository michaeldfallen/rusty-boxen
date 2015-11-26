# Deactivates Linux 4.2.x. Fix documented here: https://bugzilla.suse.com/show_bug.cgi?id=943982#c8
class ubuntu::alsa {
  file { '/lib/firmware/alsa':
    ensure => directory,
    owner  => 'root',
    group  => 'root',
  }
  file { '/lib/firmware/alsa/disable_power_save':
    source  => 'puppet:///modules/ubuntu/alsa_firmware',
    owner   => 'root',
    group   => 'root',
    require => File['/lib/firmware/alsa'],
  }
  file { '/etc/modprobe.d/50-hda.conf':
    source => 'puppet:///modules/ubuntu/modprobe_hda.conf',
    owner  => 'root',
    group  => 'root',
  }
}
