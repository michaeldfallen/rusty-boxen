# Installs the Powerline fonts
class fonts ( $user = 'michael' ) {
  $preferred_font = 'Meslo LG S Regular for Powerline 14'
  $current = 'gsettings get org.gnome.desktop.interface monospace-font-name'
  $set_font = 'gsettings set org.gnome.desktop.interface monospace-font-name'
  $font_dir = '/opt/rusty-boxen/modules/fonts/files/fonts'

  exec { "${font_dir}/install.sh":
    cwd         => $font_dir,
    unless      =>
      '/usr/bin/test -f $HOME/.fonts/Meslo\ LG\ S\ Regular\ for\ Powerline.otf',
    environment => "HOME=/home/${user}",
    user        => $user,
  } ~> exec { "${set_font} \"${preferred_font}\"":
    unless      => "/usr/bin/test \"$(${current})\" -e \"${preferred_font}\"",
    environment => "HOME=/home/${user}",
    user        => $user,
  }
}
