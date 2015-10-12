# Adds stuff to the zsh PATH
define zsh::path (
  $owner = 'michael'
) {
  $splt = split($title, '/')
  $filename = $splt[-1]

  file { "/usr/local/bin/${filename}":
    ensure => 'link',
    target => $title,
  }
}
