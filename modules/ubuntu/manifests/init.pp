# Configure ubuntu specific stuff
class ubuntu {
  class { 'apt':
    update => {
      frequency => 'weekly',
    },
  }

  ::ubuntu::gsettings {
    'org.gnome.desktop.input-sources xkb-options': value => "['caps:escape']",
  }

  include ::ubuntu::theme
  include ::ubuntu::apps

  if str2bool("$is_unity") {
    include ::ubuntu::config
  }
  if str2bool("$has_optimus") {
    include ::ubuntu::optimus
  }
  include ::ubuntu::steam
  if str2bool("$has_alsa_audio_bug") {
    include ::ubuntu::alsa
  }
  include ::ubuntu::background
}
