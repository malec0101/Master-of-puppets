class profile::add_dynamic_site_on_apache {
  class { 'apache':
    default_vhost => false,
    }
    apache::vhost { 'dynamic':
      port       => 80,
      docroot    => '/var/www',
      servername => '192.168.56.7/dynamic'
  }
  file { '/var/www/dynamic':
    ensure  => directory,
    owner   => 'apache',
    group   => 'apache',
  }
  file { '/var/www/dynamic/index.php':
    ensure  => file,
    owner   => 'apache',
    group   => 'apache',
    content => file('examples/index.php'),
  }
  firewall { '100 allow http access':
    dport  => 80,
    proto  => 'tcp',
    jump   => 'accept',
  }
  include profile::php-fpm_apache 
}
