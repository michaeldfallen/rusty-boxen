class libs::ruby {
  require ::rbenv
  package { 'ruby-dev':
    ensure => present
  }
  rbenv::plugin { 'sstephenson/ruby-build': }
  rbenv::build { '2.2.2':
    global => true
  } ~> exec { 'chmod g+w /usr/local/rbenv/version': }

  zsh::path { 'rbenv.zsh':
    content => 'export PATH="/usr/local/rbenv/bin:$PATH"',
  }
  zsh::completion { 'rbenv.zsh':
    content => 'eval "$(rbenv init -)"',
  }
}
