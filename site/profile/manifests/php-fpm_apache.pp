class profile::php-fpm_apache {
  
  include profile::php_install_version

    class { '::php':
    fpm          => true,
    fpm_user     => 'apache',
    fpm_group    => 'apache',
  }
}
