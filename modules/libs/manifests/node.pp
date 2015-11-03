# Install nodejs and npm
class libs::node {
  package {
    ['nodejs', 'npm']:
  } ~> file { '/usr/bin/node':
    ensure => 'link',
    target => '/usr/bin/nodejs',
  }
}
