class profile::add_static_site_on_apache {
  class { 'apache':
    default_vhost => false,
    }
    apache::vhost { '192.168.56.7/dynamic':
      port    => [80, 8081],
      docroot => '/var/www/dynamic'
  }
  apache::vhost { '192.168.56.7':
    vhost_name      => '*',
    port            => 80,
    virtual_docroot => '/var/www/%-2+',
    docroot         => '/var/www',
    serveraliases   => ['*.dynamic',],

  }
}
