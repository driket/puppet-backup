class mv_backup::packages {
	require('mv_backup::params')
	
	if ! defined(Package['lftp']) {
		package {'lftp':
			ensure => present,
		}
	}
	if ! defined(Package['rsync']) {
		package {'rsync':
			ensure => present,
		}
	}

}
