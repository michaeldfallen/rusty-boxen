# Custom installation for YouCompleteMe
class vim::installation::youcompleteme (
  $user = 'michael'
) {
  require ::libs::c
  require ::libs::python

  $ycm = "/home/${user}/.vim/YouCompleteMe"
  exec { "${ycm}/install.py --clang-completer":
    cwd         => $ycm,
    subscribe   => Vcsrepo[$ycm],
    refreshonly => true,
    require     => Vcsrepo[$ycm],
  }
}
