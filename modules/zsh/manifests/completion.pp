# Defines a zsh completion that adds tab completion
define zsh::completion (
  $content = undef,
  $source = undef,
  $file = $title,
) {
  zsh::config { "${title} completion":
    file    => "completion/${file}",
    source  => $source,
    content => $content,
  }
}
