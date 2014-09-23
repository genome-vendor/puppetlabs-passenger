class passenger::install {

  if $passenger::install_with_rbenv {
   rbenv::gem { "passenger":
      user   => $passenger::rbenv_user,
      ruby   => $passenger::rbenv_version,
      ensure => $passenger::passenger_version,
      require => Exec["rbenv::compile $passenger::rbenv_user $passenger::rbenv_version"],
    }
  } else {
    package { 'passenger':
      ensure   => $passenger::package_ensure,
      name     => $passenger::package_name,
      provider => $passenger::package_provider,
    }
  }

  if $passenger::package_dependencies {
    package { $passenger::package_dependencies:
      ensure => present,
    }
  }

}
