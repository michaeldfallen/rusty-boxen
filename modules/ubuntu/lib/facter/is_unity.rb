# has_optimus.rb

Facter.add('is_unity') do
  setcode do
    de = Facter::Core::Execution.exec("echo $DESKTOP_SESSION")
    de.eq? 'ubuntu'
  end
end

