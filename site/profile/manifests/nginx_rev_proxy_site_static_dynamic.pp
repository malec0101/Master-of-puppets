class profile::nginx_rev_proxy_site_static_dynamic {
  class { 'nginx':
  }

  nginx::resource::upstream { 'upstream_app':
    members => {
      '192.168.56.6:80' => {
        server => '192.168.56.6',
        port   => 80,
      }
      '192.168.56.7:80' => {
        server => '192.168.56.7',
        port   => 80,
      }
    }
  }

  nginx::resource::location{'/': {
    listen_port => 80,
    proxy       => 'http://upstream_app/',
    server      => '192.168.56.5'
  }
}
