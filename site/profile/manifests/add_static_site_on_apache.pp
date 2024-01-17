class profile::add_static_site_on_apache {
  class { 'apache':
    virtual_host_name => 'static'
  }
}




