# has_alsa_audio_bug.rb

Facter.add('has_alsa_audio_bug') do
  setcode do
    broadwell_audio = Facter::Core::Execution.exec("lspci | grep 'Broadwell-U Audio Controller'")
    not broadwell_audio.empty?
  end
end

