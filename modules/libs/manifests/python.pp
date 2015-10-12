# Install development libs for Python
class libs::python {
  package { 'python-dev':
    ensure => installed
  }
}
