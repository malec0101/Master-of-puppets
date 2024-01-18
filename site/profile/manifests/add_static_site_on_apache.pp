class profile::add_static_site_on_apache {
  class { 'apache':
    default_vhost     => false,
    default_ssl_vhost => false,
    apache::vhost { 'static':
    servername        => 'static',
    port              => 80,
    docroot           => '/var/www/html',
    }
}



