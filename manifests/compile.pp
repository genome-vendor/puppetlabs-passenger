class passenger::compile {

  exec { 'compile-passenger':
    command   => 'passenger-install-apache2-module -a',
    path      => [$passenger::gem_binary_path, dirname($passenger::passenger_ruby), "/usr/bin", "/bin"],
    creates   => $passenger::mod_passenger_location,
    require   => [Package[$passenger::package_dependencies]],
    logoutput => on_failure,
  }

}
