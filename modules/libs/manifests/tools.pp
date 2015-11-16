class libs::tools {
  apt::ppa { [
    'ppa:webupd8team/atom',
  ]: }
  package { [
    'virtualbox',
    'vagrant',
    'virtualbox-dkms',
    'atom',
  ]: }
}
