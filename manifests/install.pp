##
# Class sssd::install - Installs the SSSD package
class sssd::install {
  package { 'sssd':
    ensure => present,
    name   => $sssd::params::package_name,
  }
  package { 'libpam-mkhomedir':
    ensure  => present,
    name    => $sssd::params::mkhomedir_name,
  }
}
