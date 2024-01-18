class profile::add_static_site_on_apache {
  class { 'apache':
    default_vhost => false,
  }
    apache::vhost { '192.168.56.6':
    docroot  => '/var/www/html',
    ip_based => true,
  }
}
