# configuer le produit ici
class mv_backup::params {

	$packages 				= ['lftp','rsync']
	#$service_name 			= ''
	$config_path 			= '/opt'
	
	# used to store tarball
	$temp_directory			= '/var/backup'
}
