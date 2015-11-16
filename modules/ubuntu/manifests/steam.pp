class ubuntu::steam {
  $selections = '/opt/rusty-boxen/modules/ubuntu/files/steam.selections'
  exec { "/usr/bin/debconf-set-selections < $selections":
    unless => "/usr/bin/debconf-get-selections | grep \"$(cat $selections)\""
  } ~>
  package { "steam-launcher":
    provider => dpkg,
    source   => "/opt/rusty-boxen/modules/ubuntu/files/steam.deb"
  }
}
