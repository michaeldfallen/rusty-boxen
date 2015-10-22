class libs::ruby {
  require ::rbenv
  package { 'ruby-dev':
    ensure => present
  }
  exec { 'chmod g+w /usr/local/rbenv/version': }
  rbenv::plugin { 'sstephenson/ruby-build': }
  rbenv::build { '2.2.2': global => true }

  zsh::path { 'rbenv.zsh':
    content => 'export PATH="/usr/local/rbenv/bin:$PATH"',
  }
  zsh::completion { 'rbenv.zsh':
    content => 'eval "$(rbenv init -)"',
  }
}
