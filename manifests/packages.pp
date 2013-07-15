class mv_backup::packages {
	require('mv_backup::params')

	package {'mv_backup':
		name 		=> $mv_backup::params::packages,
		ensure 		=> present,
	}

}
