class ubuntu::theme {
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
}
