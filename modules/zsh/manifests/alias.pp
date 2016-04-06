define zsh::alias (
  $cmd
) {
  zsh::config { "${title} alias to ${cmd}":
    file => "alias/${title}.zsh",
    content => "alias ${title}=$'${cmd}'"
  }
}
