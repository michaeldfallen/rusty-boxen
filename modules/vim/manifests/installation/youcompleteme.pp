# Custom installation for YouCompleteMe
class vim::installation::youcompleteme (
  $user = 'michael'
) {
  require ::libs::c
  require ::libs::python

  $vim = "/home/${user}/.vim"
  $ycm = "${vim}/bundle/YouCompleteMe"
  exec { "${ycm}/install.py":
    cwd         => $ycm,
    timeout     => 1800,
    refreshonly => true,
    user        => $user,
    require     => File[$vim],
  }
}
