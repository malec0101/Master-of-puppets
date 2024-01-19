class profile::php_install_version {
  class { '::php':
    ensure       => '7.4'
    manage_repos => true,
    fpm          => true,
    fpm_user     => 'apache'
    fpm_group    => 'apache'
   }
}

