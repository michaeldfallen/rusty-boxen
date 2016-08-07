class libs::java (
  $user = 'michael'
) {
  vcsrepo { "/home/$user/.jenv":
    ensure   => present,
    source   => 'git://github.com/gcuisinier/jenv.git',
    provider => git,
    user     => $user,
  }
  package { ['maven']: }
  java { 'openjdk-8-jdk': }
}
define java (
  $jenv_binary = "/home/michael/.jenv/bin/jenv",
  $path = "/usr/lib/jvm/${name}-amd64",
) {
  exec { "jenv_installed":
    command => '/bin/true',
    onlyif => "/usr/bin/test -e ${jenv_binary}",
  }
  exec { "$jenv_binary add $path":
    unless => "$jenv_binary list | grep $name",
    require => Exec["jenv_installed"],
  }
}
