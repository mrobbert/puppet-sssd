##
# Class sssd::params - Defines some variables used throughout the sssd module
class sssd::params {
  case $::osfamily {
    /RedHat/: {
      $package_name = 'sssd'
      $service_name = 'sssd'
      if ($::lsbmajdisrelease == 5) {
        $mkhomedir_name = 'oddjob'
      }
      else {
        $mkhomedir_name = 'oddjob-mkhomedir'
      }
    }
    /Debian/: {
      $package_name = [ 'sssd', 'libpam-sss', 'libnss-sss' ]
      $service_name = 'sssd'
      $mkhomedir_name = 'libpam-modules'
    }

    default: {
      fail("Unsupported OS Family: ${::osfamily}")
    }
  }
}

