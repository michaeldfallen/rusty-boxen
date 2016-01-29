class libs::tools::ansible {
  apt::ppa { 'ppa:ansible/ansible': }
  package { 'ansible': }
}
