class profile::add_static_site_on_apache {
  class { 'apache':
    default_vhost => false,
    }
    apache::vhost { 'static':
      port       => 80,
      docroot    => '/var/www/static',
      servername => '192.168.56.6/static'
    }
    file { '/var/www/static/index.html':
      ensure  => file,
      owner   => 'apache',
      group   => 'apache',
      content => file('examples/index.html'),
    }
}

