define ubuntu::gsettings (
  $key = $name,
  $value,
  $user = 'michael',
) {
  $command = "gsettings set $key \"$value\""
  exec {"set ${key} on user ${user}":
    command     => "PID=\$(pgrep gnome-session) && export DBUS_SESSION_BUS_ADDRESS=\$(grep -z DBUS_SESSION_BUS_ADDRESS /proc/\$PID/environ|cut -d= -f2-) && ${command}",
    unless      => "gsettings get ${key} | grep -F \"${value}\"",
    logoutput   => 'on_failure',
    provider    => shell,
    user        => $user,
    group       => $user,
    environment => ['DISPLAY=:0'],
  }
}
