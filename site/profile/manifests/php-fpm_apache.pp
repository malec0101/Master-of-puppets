class profile::php-fpm_apache {
    class { '::php':
    fpm          => true,
    fpm_user     => 'apache',
    fpm_group    => 'apache',
  }
}
