define zsh::alias (
  $cmd
) {
  zsh::config { "${title} alias to ${cmd}":
    file => "alias/${title}",
    content => "alias ${title} = '${cmd}'"
  }
}
