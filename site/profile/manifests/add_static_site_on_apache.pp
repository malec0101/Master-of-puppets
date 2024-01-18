class profile::add_static_site_on_apache {
  class { 'apache':
    default_vhost => false,
  }
    apache::vhost { '192.168.56.6/static':
    vhost_name      => '*'
    port            => [80, 8080],
    docroot         => '/var/www/static',
    virtual_docroot => '/var/www/%-2+',
    serveraliases   => ['*/static',],
  }
}
