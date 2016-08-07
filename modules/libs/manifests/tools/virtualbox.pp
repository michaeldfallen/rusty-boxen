class libs::tools::virtualbox (
  $version = '5.0.26',
  $build = '108824',
  $digest = '8fe330e675233249771fe8e2aa7421ac1f12af3038bd742f69ac16830d64b889',
) {
  archive::download { "virtualbox-${version}.deb":
    url             => "http://download.virtualbox.org/virtualbox/${version}/virtualbox-5.0_${version}-${build}~Ubuntu~wily_amd64.deb",
    src_target      => '/tmp',
    digest_type     => 'sha256',
    digest_string   => "${digest}",
    allow_redirects => true,
  }
  package { "virtualbox-${version}":
    provider => 'dpkg',
    source   => "/tmp/virtualbox-${version}.deb",
    ensure   => 'latest',
    require  => Archive::Download["virtualbox-${version}.deb"],
  }
}
