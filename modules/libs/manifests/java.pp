class libs::java (
  $user = 'michael'
) {
  vcsrepo { "/home/$user/.jenv":
    ensure   => present,
    source   => 'git://github.com/gcuisinier/jenv.git',
    provider => git,
    user     => $user,
  }
  package { ['openjdk-8-jdk']: }
}
define jenv_version (
  $jenv_binary = '/usr/local/jenv/bin/jenv',
) {
  exec { "$jenv_binary add $name":
    unless => "$jenv_binary list | grep $name",
    require => File[$jenv_binary],
  }
}
