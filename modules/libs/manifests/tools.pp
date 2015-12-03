class libs::tools ( $user = 'michael' ) {
  apt::ppa { [
    'ppa:webupd8team/atom',
  ]: }
  package { [
    'virtualbox',
    'vagrant',
    'virtualbox-dkms',
    'atom',
    'nfs-kernel-server',
    'docker.io',
    'docker-compose',
    'ack-grep',
  ]: }
  vagrant_plugin { [
    'vagrant-dns',
    'vagrant-cachier',
    'vagrant-hostsupdater',
  ]: }
  exec { "/usr/sbin/usermod -a -G docker $user":
    unless  => "/usr/bin/groups $user | grep docker",
    require => Package['docker.io'],
  }
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
