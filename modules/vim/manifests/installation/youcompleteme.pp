# Custom installation for YouCompleteMe
class vim::installation::youcompleteme (
  $user = 'michael'
) {
  require ::libs::c
  require ::libs::python

  $vim = "/home/${user}/.vim"
  $ycm = "${vim}/bundle/YouCompleteMe"
  exec { "${ycm}/install.py":
    cwd     => $ycm,
    timeout => 1800,
    unless  => "/usr/bin/test -f ${ycm}/third_party/ycmd/ycm_core.so",
    user    => $user,
    require => File[$vim],
  }
}
