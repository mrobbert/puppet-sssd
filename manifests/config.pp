##
# Class sssd::config - Configures the SSSD package
class sssd::config {
  File {
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    require => Class['sssd::install'],
    notify  => Class['sssd::service'],
  }
  file { '/etc/nsswitch.conf':
    content => template('sssd/nsswitch.conf.erb'),
  }

  file { '/etc/sssd/sssd.conf':
    mode    => '0600',
    content => template('sssd/sssd.conf.erb'),
  }

  case $::osfamily {
    /RedHat/: {
      file { '/etc/pam.d/system-auth-ac':
        content => template('sssd/system-auth-ac.erb'),
      }
      file { '/etc/pam.d/system-auth':
        ensure  => link,
        target  => '/etc/pam.d/system-auth-ac',
      }
      file { '/etc/pam.d/password-auth-ac':
        content => template('sssd/password-auth-ac.erb'),
      }
      file { '/etc/pam.d/password-auth':
        ensure  => link,
        target  => '/etc/pam.d/password-auth-ac',
      }
    }
    /Debian/: {
      file { '/etc/pam.d/common-account':
        content => template('sssd/common-account.erb'),
      }
      file { '/etc/pam.d/common-auth':
        content => template('sssd/common-auth.erb'),
      }
      file { '/etc/pam.d/common-password':
        content => template('sssd/common-password.erb'),
      }
      file { '/etc/pam.d/common-session':
        content => template('sssd/common-session.erb'),
      }
    }
    default: {
      fail("Module sssd is not supported on ${::osfamily}")
    }
  }
}
