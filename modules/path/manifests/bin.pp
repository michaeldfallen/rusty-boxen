# Adds stuff to the PATH
define path::bin (
  $owner = 'michael'
) {
  $splt = split($title, '/')
  $filename = $splt[-1]

  file { "/usr/local/bin/${filename}":
    ensure => 'link',
    target => $title,
  }
}
