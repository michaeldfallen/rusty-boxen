# Installs the Powerline fonts
class fonts ( $user = 'michael' ) {
  exec { './install.sh':
    cwd         => '/opt/rusty-boxen/modules/fonts/files/fonts',
    unless      =>
      '/bin/test -f $HOME/.fonts/Meslo\ LG\ S\ Regular\ for\ Powerline.otf',
    environment => "HOME=/home/${user}",
    user        => $user,
  }
}
