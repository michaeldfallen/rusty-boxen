# Configure ubuntu specific stuff
class ubuntu {
  class { 'apt':
    update => {
      frequency => 'weekly',
    },
  }

  include ::ubuntu::config
  include ::ubuntu::apps
  if str2bool("$has_optimus") {
    include ::ubuntu::optimus
  }
  include ::ubuntu::steam
  if str2bool("$has_alsa_audio_bug") {
    include ::ubuntu::alsa
  }
  include ::ubuntu::background
}
