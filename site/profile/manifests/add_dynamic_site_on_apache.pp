class profile::add_static_site_on_apache {
  class { 'apache':
    default_vhost => false,
  }
    apache::vhost { '192.168.56.7':
    port            => 80,
    vhost_name      => '*'
    virtual_docroot => '/var/www/%-2+',
    docroot         => '/var/www'
    serveraliases   => ['*/dynamic',],
  }
}
