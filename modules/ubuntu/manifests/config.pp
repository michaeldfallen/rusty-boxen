class ubuntu::config {
  apt::source { 'arc-theme':
    location => 'http://download.opensuse.org/repositories/home:/Horst3180/xUbuntu_15.10/',
    release  => '/',
    repos    => ' ',
    key      => {
      'id'     => 'D0E482AB5DA85265F9DEBAE55A7D1D38BEB6D886',
      'source' => 'http://download.opensuse.org/repositories/home:Horst3180/xUbuntu_15.10/Release.key'
    }
  } ~>
  package { 'arc-theme': } ~>
  ::ubuntu::gsettings { 'org.gnome.desktop.interface gtk-theme':
    value => 'Arc-Darker',
  }
  ::ubuntu::gsettings { 'com.canonical.Unity.Launcher favorites':
    value  => "['application://ubiquity.desktop', 'application://org.gnome.Nautilus.desktop', 'application://google-chrome.desktop', 'application://spotify.desktop', 'application://gvim.desktop', 'application://slack.desktop', 'application://steam.desktop', 'unity://running-apps', 'unity://expo-icon', 'unity://devices']",
  }
  ::ubuntu::gsettings {
    'com.canonical.Unity.Lenses remote-content-search': value => 'none'
  }
  ::ubuntu::gsettings {
    'com.canonical.indicator.datetime show-day': value => 'true'
  }
  ::ubuntu::gsettings {
    'com.canonical.indicator.datetime show-date': value => 'true'
  }
  ::ubuntu::gsettings {
    'org.compiz.core:/org/compiz/profiles/unity/plugins/core/ vsize': value => '2'
  }
  ::ubuntu::gsettings {
    'org.compiz.core:/org/compiz/profiles/unity/plugins/core/ hsize': value => '2'
  }
  ::ubuntu::gsettings {
    'org.compiz.scale:/org/compiz/profiles/unity/plugins/scale/ overlay-icon': value => '1'
  }
  ::ubuntu::gsettings {
    'org.gnome.desktop.peripherals.mouse speed': value => '-0.55'
  }
  ::ubuntu::gsettings {
    'org.compiz.unityshell:/org/compiz/profiles/unity/plugins/unityshell/ alt-tab-bias-viewport':
      value => 'false'
  }
  exec { '/bin/sed -i "s/^exit 0$/echo disable > \\/proc\\/acpi\\/ibm\\/bluetooth\nexit 0/" /etc/rc.local':
    unless => 'grep "echo disable > /proc/acpi/ibm/bluetooth" /etc/rc.local',
  }
  file { '/etc/lightdm/lightdm.conf':
    ensure => link,
    target => '/opt/rusty-boxen/modules/ubuntu/files/lightdm.conf',
  }
  file { '/home/michael/.local/share/mimeapps.list':
    ensure => link,
    target => '/opt/rusty-boxen/modules/ubuntu/files/app_defaults.conf',
  }
}
