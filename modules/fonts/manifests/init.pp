# Installs the Powerline fonts
class fonts ( $user = 'michael' ) {
  $preferred_font = 'Meslo LG S for Powerline 12'
  $mono_font = 'org.gnome.desktop.interface monospace-font-name'
  $current = "/usr/bin/gsettings get ${mono_font}"
  $set_font = "/usr/bin/gsettings set ${mono_font} \"${preferred_font}\""
  $font_dir = '/opt/rusty-boxen/modules/fonts/files/fonts'

  exec { "${font_dir}/install.sh":
    cwd         => $font_dir,
    unless      =>
      '/usr/bin/test -f $HOME/.fonts/Meslo\ LG\ S\ Regular\ for\ Powerline.otf',
    environment => "HOME=/home/${user}",
    user        => $user,
  } ~> exec { $set_font:
    unless      => "/usr/bin/test \"$(${current})\" -e \"${preferred_font}\"",
    environment => "HOME=/home/${user}",
    user        => $user,
  }
}
