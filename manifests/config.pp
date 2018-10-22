class ssh::config (
  Boolean $permit_root_login = $::ssh::permit_root_login,
  Integer $port = $::ssh::port,
) {
  file { '/etc/ssh/sshd_config':
    ensure	=> file,
    mode	=> '0600',
    owner	=> 'root',
    group	=> 'root',
    content	=> template('ssh/sshd_config.erb'),
  }
}
