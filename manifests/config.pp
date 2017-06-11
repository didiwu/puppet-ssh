class ssh::config ( 
  $permit_root_login = $::ssh::permit_root_login,
  $port = $::ssh::port,
) {
  case $facts['os']['family'] {
    'RedHat', 'CentOS': {
      $template_file = $facts['os']['release']['major'] ? {
        '6' => 'sshd_config_el6.erb',
        '7' => 'sshd_config_el7.erb',
      }
    }
    'Ubuntu', 'Debian': {
      $config_file = 'sshd_config_ubuntu'
    }
  }
  file { '/etc/ssh/sshd_config':
    ensure   => file,
    mode     => '0600',
    owner    => 'root',
    group    => 'root',
    content  => template("ssh/${template_file}"),
  }
}
