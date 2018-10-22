function ssh::data {
  $base_params = {
    'ssh::ensure'		=> 'present',
    'ssh::service_ensure'	=> 'running',
    'ssh::service_enable'	=> true,
    'ssh::permit_root_login'	=> false,
    'ssh::port'			=> 22,
  }
  
  $os_params = case $facts['os']['family'] {
      'Debian': {{
         'ssh::package_name'	=> 'openssh-server',
         'ssh::service_name'	=> 'ssh',
      }
    }
      'RedHat': {{
         'ssh::package_name'    => 'openssh-server',
         'ssh::service_name'    => 'sshd',
       }}
      default: {
        fail("${facts['operatingsystem']} is not supported")
      }
    }
  $base_params + $os_params
}
