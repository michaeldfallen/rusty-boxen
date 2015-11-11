class ubuntu::prereqs::autostart_dir (
  $owner = 'michael'
) {
  file { "/home/${owner}/.config/autostart":
    ensure => 'directory',
    owner  => $owner,
    group  => $owner,
  }
}
