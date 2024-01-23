class profile::add_dynamic_site_on_apache {
  class { 'apache':
    default_vhost => false,
    mpm_module    => 'prefork',
    }
    include apache::mod::php
    include '::php'

    apache::vhost { 'dynamic':
      port       => 80,
      docroot    => '/var/www/html',
      servername => '192.168.56.7/dynamic'
  }
  file { '/var/www/html/dynamic':
    ensure  => directory,
    owner   => 'apache',
    group   => 'apache',
  }
  file { '/var/www/html/dynamic/index.php':
    ensure  => file,
    owner   => 'apache',
    group   => 'apache',
    content => file('examples/index.php'),
  }
}
