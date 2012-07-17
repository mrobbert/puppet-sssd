class sssd::config {
	file { "/etc/nsswitch.conf":
		ensure	=> present,
		owner	=> root,
		group	=> root,
		mode	=> 0644,
		content	=> template("sssd/nsswitch.conf.erb"),
		require	=> Class["sssd::install"],
		notify	=> Class["sssd::service"],
	}

	file { "/etc/sssd/sssd.conf":
		ensure	=> present,
		owner	=> root,
		group	=> root,
		mode	=> 0600,
		content	=> template("sssd/sssd.conf.erb"),
		require	=> Class["sssd::install"],
		notify	=> Class["sssd::service"],
	}
}
