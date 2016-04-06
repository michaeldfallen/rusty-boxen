# Install development libs for Python
class libs::python ( $user = 'michael' ) {
  package { [
    'python-dev',
    'python3-dev',
    'python2.7',
    'python-pip',
    'python3-pip',
    'python3.5',
  ]:
    ensure => installed
  }
  pip3_package { [
    'rope',
    'pep8',
    'flake8',
    'virtualenv',
    'virtualenvwrapper'
  ]: }
  zsh::config { 'virtualenvwrapper.zsh':
    target => '/opt/rusty-boxen/modules/libs/files/virtualenvwrapper.zsh',
  }
  file { "/home/$user/.virtualenvs":
    ensure => 'directory',
    owner => $user,
    group => $user,
  }
  exec { "/usr/sbin/usermod -a -G adm $user":
    unless => "/usr/bin/groups $user | grep adm",
  }
}
define pip3_package () {
  exec { "/usr/local/bin/pip3 install $name":
    unless => "/usr/local/bin/pip3 list | grep $name",
    require => Package['python3-pip']
  }
}
