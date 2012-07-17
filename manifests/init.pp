class sssd (
	$domainname = "default",
	$filter_groups = "root",
	$filter_users = "root",
	$ldap_uri = "",
	$ldap_search_base = "",
	$krb5_realm = "",
	$krb5_server = "",
	$krb5_kdcip = "",
	$krb5_kpasswd = "",
	)
{
    include sssd::params, sssd::install, sssd::config, sssd::service
}
