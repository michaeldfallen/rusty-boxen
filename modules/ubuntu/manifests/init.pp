# Configure ubuntu specific stuff
class ubuntu {
  class { 'apt':
    update => {
      frequency => 'weekly',
    },
  }

  include ::ubuntu::config
  include ::ubuntu::apps
  include ::ubuntu::optimus
  include ::ubuntu::steam
  include ::ubuntu::sources
}
