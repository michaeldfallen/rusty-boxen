# Install developement libs for C
class libs::c {
  package { ['build-essential', 'cmake']:
    ensure => installed
  }
}
