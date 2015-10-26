class ubuntu {
  class { 'apt':
    update => {
      frequency => 'weekly',
    },
  }
  apt::ppa { 'ppa:git-core/ppa': }
}
