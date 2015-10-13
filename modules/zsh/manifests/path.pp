# Defines a zsh path file that adds stuff to the path
define zsh::path (
  $content = undef,
  $source = undef,
  $file = $title,
) {
  zsh::config { "${title} path":
    file    => "path/${file}",
    source  => $source,
    content => $content,
  }
}

