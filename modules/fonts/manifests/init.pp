# Installs the Powerline fonts
class fonts ( $user = 'michael' ) {
  $font_dir = '/opt/rusty-boxen/modules/fonts/files/fonts'
  exec { "${font_dir}/install.sh":
    cwd         => $font_dir,
    unless      =>
      '/bin/test -f $HOME/.fonts/Meslo\ LG\ S\ Regular\ for\ Powerline.otf',
    environment => "HOME=/home/${user}",
    user        => $user,
  }
}
