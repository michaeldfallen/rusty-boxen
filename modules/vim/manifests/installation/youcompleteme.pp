# Custom installation for YouCompleteMe
class vim::installation::youcompleteme (
  $user = 'michael'
) {
  require ::libs::c
  require ::libs::python

  $ycm = "/home/${user}/.vim/bundle/YouCompleteMe"
  exec { "${ycm}/install.py":
    cwd         => $ycm,
    timeout     => 1800,
    subscribe   => Vcsrepo[$ycm],
    refreshonly => true,
    user        => $user,
    require     => Vcsrepo[$ycm],
  }
}
