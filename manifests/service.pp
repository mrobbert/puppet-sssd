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
  exec { 'sssd_group_cache':
    command     => '/usr/sbin/sss_cache -G',
    refreshonly => true,
    subscribe   => Service['sssd'],
  }
  exec { 'sssd_user_cache':
    command     => '/usr/sbin/sss_cache -U',
    refreshonly => true,
    subscribe   => Service['sssd'],
  }
}

