# Adds custom apt sources
class ubuntu::sources {
  apt::ppa { [
    'ppa:git-core/ppa', # Git source
    'ppa:nilarimogard/webupd8',
    #    'ppa:nvbn-rm/ppa', # Everpad source (evernote alt) unavailable on wily
  ]: }

  apt::source { 'arc-theme':
    location => 'http://download.opensuse.org/repositories/home:/Horst3180/xUbuntu_15.10/',
    release  => '/',
    repos    => ' ',
    key      => {
      'id'     => 'D0E482AB5DA85265F9DEBAE55A7D1D38BEB6D886',
      'source' => 'http://download.opensuse.org/repositories/home:Horst3180/xUbuntu_15.10/Release.key'
    }
  }

  apt::source { 'spotify':
    location => 'http://repository.spotify.com',
    release  => 'stable',
    repos    => 'non-free',
    key      => {
      'id'     => 'BBEBDCB318AD50EC6865090613B00F1FD2C19886',
      'server' => 'keyserver.ubuntu.com',
    },
  }

  apt::source { 'google-chrome':
    location => 'http://dl.google.com/linux/chrome/deb/',
    release  => 'stable',
    repos    => 'main',
    key      => {
      'id'     => '4CCA1EAF950CEE4AB83976DCA040830F7FAC5991',
      'source' => 'https://dl-ssl.google.com/linux/linux_signing_key.pub',
    },
  }
}
