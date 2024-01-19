class profile::add_dynamic_site_on_apache {
  class { 'apache':
    default_vhost => false,
    }
    apache::vhost { 'dynamic':
      port       => 80,
      docroot    => '/var/www/dynamic',
      servername => '192.168.56.7/dynamic'
  }
  file { '/var/www/dynamic/index.php':
    owner   => 'apache'
    group   => 'apache'
    content => file('examples/index.php')
  }
}
