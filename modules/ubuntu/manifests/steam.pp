class ubuntu::steam {
  $selections = '/opt/rusty-boxen/modules/ubuntu/files/steam.selections'
  exec { "/usr/bin/debconf-set-selections < $selections": } ~>
  package { "steam":
    provider => dpkg,
    source   => "/opt/rusty-boxen/modules/ubuntu/files/steam.deb"
  }
}
