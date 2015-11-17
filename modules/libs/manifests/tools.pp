class libs::tools {
  apt::ppa { [
    'ppa:webupd8team/atom',
  ]: }
  package { [
    'virtualbox',
    'vagrant',
    'virtualbox-dkms',
    'atom',
    'nfs-kernel-server',
  ]: }
  vagrant_plugin { [
    'vagrant-dns',
    'vagrant-cachier'
  ]: }
}

define vagrant_plugin ( $user = 'michael' ){
  exec { "vagrant plugin install $name":
    unless      => "vagrant plugin list | grep $name",
    user        => $user,
    group       => $user,
    environment => [ "HOME=/home/$user" ],
    require     => Package['vagrant']
  }
}
