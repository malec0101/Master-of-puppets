class profile::nginx_rev_proxy_site_static_dynamic {
  include nginx

  nginx::resource::server { '192.168.56.5':
    ensure      => present,
    listen_port => 80,
  }
  nginx::resource::location{'/static':
    proxy  => 'http://192.168.56.6:8080' ,
    server => '192.168.56.5',
  }
  nginx::resource::location{'/dynamic':
    proxy  => 'http://192.168.56.7' ,
    server => '192.168.56.5',

  }
}



