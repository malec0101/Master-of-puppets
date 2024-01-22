class profile::nginx_rev_proxy_site_static_dynamic {
  include nginx

  nginx::resource::server { 'localhost:8080':
    ensure      => present,
    listen_port => 8080,
    proxy       => 'http://192.168.56.6:8080/static/',
  }

  nginx::resource::server { 'localhost:8081':
    ensure      => present,
    listen_port => 8081,
    proxy       => 'http://192.168.56.7/dynamic/',
  }
}  

