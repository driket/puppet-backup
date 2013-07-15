class mv_backup::config {
	require('mv_backup::packages')
	
	file { "${mv_backup::config_path}/mv_backup":
  	ensure 	=> directory,
    mode 		=> "0755",
    owner 	=> 'root',
    group 	=> 'root',
		require => Package['mv_backup'],
  }
	
	case $method {

		'rsync': {

				# nothing to do

		}
		
	  'lftp': {
			
			file { "/root/.netrc":
		  	ensure 	=> file,
		    content => template("mv_backup/netrc.erb"),
		    mode 		=> "0600",
		    owner 	=> 'root',
		    group 	=> 'root',
				require => Package["mv_backup"],
		  }
	  }
		
	  default: {
			
	  	fail("Wrong backup method ${method} (rsync, lftp, etc.)")
	  }		
	} # end case method
}
