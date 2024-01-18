class profile::add_static_site_on_apache {
  class { 'apache':
    default_vhost => false,
  }
  apache::vhost { 'static':
  ip       => '192.168.56.6',
  docroot  => '/var/www/html/static',
  ip_based => true,
  }
}
