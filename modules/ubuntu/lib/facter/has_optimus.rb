# has_optimus.rb

Facter.add('has_optimus') do
  setcode do
    nvidia_hardware = Facter::Core::Execution.exec("lspci | grep 'NVIDIA'")
    not nvidia_hardware.empty?
  end
end
