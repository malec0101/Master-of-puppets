class profile::add_static_site_on_apache {
  class { 'apache':
    default_vhost => false,
    }
    apache::vhost { '192.168.56.7/dynamic':
      vhost_name => '192.168.56.7/dynamic'
      port       => 80,
      docroot    => '/var/www/dynamic'
  }
}
