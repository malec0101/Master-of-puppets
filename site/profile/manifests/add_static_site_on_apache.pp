class profile::add_static_site_on_apache {
  class { 'apache':
    default_vhost => false,
    }
    apache::vhost { 'static':
      port       => 80,
      docroot    => '/var/www',
      servername => '192.168.56.6/static'
    }
    file { '/var/www/static':
      ensure  => directory,
      owner   => 'apache',
      group   => 'apache',
    }
    file { '/var/www/static/index.html':
      ensure  => file,
      owner   => 'apache',
      group   => 'apache',
      content => file('examples/index.html'),
    }
    firewall { '101 allow http access':
      dport  => 80,
      proto  => 'tcp',
      jump   => 'accept',
  }
}

