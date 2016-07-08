class libs::tools ( $user = 'michael' ) {
  apt::ppa { [
    'ppa:webupd8team/atom',
  ]: }
  package { [
    'atom',
    'nfs-kernel-server',
    'docker.io',
    'docker-compose',
    'ack-grep',
    'colordiff',
  ]: }
  exec { "/usr/sbin/usermod -a -G docker $user":
    unless  => "/usr/bin/groups $user | grep docker",
    require => Package['docker.io'],
  }
  include ::libs::ide::intellij
  include ::libs::ide::pycharm
  include ::libs::tools::ansible
  include ::libs::tools::terraform
  include ::libs::tools::phantomjs
  include ::libs::tools::virtualbox
  include ::libs::tools::vagrant
}
