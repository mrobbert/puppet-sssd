##
# Class sssd::service - Configures the SSSD service
class sssd::service {
  service { 'sssd':
    ensure     => running,
    name       => $sssd::params::service_name,
    hasstatus  => true,
    hasrestart => true,
    enable     => true,
    require    => Class['sssd::install'],
  }
  if ($::osfamily == Redhat) {
    service { 'oddjobd':
      ensure      => running,
      hasstatus   => true,
      hasrestart  => true,
      enable      => true,
      require     => Class['sssd::install'],
    }
  }
  if ($::has_sss_cache == true) {
    exec { 'sss_cache':
      command     => '/usr/sbin/sss_cache -UGNSA',
      refreshonly => true,
      before      => Service['sssd'],
      subscribe   => File['/etc/sssd/sssd.conf'],
    }
  } else {
    exec { 'rm_cache':
      command     => '/bin/rm -f /var/lib/sss/db/*',
      refreshonly => true,
      before      => Service['sssd'],
      subscribe   => File['/etc/sssd/sssd.conf'],
    }
  }
}

