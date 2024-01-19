# <ENVIRONMENTS DIRECTORY>/<ENVIRONMENT>/manifests/site.pp

############## Firewall #######################
resources { 'firewall':
    purge => true,
  }
Firewall {
    before  => Class['my_fw::post'],
    require => Class['my_fw::pre'],
  }

  class { ['my_fw::pre', 'my_fw::post']: }
###############################################

# default minimal conf 
node 'default' {
  include profile::install_my_default_pkg
}

node 'slave1.puppet' {
  include role::apache_static_site
}

node 'slave2.puppet' {
  include role::apache_dynamic_site
}
