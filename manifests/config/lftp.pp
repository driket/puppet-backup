define mv_backup::config::lftp (
	$server,
	$login,
	$password, 
) 
{
	require('mv_backup::packages')
	require('mv_backup')

	file { "/root/.netrc":
  	ensure 	=> file,
    content => template("mv_backup/netrc.erb"),
    mode 		=> "0600",
    owner 	=> 'root',
    group 	=> 'root',
		require => Package["tzdata", "language-pack-fr"],
  }
}
