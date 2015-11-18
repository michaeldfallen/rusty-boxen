# Install apps
class ubuntu::apps {
  package { 'plaidchat':
    provider => 'npm',
    require => Package['nodejs']
  }
  file { '/usr/share/applications/slack.desktop':
    ensure => link,
    target => '/opt/rusty-boxen/modules/ubuntu/files/slack.desktop',
  }

  package { [
    'xchat',
    'spotify-client',
    'google-chrome-stable',
    'caffeine',
    'gconf-editor',
    'dconf-editor',
    'pulseaudio-equalizer',
    'indicator-multiload',
  ]: }

  package { 'libgcrypt11':
    source   => '/opt/rusty-boxen/modules/ubuntu/files/libgcrypt11.deb',
    provider => 'dpkg',
  }

  apt::ppa { [
    'ppa:nilarimogard/webupd8',
  ]: }

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
  ::ubuntu::autostart { 'caffeine-indicator': }
}
