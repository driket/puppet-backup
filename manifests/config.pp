class mv_backup::config {
  require('mv_backup::packages')
  
  file { "${mv_backup::config_path}/mv_backup":
    ensure  => directory,
    mode    => "0755",
    owner   => 'root',
    group   => 'root',
    require => Package['lftp','rsync'],
  }
      
}
