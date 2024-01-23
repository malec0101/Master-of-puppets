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

node 'master.puppet' {
  include profile::nginx_rev_proxy_site_static_dynamic
}

node 'slave1.puppet' {
  include role::apache_static_site
}

node 'slave2.puppet' {
  include role::apache_dynamic_site
}

node 'mineserver.puppet' {
  class { 'minecraft_serv':
    $Xmx = 1024m, 
    $Xms = 512m,
  }
}
