# Defines a zsh completion that adds tab completion
define zsh::completion (
  $content = undef,
  $source = undef,
  $name = $title,
  $owner = 'michael'
) {
  zsh::config { "${title} completion":
    name    => "completion/${name}",
    source  => $source,
    content => $content,
  }
}
