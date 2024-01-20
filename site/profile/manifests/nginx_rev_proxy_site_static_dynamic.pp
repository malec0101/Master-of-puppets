class profile::nginx_rev_proxy {
  nginx::resource::server { '192.168.56.5':
    listen_port => 80,
    proxy       => 'http://192.168.56.6',
  }
  nginx::resource::server { '192.168.56.5':
    listen_port => 80,
    proxy       => 'http://192.168.56.7',
  }
}
