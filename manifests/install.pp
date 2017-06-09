class ssh::install(
  String $package_name = $::ssh::package_name,
) {
  package { 'ssh_package': 
    ensure => present,
    name   => $package_name,
  }
}
