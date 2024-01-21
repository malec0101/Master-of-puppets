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
  include role::rev_proxy_sites_static_dynamic
}

node 'slave1.puppet' {
  include role::apache_static_site
}

node 'slave2.puppet' {
  include role::apache_dynamic_site
}

node 'mineserver.puppet' {
  #  include role::apachedynamic_site
  #firewall { '101 open port 80':
  # dport  => 80,
  #  proto  => 'tcp',
  #  jump  => 'accept',
  #}
}
