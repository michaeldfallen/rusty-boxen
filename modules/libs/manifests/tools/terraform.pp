class libs::tools::terraform (
  $version = '0.6.11',
  $arch    = 'amd64'
) {
  require ::archive::prerequisites

  $extension = "zip"
  $package = "terraform_${version}_linux_${arch}"
  $hashi_url = 'https://releases.hashicorp.com/terraform'

  archive { $package:
    ensure        => present,
    url           => "${hashi_url}/${version}/${package}.${extension}",
    extension     => $extension,
    target        => '/opt',
    root_dir      => 'terraform',
    digest_string => 'f451411db521fc4d22c9fe0c80105cf028eb8df0639bac7c1e781880353d9a5f',
    digest_type   => 'sha256',
  }
  ::zsh::path { 'terraform.zsh':
    content => 'export PATH="/opt/terraform/:$PATH"',
  }
}
