# Defines a new zsh config file that will be picked up by zshrc
define zsh::config (
  $source,
  $name = $title,
  $owner = 'michael'
) {
  require ::zsh

  file { "${title} zsh config":
    path   => "/home/${owner}/.zshrc.d/config_${name}",
    source => $source,
  }
}
