##
# Class sssd::params - Defines some variables used throughout the sssd module
class sssd::params {
  case $::osfamily {
    /RedHat/: {
      $package_name = 'sssd'
      $service_name = 'sssd'
      if ($::lsbmajdistrelease == 5) {
        $mkhomedir_name = 'oddjob'
        $has_sss_cache = false
      }
      else {
        $mkhomedir_name = 'oddjob-mkhomedir'
        $has_sss_cache = true
      }
    }
    /Debian/: {
      $package_name = [ 'sssd', 'libpam-sss', 'libnss-sss' ]
      $service_name = 'sssd'
      $mkhomedir_name = 'libpam-modules'
      $has_sss_cache = false
    }

    default: {
      fail("Unsupported OS Family: ${::osfamily}")
    }
  }
}

