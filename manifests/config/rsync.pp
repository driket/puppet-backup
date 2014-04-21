define mv_backup::config::rsync (
	$server,
) 
{
	require('mv_backup::packages')
	require('mv_backup')
	
	file { "${mv_backup::config_path}/mv_backup/init_rsync.sh":
  	ensure 	=> file,
    content => template("mv_backup/init_rsync.sh.erb"),
    mode 		=> "0700",
    owner 	=> 'root',
    group 	=> 'root',
		require => File["${mv_backup::config_path}/mv_backup"],
  }
}
