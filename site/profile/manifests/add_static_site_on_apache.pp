class profile::add_static_site_on_apache {
  class { 'apache':
    default_vhost => false,
    }
    apache::vhost { '192.168.56.6/static':
      vhost_name      => '192.168.56.6/static'
      port            => 80,
      docroot         => '/var/www/static',
  }
}
