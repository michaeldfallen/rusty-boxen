define ubuntu::autostart (
  $exec = $title,
  $gnome_autostart = 'true',
  $comment = '',
  $hidden = 'false',
  $owner = 'michael',
){
  require ::ubuntu::prereqs::autostart_dir

  file { "/home/${owner}/.config/autostart/${name}.desktop":
    content => template('ubuntu/autostart.desktop.erb'),
    owner  => $owner,
    group  => $owner,
  }
}
