# My default Zsh config
class zsh::default {
  require ::zsh

  zsh::config { 'basic options':
    name   => 'basic_opts.zsh',
    source => 'puppet:///modules/zsh/basic_opts.zsh',
  }

  zsh::config { 'prompt':
    name   => 'prompt.zsh',
    source => 'puppet:///modules/zsh/prompt.zsh',
  }

  zsh::config { 'window title':
    name   => 'window.zsh',
    source => 'puppet:///modules/zsh/window.zsh',
  }
}
