# My default Zsh config
class zsh::default {
  require ::zsh

  zsh::config { 'basic_opts.zsh':
    target => '/opt/rusty-boxen/modules/zsh/files/basic_opts.zsh',
  }

  zsh::config { 'prompt.zsh':
    target => '/opt/rusty-boxen/modules/zsh/files/prompt.zsh',
  }

  zsh::config { 'window.zsh':
    target => '/opt/rusty-boxen/modules/zsh/files/window.zsh',
  }

  zsh::completion { 'case-insensitive.zsh':
    content => "zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'"
  }
}
