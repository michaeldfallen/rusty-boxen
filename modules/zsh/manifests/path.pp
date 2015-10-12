# Adds stuff to the zsh PATH
define zsh::path () {
  $filename = regsubst($title, '/', '_', 'G')
  zsh::config { "${title} path":
    file    => "path/${filename}.zsh",
    content => "export PATH=\"${title}/bin:\$PATH\"",
  }
}
