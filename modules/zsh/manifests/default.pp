# My default Zsh config
class zsh::default {
  require ::zsh

  zsh::config { 'basic_opts.zsh':
    source => 'puppet:///modules/zsh/basic_opts.zsh',
  }

  zsh::config { 'prompt.zsh':
    source => 'puppet:///modules/zsh/prompt.zsh',
  }

  zsh::config { 'window.zsh':
    source => 'puppet:///modules/zsh/window.zsh',
  }

  zsh::completion { 'case-insensitive.zsh':
    content => "zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'"
  }
}
