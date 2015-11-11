class ubuntu::optimus {
  package {[
    'bumblebee',
    'bumblebee-nvidia',
    'primus',
    'linux-headers-generic',
  ]: }
}
