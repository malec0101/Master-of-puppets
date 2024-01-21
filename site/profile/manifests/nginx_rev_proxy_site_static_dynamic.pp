class profile::nginx_rev_proxy_site_static_dynamic {
  class { 'nginx':
  }
    nginx::resource::upstream { 'upstream_app':
    members => {
      '192.168.56.6:80' => {
        server => '192.168.56.6',
        port   => 8080,
      },
      '192.168.56.7:80' => {
        server => '192.168.56.7',
        port   => 80,
      },
    }
  }
    nginx::resource::server { '192.168.56.5':
      www_root => '/opt/html/',
  }


    nginx::resource::location { '/':
      listen_port => 80,
      proxy       => 'http://upstream_app/',
      server      => '192.168.56.5'
    }
}
