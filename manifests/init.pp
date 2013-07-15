class mv_backup inherits mv_backup::params {
	include mv_backup::packages
	include mv_backup::config
	include mv_backup::service
}
