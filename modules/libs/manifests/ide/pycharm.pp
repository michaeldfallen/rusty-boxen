class libs::ide::pycharm (
  $user = 'michael',
  $version = '5.0.3',
  $url = "https://download.jetbrains.com/python/pycharm-community-5.0.3.tar.gz",
  $build = "pycharm-community-5.0.3",
  $target = '/opt/pycharm',
  $timeout = 300,
) {
  require ::archive::prerequisites
  Exec {
    path  => [
      '/usr/local/sbin', '/usr/local/bin',
      '/usr/sbin', '/usr/bin', '/sbin', '/bin',
    ],
    user  => 'root',
    group => 'root',
  }

  archive { "pycharm-community-${version}":
    ensure     => present,
    url        => $url,
    src_target => '/var/tmp',
    target     => '/opt',
    extension  => 'tar.gz',
    checksum   => false,
    timeout    => $timeout,
  }

  file { $target:
    ensure  => link,
    target  => "/opt/${build}",
    require => Archive["pycharm-community-${version}"],
  }

  file { "/usr/share/applications/pycharm.desktop":
    source  => 'puppet:///modules/libs/pycharm.desktop',
    mode    => 644,
    require => File[$target],
  }

  file { "/home/${user}/.PyCharm50":
    ensure  => link,
    target  => '/opt/rusty-boxen/modules/libs/files/dot_pycharm',
  }
}
