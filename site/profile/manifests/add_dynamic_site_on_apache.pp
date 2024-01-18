class profile::add_static_site_on_apache {
  class { 'apache':
    default_vhost => false,
  }
    apache::vhost { '192.168.56.7/dynamic':
    port            => 80,
    docroot         => '/var/www',
    virtual_docroot => '/var/www/%-2+',
    serveraliases   => ['*/dynamic',],
  }
}
