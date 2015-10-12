# Defines a new zsh config file that will be picked up by zshrc
define zsh::config (
  $content = undef,
  $source = undef,
  $file = $title,
  $owner = 'michael'
) {
  require ::zsh

  file { "${title} zsh config":
    path    => "/home/${owner}/.zshrc.d/${file}",
    source  => $source,
    content => $content,
    owner   => $owner,
    group   => $owner,
  }
}
