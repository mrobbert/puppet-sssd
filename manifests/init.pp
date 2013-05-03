##
# Class sssd - Installs and configures the SSSD package for authentication
# and authorization
class sssd (
  $domainname = 'default',
  $filter_groups = 'root',
  $filter_users = 'root',
  $ldap_uri = '',
  $ldap_search_base = '',
  $ldap_user_search_base = '',
  $ldap_group_search_base = '',
  $ldap_tls_cacert = '',
  $ldap_tls_reqcert = '',
  $krb5_realm = '',
  $krb5_server = '',
  $krb5_validate = true,
  $krb5_kdcip = '',
  $krb5_kpasswd = '',
  $enable_pam = false,
  )
{
    include sssd::params, sssd::install, sssd::config, sssd::service
}
