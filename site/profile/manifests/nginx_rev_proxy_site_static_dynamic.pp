class profile::nginx_rev_proxy_site_static_dynamic {
  class{"nginx":
    manage_repo => true,
    package_source => 'nginx-mainline'
  nginx::resource::location{'/': {
    listen_port => 80,
    proxy       => 'http://192.168.56.6:80' ,
    server      => '192.168.56.5',
  }
    listen_port => 80,
    proxy       => 'http://192.168.56.7:80' ,
    server      => '192.168.56.5',
  }
}
