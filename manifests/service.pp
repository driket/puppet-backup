class mv_backup::service {

	#service { 'mv_backup':
	#	name 		=> $mv_backup::service_name,
	#	ensure 		=> running,
	#	require 	=> Package['mv_backup'],
	#}
}
