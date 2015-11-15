class ubuntu::config {
  ::ubuntu::gsettings { 'org.gnome.desktop.interface gtk-theme':
    value => 'Arc-Darker',
  }
  ::ubuntu::gsettings { 'com.canonical.Unity.Launcher favorites':
    value  => "['application://ubiquity.desktop', 'application://org.gnome.Nautilus.desktop', 'application://google-chrome.desktop', 'application://spotify.desktop', 'application://gvim.desktop', 'application://slack.desktop', 'application://steam.desktop', 'unity://running-apps', 'unity://expo-icon', 'unity://devices']",
  }
}
