class profile::add_static_site_on_apache {
  class { 'apache':
    default_vhost => false,
    }
    apache::vhost { '192.168.56.7/dynamic':
      port       => 80,
      vhost_name => '192.168.56.7/dynamic',
      docroot    => '/var/www/dynamic'
  }
}
