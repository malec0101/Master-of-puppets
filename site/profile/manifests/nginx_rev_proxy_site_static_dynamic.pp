class profile::nginx_rev_proxy_site_static_dynamic {
  class { "nginx":
    manage_repo    => true,
    package_source => 'nginx-mainline'

  }
  nginx::resource::server{'192.168.56.5':
    www_root => '/opt/html/',
  }

  nginx::resource::location{'/': {
    listen_port => 80,
    proxy       => 'http://192.168.56.6:80' ,
  }
    listen_port => 80,
    proxy       => 'http://192.168.56.7:80' ,
  }
}
