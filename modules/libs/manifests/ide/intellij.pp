class libs::ide::intellij (
  $version = '2016.1.2b',
  $tuxjdk = 'jdk-8u25-tuxjdk-b01',
  $user = 'michael',
) {
  class { 'archive::prerequisites':
  } ->
  archive { "idea-${version}":
    ensure           => present,
    url              => "http://download.jetbrains.com/idea/ideaIC-${version}.tar.gz",
    checksum         => false,
    src_target       => '/var/tmp',
    target           => '/opt',
    extension        => 'tar.gz',
    timeout          => 300,
    strip_components => 1,
  }
  archive { $tuxjdk:
    ensure           => present,
    url              => "https://googledrive.com/host/0B68yuEpDuq6waUl5UjNTUWRlYTQ/${tuxjdk}.tar.xz",
    checksum         => false,
    src_target       => '/var/tmp',
    target           => '/usr/lib/jvm',
    extension        => 'tar.xz',
    timeout          => 300,
    strip_components => 1,
  }
  file { "/home/${user}/.local/share/applications/intellij.desktop":
    content => template('libs/intellij.desktop.erb'),
    owner   => $user,
    group   => $user,
    mode    => 774,
  }
  file { "/home/${user}/.IdeaIC2016.1":
    ensure => link,
    target => '/opt/rusty-boxen/modules/libs/files/dot_idea',
  }
}
