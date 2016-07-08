class libs::tools::virtualbox (
  $version = '5.0.24',
  $build = '108355',
) {
  archive::download { "virtualbox.deb":
    url             => "http://download.virtualbox.org/virtualbox/${version}/virtualbox-5.0_${version}-${build}~Ubuntu~wily_amd64.deb",
    src_target      => '/tmp',
    digest_type     => 'sha256',
    digest_string   => '9a4a29a5208ee434a21e84dbd2d834923b3b5a9489a37d515f4c05ec9fad4869',
    allow_redirects => true,
  }
  package { 'virtualbox':
    provider => 'dpkg',
    source   => "/tmp/virtualbox.deb",
    ensure   => 'latest',
    require  => Archive::Download['virtualbox.deb'],
  }
  package { 'virtualbox-dkms': }
}
