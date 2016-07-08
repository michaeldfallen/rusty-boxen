class libs::tools::vagrant (
  $user = 'michael',
  $version = '1.8.4'
) {
  require ::libs::tools::virtualbox

  archive::download { "vagrant_${version}_x86_64.deb":
    url             => "https://releases.hashicorp.com/vagrant/${version}/vagrant_${version}_x86_64.deb",
    src_target      => '/tmp',
    digest_type     => 'sha256',
    digest_string   => 'fd38d8e00e494a617201facb42fc2cac627e5021db15e91c2a041eac6a2d8208',
    allow_redirects => true,
  }
  package { 'vagrant':
    provider => 'dpkg',
    source   => "/tmp/vagrant_${version}_x86_64.deb",
    ensure   => 'latest',
    require  => Archive::Download["vagrant_${version}_x86_64.deb"],
  }
  vagrant_plugin { [
    'vagrant-dns',
    'vagrant-cachier',
    'vagrant-hostsupdater',
  ]:
    require => Package['vagrant']
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
