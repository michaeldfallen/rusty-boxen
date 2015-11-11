# Install apps
class ubuntu::apps {
  require ::libs::node

  package { 'plaidchat':
    provider => 'npm'
  }
  package { [
    'spotify-client',
    # 'everpad', # unavailable on wily
    'google-chrome-stable',
    'caffeine',
    'gconf-editor',
    'dconf-editor',
    'pulseaudio-equalizer',
  ]: }

  package { 'libgcrypt11':
    source   => '/opt/rusty-boxen/modules/ubuntu/files/libgcrypt11.deb',
    provider => 'dpkg',
  }

  ::ubuntu::autostart { 'caffeine-indicator': }
}
