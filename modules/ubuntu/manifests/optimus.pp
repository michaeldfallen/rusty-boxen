class ubuntu::optimus {
  package { [
    'nvidia-352',
    'nvidia-prime',
  ]: } ~>
  package {[
    'bumblebee',
    'primus',
    'linux-headers-generic',
    'mesa-utils',
  ]: } ~>
  exec {[
    "/bin/sed -i 's/^Driver=$/Driver=nvidia/' /etc/bumblebee/bumblebee.conf",
    "/bin/sed -i 's/nvidia-current/nvidia-352/' /etc/bumblebee/bumblebee.conf",
  ]:
    unless => 'grep "KernelDriver=nvidia-352" /etc/bumblebee/bumblebee.conf'
  }
  exec { 'make -f Makefile.dkms':
    cwd => '/opt/rusty-boxen/modules/ubuntu/files/bbswitch',
    unless => 'test -d /usr/src/bbswitch-0.8',
  }
}
