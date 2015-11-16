class vim::installation::commandt {
  require ::libs::ruby
  exec { '/opt/rusty-boxen/modules/vim/files/install_commandt.sh':
    unless => '/bin/ls /opt/rusty-boxen/modules/vim/files/vim/bundle/Command-T/command-t.vba',
    user  => 'michael',
    group => 'michael'
  }
}
