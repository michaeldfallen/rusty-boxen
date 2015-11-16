class ubuntu::config {
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
}
