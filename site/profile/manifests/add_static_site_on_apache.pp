class profile::add_static_site_on_apache {
  class { 'apache':
    default_vhost => false,
    }
    apache::vhost { 'static':
      port       => [80, 8080],
      docroot    => '/var/www/html',
      servername => '192.168.56.6/static'
    }
    file { '/var/www/html/static':
      ensure  => directory,
      owner   => 'apache',
      group   => 'apache',
    }
    file { '/var/www/html/static/index.html':
      ensure  => file,
      owner   => 'apache',
      group   => 'apache',
      content => file('examples/index.html'),
    }
}

