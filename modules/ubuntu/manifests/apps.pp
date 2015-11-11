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
  ]: }

  ::ubuntu::autostart { 'caffeine-indicator': }
}
