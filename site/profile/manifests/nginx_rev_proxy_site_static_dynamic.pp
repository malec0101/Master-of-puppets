class profile::nginx_rev_proxy_site_static_dynamic {
  class { 'nginx':
  }
    nginx::resource::server { '192.168.56.5':
      www_root => '/opt/html/',
  }


    nginx::resource::location { '/static':
      proxy  => 'http://192.168.56.6:8080',
      server => '192.168.56.5',
    }
}
