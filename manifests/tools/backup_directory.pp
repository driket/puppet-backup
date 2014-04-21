define mv_backup::tools::backup_directory (	
	$directory, 
	$server,
	$method,
	$lftp_options 		= {
		args => "--reverse --delete --only-newer"
	},
	$ssh_options 		= {
		args => "-Rf",	
	},
	$rsync_options 	= {
		args => "-avz --numeric-ids --delete",
	},
	$remote_url,
	$tarball 				= false,
	$hour 					= "*", 
	$minute 				= "30", 
	$monthday 			= "*", 
	$month 					= "*",
	$weekday 				= "*",
	$temp_directory = $mv_backup::params::temp_directory)
{
	require('mv_backup::packages')
	require('mv_backup')
	
	file { "${mv_backup::config_path}/mv_backup/${name}.sh":
  	ensure 	=> file,
    content => template("mv_backup/backup_directory.sh.erb"),
    mode 		=> "0755",
    owner 	=> 'root',
    group 	=> 'root',
		require => File["${mv_backup::config_path}/mv_backup"],
  }
	
  cron { "${name}":
		command 	=> "${mv_backup::config_path}/mv_backup/${name}.sh",
    user 			=> root,
    hour 			=> $hour,
    minute 		=> $minute,
    monthday 	=> $monthday,
    month 		=> $month,
    weekday 	=> $weekday,
    require 	=> File["${mv_backup::config_path}/mv_backup/${name}.sh"],
  }
	
}