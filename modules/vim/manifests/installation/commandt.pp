class vim::installation::commandt {
  require ::libs::ruby
  exec { '/opt/rusty-boxen/modules/vim/files/install_commandt.sh':
    user  => 'michael',
    group => 'michael'
  }
}
