class ubuntu::config {
  ::gnome::gsettings { 'sidebar-apps':
    schema => 'com.canonical.Unity.Launcher',
    key    => 'favorites',
    value  => "['application://ubiquity.desktop', 'application://org.gnome.Nautilus.desktop', 'application://google-chrome.desktop', 'application://spotify.desktop', 'application://gvim.desktop', 'unity://running-apps', 'unity://expo-icon', 'unity://devices']",
  }
}
