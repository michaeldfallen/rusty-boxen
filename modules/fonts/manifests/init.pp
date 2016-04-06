# Installs the Powerline fonts
class fonts ( $user = 'michael' ) {
  package { 'msttcorefonts':
    ensure => installed,
  }

  $font_dir = '/opt/rusty-boxen/modules/fonts/files/fonts'

  exec { "${font_dir}/install.sh":
    cwd         => '/opt/rusty-boxen/modules/fonts/files/fonts',
    unless      =>
      '/usr/bin/test -f $HOME/.fonts/Meslo\ LG\ S\ Regular\ for\ Powerline.otf',
    environment => "HOME=/home/${user}",
    user        => $user,
  } ~> gnome::gsettings { 'rusty-mono-font':
    schema => 'org.gnome.desktop.interface',
    key    => 'monospace-font-name',
    value  => '"Meslo LG S for Powerline 12"',
  }
}
