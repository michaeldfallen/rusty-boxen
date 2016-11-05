class libs::tools::terraform (
  $version = '0.7.8',
  $arch    = 'amd64',
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
    digest_string => 'b3394910c6a1069882f39ad590eead0414d34d5bd73d4d47fa44e66f53454b5a',
    digest_type   => 'sha256',
  }
  ::zsh::path { 'terraform.zsh':
    content => 'export PATH="/opt/terraform/:$PATH"',
  }
}
